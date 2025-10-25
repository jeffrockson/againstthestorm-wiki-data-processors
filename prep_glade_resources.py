#!/usr/bin/env python3
"""
Glade resources data preprocessor for Against the Storm wiki.
Converts JSON glade resources data into Lua table format conforming to Deposit class.
"""

import json
import sys
from typing import Dict, Any

def convert_deposit_to_lua(deposit: Dict[str, Any]) -> str:
    """
    Convert a single deposit dictionary to Lua table format conforming to Deposit class.
    Handles both Glade_Resources.json, Trees.json, and Ore.json formats.
    """
    lua_lines = []
    lua_lines.append(f'    ["{deposit["id"]}"] = {{')
    
    # Deposit class fields with _ prefix
    lua_lines.append(f'        _id = "{deposit["id"]}",')
    lua_lines.append(f'        _displayName = "{deposit["displayName"]}",')
    
    # Handle description with proper escaping
    description = deposit["description"].replace('"', '\\"').replace('\n', '\\n')
    lua_lines.append(f'        _description = "{description}",')
    
    lua_lines.append(f'        _iconFilename = "{deposit["iconName"]}.png",')
    
    lua_lines.append(f'        _label = "{deposit["label"]}",')
    
    # Handle size fields - use defaults for Trees.json (missing xSize/ySize)
    size_x = deposit.get("xSize", 1)  # Default to 1 for Trees
    size_y = deposit.get("ySize", 1)  # Default to 1 for Trees
    lua_lines.append(f'        _sizeX = {size_x},')
    lua_lines.append(f'        _sizeY = {size_y},')
    
    # Handle type field - use default for Trees.json (missing type)
    deposit_type = deposit.get("type", 0)  # Default to 0 for Trees
    lua_lines.append(f'        _type = {deposit_type},')
    
    # Handle required grade - use default for Trees.json (missing minGradeToCollect)
    required_grade = deposit.get("minGradeToCollect", 0)  # Default to 0 for Trees
    if required_grade is None:
        required_grade = 0  # Convert None to 0
    lua_lines.append(f'        _requiredGrade = {required_grade},')
    
    # Handle charges field - use mainCharges[0] for Ore.json, charges for others
    if "mainCharges" in deposit:
        # Ore.json format - use first value from mainCharges array
        charges = deposit["mainCharges"][0]
    else:
        # Glade_Resources.json and Trees.json format - use charges field
        charges = deposit["charges"]
    lua_lines.append(f'        _charges = {charges},')

    # Handle Ore.json specific fields (optional for other types)
    if "mainCharges" in deposit:
        # _chargesAddedPerLevel (levels 2 and 3, skip level 1 which is always just _charges)
        lua_lines.append('        _chargesAddedPerLevel = {')
        for i, charge in enumerate(deposit["mainCharges"][1:], 1):  # Skip first element
            comma = "," if i < len(deposit["mainCharges"]) - 1 else ""
            lua_lines.append(f'            {charge}{comma}')
        lua_lines.append('        },')
        
        # _chargesAddedByBonusUpgrade (skip first 0 entry)
        if "extraChargesLevels" in deposit:
            lua_lines.append('        _chargesAddedByBonusUpgrade = {')
            for i, bonus in enumerate(deposit["extraChargesLevels"][1:], 1):  # Skip first element
                comma = "," if i < len(deposit["extraChargesLevels"]) - 1 else ""
                lua_lines.append(f'            {bonus}{comma}')
            lua_lines.append('        },')
        else:
            lua_lines.append('        _chargesAddedByBonusUpgrade = {},')
    else:
        # For Glade_Resources.json and Trees.json, these fields are optional
        lua_lines.append('        _chargesAddedPerLevel = {},')
        lua_lines.append('        _chargesAddedByBonusUpgrade = {},')
    
    # ProductPair - the main production
    production = deposit["production"]
    lua_lines.append('        _productPair = {')
    lua_lines.append(f'            _id = "{production["name"]}",')
    lua_lines.append(f'            _amount = {production["amount"]}')
    lua_lines.append('        },')
    
    # ExtraProductChance[] - possible extra products
    if "extraProduction" in deposit and deposit["extraProduction"]:
        lua_lines.append('        _extraProductChances = {')
        for i, extra in enumerate(deposit["extraProduction"]):
            comma = "," if i < len(deposit["extraProduction"]) - 1 else ""
            lua_lines.append('            {')
            lua_lines.append(f'                _id = "{extra["name"]}",')
            lua_lines.append(f'                _amount = {extra["amount"]},')
            lua_lines.append(f'                _chance = {extra["chance"]}')
            lua_lines.append(f'            }}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _extraProductChances = {},')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str) -> str:
    """
    Convert JSON glade resources data to Lua table format.
    """
    try:
        deposits = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(deposits, list):
        print("Error: Expected JSON array of deposits", file=sys.stderr)
        return ""
    
    # Deduplicate deposits by ID (keep the first occurrence)
    seen_ids = set()
    unique_deposits = []
    for deposit in deposits:
        if deposit["id"] not in seen_ids:
            seen_ids.add(deposit["id"])
            unique_deposits.append(deposit)
    
    print(f"Processed {len(deposits)} total entries, {len(unique_deposits)} unique entries", file=sys.stderr)
    
    lua_lines = []
    lua_lines.append('return {')
    
    for deposit in unique_deposits:
        lua_lines.append(convert_deposit_to_lua(deposit))
    
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
        raise Exception(f"Error processing glade resources: {e}") from e

def main():
    """
    External entry point for the glade resources preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        lua_output = convert_json_to_lua_table(json_input)
        print(lua_output)
    except Exception as e:
        print(f"Error processing glade resources: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
