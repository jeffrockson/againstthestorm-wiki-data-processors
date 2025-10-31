#!/usr/bin/env python3
"""
Needs data preprocessor for Against the Storm wiki.
Converts JSON needs data into Lua table format conforming to Need class.
"""

import json
import sys
from typing import Dict

def convert_need_to_lua(need: Dict[str, str]) -> str:
    """
    Convert a single need dictionary to Lua table format conforming to Need class.
    """
    lua_lines = []
    lua_lines.append(f'    ["{need["id"]}"] = {{')
    
    # Need class fields with _ prefix
    lua_lines.append(f'        _id = "{need["id"]}",')
    lua_lines.append(f'        _displayName = "{need["displayName"]}",')
    
    # Handle description with proper escaping
    description = need["description"].replace('"', '\\"').replace('\n', '\\n')
    lua_lines.append(f'        _description = "{description}",')
    
    lua_lines.append(f'        _iconFilename = "{need["iconName"]}.png",')
    lua_lines.append(f'        _category = "{need["category"]}",')
    
    # Detect if need is fulfilled at hearth by checking if description starts with
    # "This need is fulfilled at the Hearth"
    is_at_hearth = need["description"].startswith("This need is fulfilled at the Hearth")
    lua_lines.append(f'        _isAtHearth = {str(is_at_hearth).lower()},')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str) -> str:
    """
    Convert JSON needs data to Lua table format.
    """
    try:
        needs = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(needs, list):
        print("Error: Expected JSON array of needs", file=sys.stderr)
        return ""
    
    if not needs:
        print("Error: No needs data found in JSON", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for need in needs:
        lua_lines.append(convert_need_to_lua(need))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str) -> str:
    """
    Process JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content)
    except Exception as e:
        raise Exception(f"Error processing needs: {e}") from e

def main():
    """
    External entry point for the needs preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        lua_output = convert_json_to_lua_table(json_input)
        print(lua_output)
    except Exception as e:
        print(f"Error processing needs: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()

