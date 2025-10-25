#!/usr/bin/env python3
"""
Goods data preprocessor for Against the Storm wiki.
Converts CSV goods data into Lua table format conforming to Resource class.
"""

import csv
import sys
from typing import Dict
from io import StringIO

def convert_good_to_lua(good: Dict[str, str]) -> str:
    """
    Convert a single good dictionary to Lua table format conforming to Resource class.
    """
    lua_lines = []
    lua_lines.append(f'    ["{good["id"]}"] = {{')
    
    # Resource class fields with _ prefix
    lua_lines.append(f'        _id = "{good["id"]}",')
    lua_lines.append(f'        _displayName = "{good["displayName"]}",')
    
    # Handle description with proper escaping
    description = good["description"].replace('"', '\\"').replace('\n', '\\n')
    lua_lines.append(f'        _description = "{description}",')
    
    lua_lines.append(f'        _category = "{good["category"]}",')
    lua_lines.append(f'        _isEatable = {good["eatable"].lower()},')
    lua_lines.append(f'        _isBurnable = {good["canBeBurned"].lower()},')
    lua_lines.append(f'        _burningTime = {good["burningTime"]},')
    lua_lines.append(f'        _tradingSellValue = {good["tradingSellValue"]},')
    lua_lines.append(f'        _tradingBuyValue = {good["tradingBuyValue"]},')
    lua_lines.append(f'        _iconFilename = "{good["iconName"]}.png",')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_csv_to_lua_table(csv_data: str) -> str:
    """
    Convert CSV goods data to Lua table format.
    """
    try:
        # Parse CSV data
        csv_reader = csv.DictReader(StringIO(csv_data))
        goods = list(csv_reader)
    except Exception as e:
        print(f"Error parsing CSV: {e}", file=sys.stderr)
        return ""
    
    if not goods:
        print("Error: No goods data found in CSV", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for good in goods:
        lua_lines.append(convert_good_to_lua(good))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(csv_content: str) -> str:
    """
    Process CSV content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_csv_to_lua_table(csv_content)
    except Exception as e:
        raise Exception(f"Error processing goods: {e}") from e

def main():
    """
    External entry point for the goods preprocessor.
    Reads CSV from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        csv_input = sys.stdin.read()
        lua_output = convert_csv_to_lua_table(csv_input)
        print(lua_output)
    except Exception as e:
        print(f"Error processing goods: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
