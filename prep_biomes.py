#!/usr/bin/env python3
"""
Biomes data preprocessor for Against the Storm wiki.
Converts JSON biomes data into Lua table format conforming to Biome class.
"""

import json
import sys
from typing import Dict, Any

def convert_biome_to_lua(biome: Dict[str, Any]) -> str:
    """
    Convert a single biome dictionary to Lua table format conforming to Biome class.
    """
    lua_lines = []
    lua_lines.append(f'    ["{biome["id"]}"] = {{')
    
    # Biome class fields with _ prefix
    lua_lines.append(f'        _id = "{biome["id"]}",')
    lua_lines.append(f'        _displayName = "{biome["displayName"]}",')
    
    # Handle description with proper escaping
    description = biome["description"].replace('"', '\\"').replace('\n', '\\n')
    lua_lines.append(f'        _description = "{description}",')
    
    lua_lines.append(f'        _iconFilename = "{biome["iconName"]}.png",')
    lua_lines.append(f'        _dlc = "{biome["dlc"]}",')
    lua_lines.append(f'        _soilGrade = "{biome["soilGrade"]}",')
    
    # Handle deposits array
    if "deposits" in biome and biome["deposits"]:
        lua_lines.append('        _deposits = {')
        for i, deposit in enumerate(biome["deposits"]):
            comma = "," if i < len(biome["deposits"]) - 1 else ""
            lua_lines.append(f'            "{deposit}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _deposits = {},')
    
    # Handle trees array
    if "trees" in biome and biome["trees"]:
        lua_lines.append('        _trees = {')
        for i, tree in enumerate(biome["trees"]):
            comma = "," if i < len(biome["trees"]) - 1 else ""
            lua_lines.append(f'            "{tree}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _trees = {},')
    
    # Handle ores array (note: field is "ore" in JSON, not "ores")
    if "ore" in biome and biome["ore"]:
        lua_lines.append('        _ores = {')
        for i, ore in enumerate(biome["ore"]):
            comma = "," if i < len(biome["ore"]) - 1 else ""
            lua_lines.append(f'            "{ore}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _ores = {},')
    
    # Handle effects array
    if "effects" in biome and biome["effects"]:
        lua_lines.append('        _effects = {')
        for i, effect in enumerate(biome["effects"]):
            comma = "," if i < len(biome["effects"]) - 1 else ""
            lua_lines.append(f'            "{effect}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _effects = {},')
    
    # Handle town type (note: field is "townTypeName" in JSON)
    lua_lines.append(f'        _townType = "{biome["townTypeName"]}",')
    
    # Handle trade route resources (note: field is "wantedGoods" in JSON)
    if "wantedGoods" in biome and biome["wantedGoods"]:
        lua_lines.append('        _tradeRouteResources = {')
        for i, resource in enumerate(biome["wantedGoods"]):
            comma = "," if i < len(biome["wantedGoods"]) - 1 else ""
            lua_lines.append(f'            "{resource}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tradeRouteResources = {},')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str) -> str:
    """
    Convert JSON biomes data to Lua table format.
    """
    try:
        biomes = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(biomes, list):
        print("Error: Expected JSON array of biomes", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for biome in biomes:
        lua_lines.append(convert_biome_to_lua(biome))
    
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
        raise Exception(f"Error processing biomes: {e}") from e

def main():
    """
    External entry point for the biomes preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        lua_output = convert_json_to_lua_table(json_input)
        print(lua_output)
    except Exception as e:
        print(f"Error processing biomes: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
