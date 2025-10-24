#!/usr/bin/env python3
"""
Blight Post data preprocessor for Against the Storm wiki.
Converts JSON data file into Lua table file.
"""

import json
import sys
from typing import Dict, Any

def transform_blight_recipes(blight_post: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure.
    Converts from flat array to nested table organized by [productID][grade][stackSize].
    """
    if "recipes" not in blight_post or not blight_post["recipes"]:
        blight_post["recipes"] = {}
        return blight_post
    
    # Create the nested structure
    recipe_list = {}
    
    for recipe in blight_post["recipes"]:
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
            "_buildings": [blight_post["id"]],  # The building that can make this recipe
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
    
    blight_post["recipes"] = recipe_list
    return blight_post

def convert_blight_post_to_lua(blight_post: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single blight post dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    blight_post = transform_blight_recipes(blight_post)
    
    lua_lines = []
    lua_lines.append(f'    ["{blight_post["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{blight_post["id"]}",')
    lua_lines.append(f'        _displayName = "{blight_post["displayName"]}",')
    lua_lines.append(f'        _description = "{blight_post["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{blight_post["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {blight_post["sizeX"]},')
    lua_lines.append(f'        _sizeY = {blight_post["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {blight_post["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {blight_post["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(blight_post["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(blight_post["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {blight_post["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in blight_post and blight_post["requiredGoods"]:
        lua_lines.append('        _requiredGoods = {')
        for i, good in enumerate(blight_post["requiredGoods"]):
            comma = "," if i < len(blight_post["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _requiredGoods = {},')
    
    # Tags array (Specialization[])
    if "tags" in blight_post and blight_post["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(blight_post["tags"]):
            comma = "," if i < len(blight_post["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "storage" in blight_post:
        lua_lines.append(f'        _storage = {blight_post["storage"]},')
    
    if "timePerCyst" in blight_post:
        lua_lines.append(f'        _timePerCyst = {blight_post["timePerCyst"]},')
    
    if "waterUsed" in blight_post:
        lua_lines.append(f'        _waterUsed = "{blight_post["waterUsed"]}",')
    
    # Levels array (unique to blight posts) - skip empty levels
    if "levels" in blight_post and blight_post["levels"]:
        # Filter out empty levels (no requiredGoods and no options)
        non_empty_levels = []
        for level in blight_post["levels"]:
            has_required_goods = "requiredGoods" in level and level["requiredGoods"] and any(
                "goods" in req_group and req_group["goods"] 
                for req_group in level["requiredGoods"]
            )
            has_options = "options" in level and level["options"]
            
            if has_required_goods or has_options:
                non_empty_levels.append(level)
        
        if non_empty_levels:
            lua_lines.append('        _levels = {')
            for level_idx, level in enumerate(non_empty_levels):
                lua_lines.append('            {')
                
                # Required goods for this level (UpgradeCost[])
                if "requiredGoods" in level and level["requiredGoods"]:
                    lua_lines.append('                _upgradeCostOptions = {')
                    for _, req_group in enumerate(level["requiredGoods"]):
                        lua_lines.append('                    {')
                        if "goods" in req_group and req_group["goods"]:
                            for good_idx, good in enumerate(req_group["goods"]):
                                comma = "," if good_idx < len(req_group["goods"]) - 1 else ""
                                lua_lines.append(f'                        {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
                        lua_lines.append('                    },')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgradeCostOptions = {},')
                
                # Options for this level (UpgradeID[])
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
    if "recipes" in blight_post and blight_post["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in blight_post["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{blight_post["id"]}"}},')
                    lua_lines.append(f'                        _grade = {recipe["_grade"]},')
                    lua_lines.append(f'                        _time = {recipe["_time"]},')
                    lua_lines.append(f'                        _productPair = {{_id = "{recipe["_productPair"]["_id"]}", _amount = {recipe["_productPair"]["_amount"]}}},')
                    lua_lines.append(f'                        _isService = {str(recipe["_isService"]).lower()},')
                    # Only include _extraProductChances if there's data
                    if recipe["_extraProductChances"]:
                        lua_lines.append('                        _extraProductChances = {')
                        for extra_idx, extra_product in enumerate(recipe["_extraProductChances"]):
                            comma = "," if extra_idx < len(recipe["_extraProductChances"]) - 1 else ""
                            lua_lines.append(f'                            {{_id = "{extra_product["_id"]}", _amount = {extra_product["_amount"]}, _chance = {extra_product["_chance"]}}}{comma}')
                        lua_lines.append('                        },')
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
    Convert JSON blight post data to Lua table format.
    """
    try:
        blight_posts = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(blight_posts, list):
        print("Error: Expected JSON array of blight posts", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, blight_post in enumerate(blight_posts):
        lua_lines.append(convert_blight_post_to_lua(blight_post, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process blight post JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing blight posts: {e}") from e

def main():
    """
    External entry point for the blight post preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Production Building")
        print(lua_output)
    except Exception as e:
        print(f"Error processing blight posts: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
