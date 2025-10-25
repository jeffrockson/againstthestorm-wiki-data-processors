#!/usr/bin/env python3
"""
Hearth data preprocessor for Against the Storm wiki.
Converts JSON hearth data into Lua table format conforming to Building class.
Hearths have special sacrifices field and no levels.
"""

import json
import sys
from typing import Dict, Any
from etl_utility import append_building_common_fields

def convert_hearth_to_lua(hearth: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single hearth dictionary to Lua table format conforming to Building class.
    Hearths have special sacrifices field and no levels.
    """
    lua_lines = []
    lua_lines.append(f'    ["{hearth["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines = append_building_common_fields(lua_lines, hearth, display_category)

    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in hearth and hearth["requiredGoods"]:
        lua_lines.append('        _constructionCosts = {')
        for i, good in enumerate(hearth["requiredGoods"]):
            comma = "," if i < len(hearth["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _constructionCosts = {},')
    
    # Tags array (Specialization[])
    if "tags" in hearth and hearth["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(hearth["tags"]):
            comma = "," if i < len(hearth["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Hearth-specific sacrifices field (recipes -> _sacrifices)
    if "recipes" in hearth and hearth["recipes"]:
        lua_lines.append('        _sacrifices = {')
        for i, sacrifice in enumerate(hearth["recipes"]):
            lua_lines.append('            {')
            lua_lines.append(f'                _name = "{sacrifice["name"]}",')
            lua_lines.append(f'                _desc = "{sacrifice["desc"].replace('"', '\\"').replace(chr(10), '\\n')}",')
            lua_lines.append(f'                _maxLevel = {sacrifice["maxLevel"]},')
            lua_lines.append(f'                _costPerMin = {{_id = "{sacrifice["costPerMin"]["name"]}", _amount = {sacrifice["costPerMin"]["amount"]}}},')
            lua_lines.append('            }')
            if i < len(hearth["recipes"]) - 1:
                lua_lines.append(',')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _sacrifices = {},')
    
    # Hearths have no recipes - explicitly include blank table
    lua_lines.append('        _recipes = {},')
    
    # Hearths have no levels - do not include levels field
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str, display_category: str) -> str:
    """
    Convert JSON hearth data to Lua table format.
    """
    try:
        hearths = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(hearths, list):
        print("Error: Expected JSON array of hearths", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, hearth in enumerate(hearths):
        lua_lines.append(convert_hearth_to_lua(hearth, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process hearth JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing hearths: {e}") from e

def main():
    """
    External entry point for the hearth preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Hearth")
        print(lua_output)
    except Exception as e:
        print(f"Error processing hearths: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
