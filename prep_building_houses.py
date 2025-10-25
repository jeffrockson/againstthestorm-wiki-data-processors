#!/usr/bin/env python3
"""
House data preprocessor for Against the Storm wiki.
Converts JSON house data into Lua table format conforming to Building class.
Houses have special fields: housingPlaces -> _housingCapacity, housedSpecies -> _housedSpecies array.
Houses have 0 workplaces and may have levels.
"""

import json
import sys
from typing import Dict, Any
from etl_utility import append_building_common_fields

def convert_house_to_lua(house: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single house dictionary to Lua table format conforming to Building class.
    Houses have special housing fields and may have levels.
    """
    lua_lines = []
    lua_lines.append(f'    ["{house["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines = append_building_common_fields(lua_lines, house, display_category)

    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in house and house["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(house["requiredGoods"]):
            comma = "," if i < len(house["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in house and house["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(house["tags"]):
            comma = "," if i < len(house["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # House-specific fields
    if "housingPlaces" in house:
        lua_lines.append(f'        _housingCapacity = {house["housingPlaces"]},')
    
    if "housedSpecies" in house and house["housedSpecies"]:
        lua_lines.append('        _housedSpecies = {')
        for i, species in enumerate(house["housedSpecies"]):
            comma = "," if i < len(house["housedSpecies"]) - 1 else ""
            lua_lines.append(f'            "{species}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _housedSpecies = {},')
    
    # Houses have no recipes - explicitly include blank table
    lua_lines.append('        _recipes = {},')
    
    # Levels (only include if present and not empty)
    if "levels" in house and house["levels"] and len(house["levels"]) > 0:
        # Filter out completely empty levels and check if any levels remain
        non_empty_levels = []
        for level in house["levels"]:
            has_required_goods = level.get("requiredGoods") and any(req.get("goods") for req in level["requiredGoods"])
            has_options = level.get("options") and level["options"]
            if has_required_goods or has_options:
                non_empty_levels.append(level)
        
        if non_empty_levels:
            lua_lines.append('        _levels = {')
            for level_idx, level in enumerate(non_empty_levels):
                lua_lines.append('            {')
                
                # Upgrade cost options (requiredGoods -> _upgradeCostOptions)
                if "requiredGoods" in level and level["requiredGoods"]:
                    lua_lines.append('                _upgradeCostOptions = {')
                    for req_idx, req_group in enumerate(level["requiredGoods"]):
                        lua_lines.append('                    {')
                        if "goods" in req_group and req_group["goods"]:
                            for good_idx, good in enumerate(req_group["goods"]):
                                comma = "," if good_idx < len(req_group["goods"]) - 1 else ""
                                lua_lines.append(f'                        {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
                        lua_lines.append('                    }')
                        if req_idx < len(level["requiredGoods"]) - 1:
                            lua_lines.append(',')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgradeCostOptions = {},')
                
                # Upgrades (options -> _upgrades)
                if "options" in level and level["options"]:
                    lua_lines.append('                _upgrades = {')
                    for opt_idx, option in enumerate(level["options"]):
                        comma = "," if opt_idx < len(level["options"]) - 1 else ""
                        lua_lines.append(f'                    "{option}"{comma}')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgrades = {},')
                
                lua_lines.append('            }')
                if level_idx < len(non_empty_levels) - 1:
                    lua_lines.append(',')
            lua_lines.append('        },')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str, display_category: str) -> str:
    """
    Convert JSON house data to Lua table format.
    """
    try:
        houses = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(houses, list):
        print("Error: Expected JSON array of houses", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, house in enumerate(houses):
        lua_lines.append(convert_house_to_lua(house, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process house JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing houses: {e}") from e

def main():
    """
    External entry point for the house preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Housing")
        print(lua_output)
    except Exception as e:
        print(f"Error processing houses: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
