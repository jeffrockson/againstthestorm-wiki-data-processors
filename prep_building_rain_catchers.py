#!/usr/bin/env python3
"""
Rain Catcher data preprocessor for Against the Storm wiki.
Converts JSON rain catcher data into Lua table format conforming to Building and Recipe classes.
"""

import json
import sys
from typing import Dict, Any

def transform_rain_catcher_recipes(rain_catcher: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure.
    Converts from flat array to nested table organized by [productID][grade][stackSize].
    """
    if "recipes" not in rain_catcher or not rain_catcher["recipes"]:
        rain_catcher["recipes"] = {}
        return rain_catcher
    
    # Create the nested structure
    recipe_list = {}
    
    for recipe in rain_catcher["recipes"]:
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
            "_buildings": [rain_catcher["id"]],  # The building that can make this recipe
            "_grade": grade,
            "_time": recipe["productionTime"],
            "_productPair": {
                "_id": product_id,
                "_amount": stack_size
            },
            "_isService": False,  # Assume products, not services
            "_extraProductChances": [],
            "_ingredients": []  # Rain catchers have no ingredients
        }
        
        # Store in nested structure
        recipe_list[product_id][grade][stack_size] = recipe_obj
    
    rain_catcher["recipes"] = recipe_list
    return rain_catcher

def convert_rain_catcher_to_lua(rain_catcher: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single rain catcher dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    rain_catcher = transform_rain_catcher_recipes(rain_catcher)
    
    lua_lines = []
    lua_lines.append(f'    ["{rain_catcher["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{rain_catcher["id"]}",')
    lua_lines.append(f'        _displayName = "{rain_catcher["displayName"]}",')
    lua_lines.append(f'        _description = "{rain_catcher["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{rain_catcher["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {rain_catcher["sizeX"]},')
    lua_lines.append(f'        _sizeY = {rain_catcher["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {rain_catcher["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {rain_catcher["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(rain_catcher["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(rain_catcher["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {rain_catcher["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in rain_catcher and rain_catcher["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(rain_catcher["requiredGoods"]):
            comma = "," if i < len(rain_catcher["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in rain_catcher and rain_catcher["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(rain_catcher["tags"]):
            comma = "," if i < len(rain_catcher["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "baseTankCapacity" in rain_catcher:
        lua_lines.append(f'        _baseTankCapacity = {rain_catcher["baseTankCapacity"]},')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in rain_catcher and rain_catcher["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in rain_catcher["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{rain_catcher["id"]}"}},')
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
    Convert JSON rain catcher data to Lua table format.
    """
    try:
        rain_catchers = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(rain_catchers, list):
        print("Error: Expected JSON array of rain catchers", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, rain_catcher in enumerate(rain_catchers):
        lua_lines.append(convert_rain_catcher_to_lua(rain_catcher, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process rain catcher JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing rain catchers: {e}") from e

def main():
    """
    External entry point for the rain catcher preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Resource Acquisition")
        print(lua_output)
    except Exception as e:
        print(f"Error processing rain catchers: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()