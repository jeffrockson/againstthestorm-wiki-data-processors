#!/usr/bin/env python3
"""
Glade events data preprocessor for Against the Storm wiki.
Converts JSON glade events data into Lua table format conforming to Building class.
Glade events have unique fields like difficulties, decisions, rewards, and effects.
"""

import json
import sys
from typing import Dict, Any, List
from etl_utility import append_building_common_fields

def convert_required_goods_to_lua(required_goods: List[Dict[str, Any]]) -> List[str]:
    """
    Convert required goods array to Lua RequiredGoodPair[] format.
    Handles the nested structure where each decision can have multiple good options.
    """
    lua_lines = []
    lua_lines.append('                    _requiredGoods = {')
    
    for i, goods_option in enumerate(required_goods):
        lua_lines.append('                        {')
        lua_lines.append('                            _goods = {')
        
        # Put all goods on one line
        goods_list = []
        for good in goods_option["goods"]:
            goods_list.append(f'{{_id = "{good["name"]}", _amount = {good["amount"]}}}')
        lua_lines.append(f'                                {", ".join(goods_list)}')
        
        lua_lines.append('                            }')
        lua_lines.append('                        }')
        if i < len(required_goods) - 1:
            lua_lines.append(',')
    
    lua_lines.append('                    },')
    return lua_lines

def convert_decision_to_lua(decision: Dict[str, Any]) -> List[str]:
    """
    Convert a single decision to Lua format.
    """
    lua_lines = []
    lua_lines.append('                {')
    lua_lines.append(f'                    _workingTime = {decision["workingTime"]},')
    lua_lines.append(f'                    _label = "{decision["label"]}",')
    lua_lines.append(f'                    _decisionTag = "{decision["decisionTag"]}",')
    
    # Handle required goods
    if "requriedGoods" in decision and decision["requriedGoods"]:
        lua_lines.extend(convert_required_goods_to_lua(decision["requriedGoods"]))
    else:
        lua_lines.append('                    _requiredGoods = {},')
    
    # Handle working effects (usually null)
    if decision.get("workingEffects"):
        lua_lines.append(f'                    _workingEffects = "{decision["workingEffects"]}",')
    else:
        lua_lines.append('                    _workingEffects = nil,')
    
    lua_lines.append('                }')
    return lua_lines

def convert_difficulty_to_lua(difficulty: Dict[str, Any]) -> List[str]:
    """
    Convert a single difficulty level to Lua format.
    """
    lua_lines = []
    lua_lines.append('            {')
    lua_lines.append(f'                _difficulty = {difficulty["difficulty"]},')
    lua_lines.append(f'                _effectTimeToStartRatio = {difficulty["effectTimeToStartRatio"]},')
    
    # Handle decisions array
    lua_lines.append('                _decisions = {')
    for i, decision in enumerate(difficulty["decisions"]):
        decision_lines = convert_decision_to_lua(decision)
        # Add comma after each decision except the last
        if i < len(difficulty["decisions"]) - 1:
            decision_lines[-1] += ','
        lua_lines.extend(decision_lines)
    lua_lines.append('                },')
    
    lua_lines.append('            }')
    return lua_lines

def convert_decisions_reward_to_lua(reward: Dict[str, Any]) -> List[str]:
    """
    Convert a single decisions reward to Lua format.
    """
    lua_lines = []
    lua_lines.append('            {')
    lua_lines.append(f'                _tableId = "{reward["tableId"]}",')
    lua_lines.append(f'                _minAmount = {reward["minAmount"]},')
    lua_lines.append(f'                _maxAmount = {reward["maxAmount"]},')
    
    # Handle effects array
    lua_lines.append('                _effects = {')
    for i, effect in enumerate(reward["effects"]):
        comma = "," if i < len(reward["effects"]) - 1 else ""
        lua_lines.append(f'                    {{_effectId = "{effect["effectId"]}", _chance = {effect["chance"]}}}{comma}')
    lua_lines.append('                },')
    
    lua_lines.append('            }')
    return lua_lines

def convert_effects_tier_to_lua(tier: Dict[str, Any]) -> List[str]:
    """
    Convert a single effects tier to Lua format.
    """
    lua_lines = []
    lua_lines.append('            {')
    lua_lines.append(f'                _timeToStart = {tier["timeToStart"]},')
    
    # Handle effects array (list of strings)
    lua_lines.append('                _effects = {')
    for i, effect in enumerate(tier["effects"]):
        comma = "," if i < len(tier["effects"]) - 1 else ""
        lua_lines.append(f'                    "{effect}"{comma}')
    lua_lines.append('                },')
    
    lua_lines.append('            }')
    return lua_lines

def event_contains_tutorial_goods(event: Dict[str, Any]) -> bool:
    """
    Check if any good in the glade event's required goods contains "tutorial" in its name.
    Returns True if tutorial goods are found, False otherwise.
    """
    if "difficulties" not in event:
        return False
    
    for difficulty in event["difficulties"]:
        if "decisions" not in difficulty:
            continue
        
        for decision in difficulty["decisions"]:
            # Note: there's a typo in the JSON field name "requriedGoods"
            if "requriedGoods" not in decision or not decision["requriedGoods"]:
                continue
            
            for required_goods_option in decision["requriedGoods"]:
                if "goods" not in required_goods_option:
                    continue
                
                for good in required_goods_option["goods"]:
                    if "tutorial" in good.get("name", "").lower():
                        return True
    
    return False

