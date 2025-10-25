#!/usr/bin/env python3
"""
Mine data preprocessor for Against the Storm wiki.
Converts JSON mine data into Lua table format conforming to Building and Recipe classes.
"""

import json
import sys
from typing import Dict, Any
from etl_utility import append_building_common_fields

def transform_mine_recipes(mine: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure.
    Converts from flat array to nested table organized by [productID][grade][stackSize].
    """
    if "recipes" not in mine or not mine["recipes"]:
        mine["recipes"] = {}
        return mine
    
    # Create the nested structure
    recipe_list = {}
    
    for recipe in mine["recipes"]:
        product_id = recipe["product"]["name"]
        grade = int(recipe["grade"].replace("Grade", ""))  # Convert "Grade2" to 2
        stack_size = recipe["product"]["amount"]
        
        # Initialize nested structure if needed
        if product_id not in recipe_list:
            recipe_list[product_id] = {}
        if grade not in recipe_list[product_id]:
            recipe_list[product_id][grade] = {}
        
        # Create the recipe object
        recipe_obj = {
            "_buildings": [mine["id"]],  # The building that can make this recipe
            "_grade": grade,
            "_time": recipe["productionTime"],
            "_productPair": {
                "_id": product_id,
                "_amount": stack_size
            },
            "_isService": False,  # Assume products, not services
            "_extraProductChances": [],
            "_ingredients": []
        }
        
        # Handle extra products if present
        if "extraProducts" in recipe and recipe["extraProducts"]:
            for extra_product in recipe["extraProducts"]:
                recipe_obj["_extraProductChances"].append({
                    "_id": extra_product["name"],
                    "_amount": extra_product["amount"],
                    "_chance": extra_product["chance"]
                })
        
        # Transform ingredients array (if present)
        if "ingredients" in recipe and recipe["ingredients"]:
            for ingredient_group in recipe["ingredients"]:
                ingredient_slot = []
                for ingredient in ingredient_group:
                    ingredient_slot.append({
                        "_id": ingredient["name"],
                        "_amount": ingredient["amount"]
                    })
                recipe_obj["_ingredients"].append(ingredient_slot)
        
        # Store in nested structure
        recipe_list[product_id][grade][stack_size] = recipe_obj
    
    mine["recipes"] = recipe_list
    return mine

def convert_mine_to_lua(mine: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single mine dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    mine = transform_mine_recipes(mine)
    
    lua_lines = []
    lua_lines.append(f'    ["{mine["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines = append_building_common_fields(lua_lines, mine, display_category)
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in mine and mine["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(mine["requiredGoods"]):
            comma = "," if i < len(mine["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in mine and mine["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(mine["tags"]):
            comma = "," if i < len(mine["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "storage" in mine:
        lua_lines.append(f'        _storage = {mine["storage"]},')
    
    if "waterUsed" in mine:
        lua_lines.append(f'        _waterUsed = "{mine["waterUsed"]}",')
    
    # MINE-SPECIFIC FIELD: Levels
    if "levels" in mine and mine["levels"]:
        # Filter out empty levels
        non_empty_levels = [level for level in mine["levels"] 
                           if (level.get("requiredGoods") and any(level["requiredGoods"])) 
                           or (level.get("options") and any(level["options"]))]
        
        if non_empty_levels:
            lua_lines.append('        _levels = {')
            for level_idx, level in enumerate(non_empty_levels):
                lua_lines.append('            {')
                
                # Upgrade costs for this level
                if "requiredGoods" in level and level["requiredGoods"]:
                    lua_lines.append('                _upgradeCostOptions = {')
                    for req_idx, req_group in enumerate(level["requiredGoods"]):
                        lua_lines.append('                    {')
                        if "goods" in req_group and req_group["goods"]:
                            for good_idx, good in enumerate(req_group["goods"]):
                                comma = "," if good_idx < len(req_group["goods"]) - 1 else ""
                                lua_lines.append(f'                        {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
                        if req_idx < len(level["requiredGoods"]) - 1:
                            lua_lines.append('                    },')
                        else:
                            lua_lines.append('                    }')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgradeCostOptions = {},')
                
                # Upgrades for this level
                if "options" in level and level["options"]:
                    lua_lines.append('                _upgrades = {')
                    for opt_idx, option in enumerate(level["options"]):
                        comma = "," if opt_idx < len(level["options"]) - 1 else ""
                        lua_lines.append(f'                    "{option}"{comma}')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgrades = {},')
                
                level_comma = "," if level_idx < len(non_empty_levels) - 1 else ""
                lua_lines.append(f'            }}{level_comma}')
            lua_lines.append('        },')
        else:
            lua_lines.append('        _levels = {},')
    else:
        lua_lines.append('        _levels = {},')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in mine and mine["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in mine["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{mine["id"]}"}},')
                    lua_lines.append(f'                        _grade = {recipe["_grade"]},')
                    lua_lines.append(f'                        _time = {recipe["_time"]},')
                    lua_lines.append(f'                        _productPair = {{_id = "{recipe["_productPair"]["_id"]}", _amount = {recipe["_productPair"]["_amount"]}}},')
                    lua_lines.append(f'                        _isService = {str(recipe["_isService"]).lower()},')
                    if recipe["_extraProductChances"]:
                        lua_lines.append('                        _extraProductChances = {')
                        for extra_idx, extra_product in enumerate(recipe["_extraProductChances"]):
                            comma = "," if extra_idx < len(recipe["_extraProductChances"]) - 1 else ""
                            lua_lines.append(f'                            {{_id = "{extra_product["_id"]}", _amount = {extra_product["_amount"]}, _chance = {extra_product["_chance"]}}}{comma}')
                        lua_lines.append('                        },')
                    else:
                        lua_lines.append('                        _extraProductChances = {},')
                    if recipe["_ingredients"]:
                        lua_lines.append('                        _ingredients = {')
                        for slot_idx, ingredient_slot in enumerate(recipe["_ingredients"]):
                            lua_lines.append('                            {')
                            for opt_idx, option in enumerate(ingredient_slot):
                                comma = "," if opt_idx < len(ingredient_slot) - 1 else ""
                                lua_lines.append(f'                                {{_id = "{option["_id"]}", _amount = {option["_amount"]}}}{comma}')
                            slot_comma = "," if slot_idx < len(recipe["_ingredients"]) - 1 else ""
                            lua_lines.append(f'                            }}{slot_comma}')
                        lua_lines.append('                        },')
                    else:
                        lua_lines.append('                        _ingredients = {},')
                    lua_lines.append('                    },')
                lua_lines.append('                },')
            lua_lines.append('            },')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _recipes = {},')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str, display_category: str) -> str:
    """
    Convert JSON mine data to Lua table format.
    """
    try:
        mines = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(mines, list):
        print("Error: Expected JSON array of mines", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, mine in enumerate(mines):
        lua_lines.append(convert_mine_to_lua(mine, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process mine JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing mines: {e}") from e

def main():
    """
    External entry point for the mine preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Extraction Building")
        print(lua_output)
    except Exception as e:
        print(f"Error processing mines: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
