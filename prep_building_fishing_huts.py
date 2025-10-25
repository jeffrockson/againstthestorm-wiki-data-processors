#!/usr/bin/env python3
"""
Fishing Hut data preprocessor for Against the Storm wiki.
Converts JSON fishing hut data into Lua table format conforming to Building and Recipe classes.
"""

import json
import sys
from typing import Dict, Any

def transform_fishing_hut_recipes(fishing_hut: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure for fishing huts.
    Fishing huts seek deposits and produce 1 unit of that good.
    """
    if "recipes" not in fishing_hut or not fishing_hut["recipes"]:
        fishing_hut["recipes"] = {}
        return fishing_hut
    
    # Create fishing hut-specific recipe structure
    recipe_list = {}
    
    for recipe in fishing_hut["recipes"]:
        product_id = recipe["seekedDeposits"]
        grade = int(recipe["grade"].replace("Grade", ""))
        stack_size = 1  # Fishing huts always produce 1 unit
        gathering_time = recipe["gatheringTime"]
        
        # Initialize nested structure if needed
        if product_id not in recipe_list:
            recipe_list[product_id] = {}
        if grade not in recipe_list[product_id]:
            recipe_list[product_id][grade] = {}
        
        # Create the recipe object for fishing huts
        recipe_obj = {
            "_buildings": [fishing_hut["id"]],
            "_grade": grade,
            "_time": gathering_time,
            "_productPair": {
                "_id": product_id,
                "_amount": stack_size
            },
            "_isService": False,  # Fishing huts produce goods
            "_ingredients": []  # Fishing huts don't consume ingredients
        }
        
        # Store in nested structure
        recipe_list[product_id][grade][stack_size] = recipe_obj
    
    fishing_hut["recipes"] = recipe_list
    return fishing_hut

def convert_fishing_hut_to_lua(fishing_hut: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single fishing hut dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    fishing_hut = transform_fishing_hut_recipes(fishing_hut)
    
    lua_lines = []
    lua_lines.append(f'    ["{fishing_hut["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{fishing_hut["id"]}",')
    lua_lines.append(f'        _displayName = "{fishing_hut["displayName"]}",')
    lua_lines.append(f'        _description = "{fishing_hut["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{fishing_hut["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {fishing_hut["sizeX"]},')
    lua_lines.append(f'        _sizeY = {fishing_hut["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {fishing_hut["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {fishing_hut["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(fishing_hut["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(fishing_hut["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {fishing_hut["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in fishing_hut and fishing_hut["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(fishing_hut["requiredGoods"]):
            comma = "," if i < len(fishing_hut["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in fishing_hut and fishing_hut["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(fishing_hut["tags"]):
            comma = "," if i < len(fishing_hut["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Fishing hut-specific fields
    if "area" in fishing_hut:
        lua_lines.append(f'        _area = {fishing_hut["area"]},')
    
    if "bait" in fishing_hut:
        lua_lines.append(f'        _bait = {{_id = "{fishing_hut["bait"]["name"]}", _amount = {fishing_hut["bait"]["amount"]}}},')
    
    if "baitIngredient" in fishing_hut:
        lua_lines.append(f'        _baitIngredient = {{_id = "{fishing_hut["baitIngredient"]["name"]}", _amount = {fishing_hut["baitIngredient"]["amount"]}}},')
    
    if "baitMultiplier" in fishing_hut:
        lua_lines.append(f'        _baitMultiplier = {fishing_hut["baitMultiplier"]},')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in fishing_hut and fishing_hut["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in fishing_hut["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{fishing_hut["id"]}"}},')
                    lua_lines.append(f'                        _grade = {recipe["_grade"]},')
                    lua_lines.append(f'                        _time = {recipe["_time"]},')
                    lua_lines.append(f'                        _productPair = {{_id = "{recipe["_productPair"]["_id"]}", _amount = {recipe["_productPair"]["_amount"]}}},')
                    lua_lines.append(f'                        _isService = {str(recipe["_isService"]).lower()},')
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
    Convert JSON fishing hut data to Lua table format.
    """
    try:
        fishing_huts = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(fishing_huts, list):
        print("Error: Expected JSON array of fishing huts", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, fishing_hut in enumerate(fishing_huts):
        lua_lines.append(convert_fishing_hut_to_lua(fishing_hut, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process fishing hut JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing fishing huts: {e}") from e

def main():
    """
    External entry point for the fishing hut preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Resource Acquisition")
        print(lua_output)
    except Exception as e:
        print(f"Error processing fishing huts: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
