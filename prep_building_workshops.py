#!/usr/bin/env python3
"""
Workshop data preprocessor for Against the Storm wiki.
Converts JSON data file into Lua table file.
"""

import json
import sys
from typing import Dict, Any

def transform_workshop_recipes(workshop: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure.
    Converts from flat array to nested table organized by [productID][grade][stackSize].
    """
    if "recipes" not in workshop or not workshop["recipes"]:
        workshop["recipes"] = {}
        return workshop
    
    # Create the nested structure
    recipe_list = {}
    
    for recipe in workshop["recipes"]:
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
            "_buildings": [workshop["id"]],  # The building that can make this recipe
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
    
    workshop["recipes"] = recipe_list
    return workshop

def convert_workshop_to_lua(workshop: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single workshop dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    workshop = transform_workshop_recipes(workshop)
    
    lua_lines = []
    lua_lines.append(f'    ["{workshop["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{workshop["id"]}",')
    lua_lines.append(f'        _displayName = "{workshop["displayName"]}",')
    lua_lines.append(f'        _description = "{workshop["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{workshop["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {workshop["sizeX"]},')
    lua_lines.append(f'        _sizeY = {workshop["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {workshop["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {workshop["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(workshop["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(workshop["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {workshop["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in workshop and workshop["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(workshop["requiredGoods"]):
            comma = "," if i < len(workshop["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in workshop and workshop["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(workshop["tags"]):
            comma = "," if i < len(workshop["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "storage" in workshop:
        lua_lines.append(f'        _storage = {workshop["storage"]},')
    
    if "waterUsed" in workshop:
        lua_lines.append(f'        _waterUsed = "{workshop["waterUsed"]}",')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in workshop and workshop["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in workshop["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{workshop["id"]}"}},')
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
    Convert JSON workshop data to Lua table format.
    """
    try:
        workshops = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(workshops, list):
        print("Error: Expected JSON array of workshops", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, workshop in enumerate(workshops):
        lua_lines.append(convert_workshop_to_lua(workshop, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process workshop JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing workshops: {e}") from e

def main():
    """
    External entry point for the workshop preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Production Building")
        print(lua_output)
    except Exception as e:
        print(f"Error processing workshops: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
