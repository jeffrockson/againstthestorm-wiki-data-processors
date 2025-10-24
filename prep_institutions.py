#!/usr/bin/env python3
"""
Institution data preprocessor for Against the Storm wiki.
Converts JSON institution data into Lua table format conforming to Building and Recipe classes.
"""

import json
import sys
import re
from typing import Dict, Any

def extract_grade_from_string(grade_string: str) -> int:
    """
    Extract grade number from strings like "Grade1 - institution" or "Grade2 - institution".
    """
    match = re.search(r'Grade(\d+)', grade_string)
    if match:
        return int(match.group(1))
    return 1  # Default to grade 1 if parsing fails

def transform_institution_recipes(institution: Dict[str, Any]) -> Dict[str, Any]:
    """
    Transform the recipes array into the Recipe class structure.
    Converts from flat array to nested table organized by [productID][grade][stackSize].
    For institutions, servedNeed becomes the productID and amount is always 1.
    """
    if "recipes" not in institution or not institution["recipes"]:
        institution["recipes"] = {}
        return institution
    
    # Create the nested structure
    recipe_list = {}
    
    for recipe in institution["recipes"]:
        # For institutions, servedNeed is the productID
        product_id = recipe["servedNeed"]
        grade = extract_grade_from_string(recipe["grade"])
        stack_size = 1  # Institutions always have stack size 1
        
        # Initialize nested structure if needed
        if product_id not in recipe_list:
            recipe_list[product_id] = {}
        if grade not in recipe_list[product_id]:
            recipe_list[product_id][grade] = {}
        
        # Create the recipe object
        recipe_obj = {
            "_buildings": [institution["id"]],  # The building that can make this recipe
            "_grade": grade,
            "_time": 0,  # Institutions don't have production time
            "_productPair": {
                "_id": product_id,
                "_amount": stack_size
            },
            "_isService": True,  # Institutions provide services, not products
            "_extraProductChances": [],
            "_ingredients": []
        }
        
        # Transform goods array to ingredients
        if "goods" in recipe and recipe["goods"]:
            # Each good becomes an ingredient option in a single slot
            ingredient_slot = []
            for good in recipe["goods"]:
                ingredient_slot.append({
                    "_id": good["name"],
                    "_amount": good["amount"]
                })
            recipe_obj["_ingredients"].append(ingredient_slot)
        
        # Store in nested structure
        recipe_list[product_id][grade][stack_size] = recipe_obj
    
    institution["recipes"] = recipe_list
    return institution

def convert_institution_to_lua(institution: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single institution dictionary to Lua table format conforming to Building class.
    """
    # Transform recipes to Recipe class structure
    institution = transform_institution_recipes(institution)
    
    lua_lines = []
    lua_lines.append(f'    ["{institution["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{institution["id"]}",')
    lua_lines.append(f'        _displayName = "{institution["displayName"]}",')
    lua_lines.append(f'        _description = "{institution["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{institution["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {institution["sizeX"]},')
    lua_lines.append(f'        _sizeY = {institution["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {institution["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {institution["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(institution["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(institution["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {institution["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in institution and institution["requiredGoods"]:
        lua_lines.append('        _requiredGoods = {')
        for i, good in enumerate(institution["requiredGoods"]):
            comma = "," if i < len(institution["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _requiredGoods = {},')
    
    # Tags array (Specialization[])
    if "tags" in institution and institution["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(institution["tags"]):
            comma = "," if i < len(institution["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "storage" in institution:
        lua_lines.append(f'        _storage = {institution["storage"]},')
    
    if "waterUsed" in institution:
        lua_lines.append(f'        _waterUsed = "{institution["waterUsed"]}",')
    
    # Recipes (transformed to Recipe class structure)
    if "recipes" in institution and institution["recipes"]:
        lua_lines.append('        _recipes = {')
        for product_id, grade_dict in institution["recipes"].items():
            lua_lines.append(f'            ["{product_id}"] = {{')
            for grade, stack_dict in grade_dict.items():
                lua_lines.append(f'                [{grade}] = {{')
                for stack_size, recipe in stack_dict.items():
                    lua_lines.append(f'                    [{stack_size}] = {{')
                    lua_lines.append(f'                        _buildings = {{"{institution["id"]}"}},')
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
                    lua_lines.append('                        _ingredients = {')
                    for slot_idx, ingredient_slot in enumerate(recipe["_ingredients"]):
                        lua_lines.append('                            {')
                        for opt_idx, option in enumerate(ingredient_slot):
                            comma = "," if opt_idx < len(ingredient_slot) - 1 else ""
                            lua_lines.append(f'                                {{_id = "{option["_id"]}", _amount = {option["_amount"]}}}{comma}')
                        slot_comma = "," if slot_idx < len(recipe["_ingredients"]) - 1 else ""
                        lua_lines.append(f'                            }}{slot_comma}')
                    lua_lines.append('                        },')
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
    Convert JSON institution data to Lua table format.
    """
    try:
        institutions = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(institutions, list):
        print("Error: Expected JSON array of institutions", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, institution in enumerate(institutions):
        lua_lines.append(convert_institution_to_lua(institution, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process institution JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing institutions: {e}") from e

def main():
    """
    External entry point for the institution preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Service Building")
        print(lua_output)
    except Exception as e:
        print(f"Error processing institutions: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