def convert_glade_event_to_lua(event: Dict[str, Any], display_category: str) -> str:
    """
    Convert a single glade event dictionary to Lua table format conforming to Building class.
    Glade events have unique fields like difficulties, decisions, rewards, and effects.
    """
    lua_lines = []
    lua_lines.append(f'    ["{event["id"]}"] = {{')
    
    # Handle Ruined buildings - insert "Ruined" into displayName if ID contains "Ruined"
    if "Ruined" in event["id"]:
        # Find the position of "Ruined" in the ID
        ruined_pos = event["id"].find("Ruined")
        # Insert "Ruined " at the same position in the displayName
        display_name = event["displayName"]
        event["displayName"] = display_name[:ruined_pos] + "Ruined " + display_name[ruined_pos:]
    
    # Building class fields with _ prefix
    lua_lines = append_building_common_fields(lua_lines, event, display_category)
    
    # Common building fields
    lua_lines.append('        _constructionCosts = {},')
    lua_lines.append('        _recipes = {},')
    lua_lines.append('        _levels = {},')
    
    # Tags array (Specialization[])
    if "tags" in event and event["tags"]:
        lua_lines.append('        _tags = {')
        for i, tag in enumerate(event["tags"]):
            comma = "," if i < len(event["tags"]) - 1 else ""
            lua_lines.append(f'            "{tag}"{comma}')
        lua_lines.append('        },')
    else:
        lua_lines.append('        _tags = {},')
    
    # Glade event specific fields
    lua_lines.append(f'        _dangerLevel = "{event["dangerLevel"]}",')
    lua_lines.append(f'        _hasOrder = {str(event["hasOrder"]).lower()},')
    
    # Handle orderModel (usually null)
    if event.get("orderModel"):
        lua_lines.append(f'        _orderModel = "{event["orderModel"]}",')
    else:
        lua_lines.append('        _orderModel = nil,')
    
    lua_lines.append(f'        _workTimeReducedPerWorker = {event["workTimeReducedPerWorker"]},')
    
    # Handle difficulties array
    lua_lines.append('        _difficulties = {')
    for i, difficulty in enumerate(event["difficulties"]):
        difficulty_lines = convert_difficulty_to_lua(difficulty)
        # Add comma after each difficulty except the last
        if i < len(event["difficulties"]) - 1:
            difficulty_lines[-1] += ','
        lua_lines.extend(difficulty_lines)
    lua_lines.append('        },')
    
    # Handle rewardsTiers (usually empty array)
    lua_lines.append('        _rewardsTiers = {},')
    
    # Handle decisionsRewards array
    lua_lines.append('        _decisionsRewards = {')
    for i, reward in enumerate(event["decisionsRewards"]):
        reward_lines = convert_decisions_reward_to_lua(reward)
        # Add comma after each reward except the last
        if i < len(event["decisionsRewards"]) - 1:
            reward_lines[-1] += ','
        lua_lines.extend(reward_lines)
    lua_lines.append('        },')
    
    lua_lines.append(f'        _areEffectsPermanent = {str(event["areEffectsPermanent"]).lower()},')
    
    # Handle effectsTiers array
    lua_lines.append('        _effectsTiers = {')
    for i, tier in enumerate(event["effectsTiers"]):
        tier_lines = convert_effects_tier_to_lua(tier)
        # Add comma after each tier except the last
        if i < len(event["effectsTiers"]) - 1:
            tier_lines[-1] += ','
        lua_lines.extend(tier_lines)
    lua_lines.append('        },')
    
    # Handle activeEffects array (usually empty)
    lua_lines.append('        _activeEffects = {},')
    
    lua_lines.append('    },')
    
    return '\n'.join(lua_lines)

def convert_json_to_lua_table(json_data: str, display_category: str) -> str:
    """
    Convert JSON glade events data to Lua table format.
    """
    try:
        events = json.loads(json_data)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return ""
    
    if not isinstance(events, list):
        print("Error: Expected JSON array of glade events", file=sys.stderr)
        return ""
    
    lua_lines = []
    lua_lines.append('return {')
    
    for _, event in enumerate(events):
        # Skip entire glade event if any good contains "tutorial"
        if event_contains_tutorial_goods(event):
            continue
        lua_lines.append(convert_glade_event_to_lua(event, display_category))
    
    lua_lines.append('}')
    
    return '\n'.join(lua_lines)

def process_data(json_content: str, display_category: str) -> str:
    """
    Process glade events JSON content and return Lua table format.
    This is the main function called by the ETL manager.
    """
    try:
        return convert_json_to_lua_table(json_content, display_category)
    except Exception as e:
        raise Exception(f"Error processing glade events: {e}") from e

def main():
    """
    External entry point for the glade events preprocessor.
    Reads JSON from stdin and outputs Lua table to stdout.
    This is used for unit testing.
    """
    try:
        json_input = sys.stdin.read()
        # For standalone testing, use default display category
        lua_output = convert_json_to_lua_table(json_input, "Glade Event")
        print(lua_output)
    except Exception as e:
        print(f"Error processing glade events: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
