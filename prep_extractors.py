#!/usr/bin/env python3
"""
Extractor data preprocessor for Against the Storm wiki.
Converts JSON extractor data into Lua table format conforming to Building class.
"""

import json
import sys
from typing import Dict, Any

def convert_extractor_to_lua(extractor: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single extractor dictionary to Lua table format conforming to Building class.
    """
    lua_lines = []
    lua_lines.append(f'    ["{extractor["id"]}"] = {{')
    
    # Building class fields with _ prefix
    lua_lines.append(f'        _id = "{extractor["id"]}",')
    lua_lines.append(f'        _displayName = "{extractor["displayName"]}",')
    lua_lines.append(f'        _description = "{extractor["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{extractor["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {extractor["sizeX"]},')
    lua_lines.append(f'        _sizeY = {extractor["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {extractor["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {extractor["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(extractor["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(extractor["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {extractor["workplaces"]},')
    
    # Required goods array (RequiredGoodPair[])
    if "requiredGoods" in extractor and extractor["requiredGoods"]:
        lua_lines.append('        _requiredGoods = {')
        for i, good in enumerate(extractor["requiredGoods"]):
            comma = "," if i < len(extractor["requiredGoods"]) - 1 else ""
            lua_lines.append(f'            {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _requiredGoods = {},')
    
    # Tags array (Specialization[])
    if "tags" in extractor and extractor["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(extractor["tags"]):
            comma = "," if i < len(extractor["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Optional fields
    if "baseTankCapacity" in extractor:
        lua_lines.append(f'        _baseTankCapacity = {extractor["baseTankCapacity"]},')
    
    if "amountProduced" in extractor:
        lua_lines.append(f'        _amountProduced = {extractor["amountProduced"]},')
    
    if "productionTime" in extractor:
        lua_lines.append(f'        _productionTime = {extractor["productionTime"]},')
    
    # EXTRACTOR-SPECIFIC FIELD: Levels
    if "levels" in extractor and extractor["levels"]:
        # Filter out empty levels
        non_empty_levels = [level for level in extractor["levels"] 
                           if (level.get("requiredGoods") and any(level["requiredGoods"])) 
                           or (level.get("options") and any(level["options"]))]
        
        if non_empty_levels:
            lua_lines.append('        _levels = {')
            for level_idx, level in enumerate(non_empty_levels):
                lua_lines.append('            {')
                
                # Upgrade costs for this level
                if "requiredGoods" in level and level["requiredGoods"]:
                    lua_lines.append('                _upgradeCostOptions = {')
                    for req_idx, req_group in enumerate(level["requiredGoods"]):
                        lua_lines.append('                    {')
                        if "goods" in req_group and req_group["goods"]:
                            for good_idx, good in enumerate(req_group["goods"]):
                                comma = "," if good_idx < len(req_group["goods"]) - 1 else ""
                                lua_lines.append(f'                        {{_id = "{good["name"]}", _amount = {good["amount"]}}}{comma}')
                        if req_idx < len(level["requiredGoods"]) - 1:
                            lua_lines.append('                    },')
                        else:
                            lua_lines.append('                    }')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgradeCostOptions = {},')
                
                # Upgrades for this level
                if "options" in level and level["options"]:
                    lua_lines.append('                _upgrades = {')
                    for opt_idx, option in enumerate(level["options"]):
                        comma = "," if opt_idx < len(level["options"]) - 1 else ""
                        lua_lines.append(f'                    "{option}"{comma}')
                    lua_lines.append('                },')
                else:
                    lua_lines.append('                _upgrades = {},')
                
                level_comma = "," if level_idx < len(non_empty_levels) - 1 else ""
                lua_lines.append(f'            }}{level_comma}')
            lua_lines.append('        },')
        else:
            lua_lines.append('        _levels = {},')
    else:
        lua_lines.append('        _levels = {},')
    
    # Extractors don't have recipes, so we always set empty recipes
    lua_lines.append('        _recipes = {},')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str, display_category: str) -> str:
    """
    Convert JSON extractor data to Lua table format.
    """
    try:
        extractors = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(extractors, list):
        print("Error: Expected JSON array of extractors", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, extractor in enumerate(extractors):
        lua_lines.append(convert_extractor_to_lua(extractor, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process extractor JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing extractors: {e}") from e

def main():
    """
    External entry point for the extractor preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Resource Acquisition")
        print(lua_output)
    except Exception as e:
        print(f"Error processing extractors: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()