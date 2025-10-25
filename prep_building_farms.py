#!/usr/bin/env python3
"""
Farm data preprocessor for Against the Storm wiki.
Converts JSON data file into Lua table file.
Handles both Farms.json and Farmfields.json.
"""

import json
import sys
from typing import Dict, Any

def transform_farm_recipes(farm: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure.
    Converts from flat array to nested table organized by [productID][grade][stackSize].
    For farms, we use plantingTime + harvestingTime as the total production time.
    """
    if "recipes" not in farm or not farm["recipes"]:
        farm["recipes"] = {}
        return farm
    
    # Create the nested structure
    recipe_list = {}
    
    for recipe in farm["recipes"]:
        product_id = recipe["product"]["name"]
        grade = int(recipe["grade"].replace("Grade", ""))  # Convert "Grade2" to 2
        stack_size = recipe["product"]["amount"]
        
        # Initialize nested structure if needed
        if product_id not in recipe_list:
            recipe_list[product_id] = {}
        if grade not in recipe_list[product_id]:
            recipe_list[product_id][grade] = {}
        
        # Calculate total production time (planting + harvesting)
        total_time = recipe["plantingTime"] + recipe["harvestingTime"]
        
        # Create the recipe object
        recipe_obj = {
            "_buildings": [farm["id"]],  # The building that can make this recipe
            "_grade": grade,
            "_time": total_time,
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
    
    farm["recipes"] = recipe_list
    return farm

def convert_farm_to_lua(farm: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single farm dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    farm = transform_farm_recipes(farm)
    
    lua_lines = []
    lua_lines.append(f'    ["{farm["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{farm["id"]}",')
    lua_lines.append(f'        _displayName = "{farm["displayName"]}",')
    lua_lines.append(f'        _description = "{farm["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{farm["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {farm["sizeX"]},')
    lua_lines.append(f'        _sizeY = {farm["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {farm["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {farm["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(farm["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(farm["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {farm["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in farm and farm["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(farm["requiredGoods"]):
            comma = "," if i < len(farm["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in farm and farm["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(farm["tags"]):
            comma = "," if i < len(farm["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "storage" in farm:
        lua_lines.append(f'        _storage = {farm["storage"]},')
    
    if "area" in farm:
        lua_lines.append(f'        _area = {farm["area"]},')
    
    if "waterUsed" in farm:
        lua_lines.append(f'        _waterUsed = "{farm["waterUsed"]}",')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in farm and farm["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in farm["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{farm["id"]}"}},')
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
    Convert JSON farm data to Lua table format.
    """
    try:
        farms = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(farms, list):
        print("Error: Expected JSON array of farms", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, farm in enumerate(farms):
        lua_lines.append(convert_farm_to_lua(farm, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process farm JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing farms: {e}") from e

def main():
    """
    External entry point for the farm preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Farm")
        print(lua_output)
    except Exception as e:
        print(f"Error processing farms: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
