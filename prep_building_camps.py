#!/usr/bin/env python3
"""
Camp data preprocessor for Against the Storm wiki.
Converts JSON camp data into Lua table format conforming to Building and Recipe classes.
"""

import json
import sys
from typing import Dict, Any

def transform_camp_recipes(camp: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure for camps.
    Camps seek deposits and produce 1 unit of that good.
    """
    if "recipes" not in camp or not camp["recipes"]:
        camp["recipes"] = {}
        return camp
    
    # Get the gathering time (same for all recipes in a camp)
    gathering_time = camp["recipes"][0]["gatheringTime"] if camp["recipes"] else 0.0
    
    # Create camp-specific recipe structure
    recipe_list = {}
    
    for recipe in camp["recipes"]:
        product_id = None
        if "seekedDeposits" not in recipe:
            product_id = recipe["seekedResource"]
        else:
            product_id = recipe["seekedDeposits"]
        grade = 0
        if "grade" in recipe:
            grade = int(recipe["grade"].replace("Grade", ""))
        stack_size = 1  # Camps always produce 1 unit
        
        # Initialize nested structure if needed
        if product_id not in recipe_list:
            recipe_list[product_id] = {}
        if grade not in recipe_list[product_id]:
            recipe_list[product_id][grade] = {}
        
        # Create the recipe object for camps
        recipe_obj = {
            "_buildings": [camp["id"]],
            "_grade": grade,
            "_time": gathering_time,  # Same time for all recipes
            "_productPair": {
                "_id": product_id,
                "_amount": stack_size
            },
            "_isService": False,  # Camps produce goods
            "_extraProductChances": [],
            "_ingredients": []  # Camps don't consume ingredients
        }
        
        # Store in nested structure
        recipe_list[product_id][grade][stack_size] = recipe_obj
    
    camp["recipes"] = recipe_list
    return camp

def convert_camp_to_lua(camp: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single camp dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    camp = transform_camp_recipes(camp)
    
    lua_lines = []
    lua_lines.append(f'    ["{camp["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{camp["id"]}",')
    lua_lines.append(f'        _displayName = "{camp["displayName"]}",')
    lua_lines.append(f'        _description = "{camp["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{camp["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {camp["sizeX"]},')
    lua_lines.append(f'        _sizeY = {camp["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {camp["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {camp["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(camp["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(camp["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {camp["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in camp and camp["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(camp["requiredGoods"]):
            comma = "," if i < len(camp["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in camp and camp["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(camp["tags"]):
            comma = "," if i < len(camp["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Camp-specific optional fields
    if "area" in camp:
        lua_lines.append(f'        _area = {camp["area"]},')
    
    if "storage" in camp:
        lua_lines.append(f'        _storage = {camp["storage"]},')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in camp and camp["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in camp["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{camp["id"]}"}},')
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
                    # _ingredients is required, always include
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
    Convert JSON camp data to Lua table format.
    """
    try:
        camps = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(camps, list):
        print("Error: Expected JSON array of camps", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, camp in enumerate(camps):
        lua_lines.append(convert_camp_to_lua(camp, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process camp JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing camps: {e}") from e

def main():
    """
    External entry point for the camp preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Gathering Camp")
        print(lua_output)
    except Exception as e:
        print(f"Error processing camps: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
