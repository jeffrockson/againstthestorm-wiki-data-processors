"""
Refactored utility functions for file output during ETL process.
"""

from typing import Dict, Any

def append_building_common_fields(lua_lines: [], building: Dict[str, Any], display_category: str) -> str:
    """
    Append common fields to a Lua table for a building.
    """
    lua_lines.append(f'        _id = "{building["id"]}",')
    lua_lines.append(f'        _displayName = "{building["displayName"]}",')
    lua_lines.append(f'        _description = "{building["description"].replace('"', '\\"').replace(chr(10), '\\n')}",')
    lua_lines.append(f'        _category = "{building["category"]}",')
    lua_lines.append(f'        _categoryDisplay = "{display_category}",')
    lua_lines.append(f'        _sizeX = {building["sizeX"]},')
    lua_lines.append(f'        _sizeY = {building["sizeY"]},')
    lua_lines.append(f'        _constructionTime = {building["constructionTime"]},')
    lua_lines.append(f'        _cityScore = {building["cityScore"]},')
    lua_lines.append(f'        _isMovable = {str(building["movable"]).lower()},')
    lua_lines.append(f'        _isInitiallyEssential = {str(building["initiallyEssential"]).lower()},')
    lua_lines.append(f'        _workerCapacity = {building["workplaces"]},')

    return lua_lines
