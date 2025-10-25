#!/usr/bin/env python3
"""
Storage building data preprocessor for Against the Storm wiki.
Converts JSON storage data into Lua table format conforming to Building class.
Storage buildings have no recipes and no levels.
"""

import json
import sys
from typing import Dict, Any

def convert_storage_to_lua(storage: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single storage dictionary to Lua table format conforming to Building class.
    Storage buildings have no recipes and no levels.
    """
    lua_lines = []
    lua_lines.append(f'    ["{storage["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{storage["id"]}",')
    lua_lines.append(f'        _displayName = "{storage["displayName"]}",')
    lua_lines.append(f'        _description = "{storage["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{storage["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {storage["sizeX"]},')
    lua_lines.append(f'        _sizeY = {storage["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {storage["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {storage["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(storage["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(storage["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {storage["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in storage and storage["requiredGoods"]:
        lua_lines.append('        _requiredGoods = {')
        for i, good in enumerate(storage["requiredGoods"]):
            comma = "," if i < len(storage["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _requiredGoods = {},')
    
    # Tags array (Specialization[])
    if "tags" in storage and storage["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(storage["tags"]):
            comma = "," if i < len(storage["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Storage buildings have no recipes - explicitly include blank table
    lua_lines.append('        _recipes = {},')
    
    # Storage buildings have no levels - do not include levels field
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str, display_category: str) -> str:
    """
    Convert JSON storage data to Lua table format.
    """
    try:
        storages = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(storages, list):
        print("Error: Expected JSON array of storage buildings", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, storage in enumerate(storages):
        lua_lines.append(convert_storage_to_lua(storage, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process storage JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing storage buildings: {e}") from e

def main():
    """
    External entry point for the storage preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Storage Building")
        print(lua_output)
    except Exception as e:
        print(f"Error processing storage buildings: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
