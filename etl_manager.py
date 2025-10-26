#!/usr/bin/env python3
"""
ETL Manager for Against the Storm wiki data processors.
Reads manifest.json and processes all data files through their respective preprocessors.
"""

import json
import os
import sys
import argparse
from typing import Dict, Any

def load_manifest(manifest_path: str = "manifest.json") -> Dict[str, Any]:
    """Load and parse the manifest.json file."""
    try:
        with open(manifest_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Error: Manifest file '{manifest_path}' not found.")
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON in manifest file: {e}")
        sys.exit(1)

def import_preprocessor(script_name: str):
    """Dynamically import a preprocessor script."""
    try:
        # Remove .py extension if present
        module_name = script_name.replace('.py', '')
        return __import__(module_name)
    except ImportError as e:
        print(f"Error: Could not import preprocessor '{script_name}': {e}")
        return None

def process_data_file(entry_key: str, entry_data: Dict[str, Any]) -> bool:
    """Process a single data file through its preprocessor."""
    print(f"Processing {entry_key}...")
    
    # Extract manifest data
    preprocessor_script = entry_data.get("preprocessor")
    output_page = entry_data.get("output_page")
    display_category = entry_data.get("display_category")
    
    if not preprocessor_script:
        print(f"  Error: No preprocessor specified for {entry_key}")
        return False
    if not output_page:
        print(f"  Error: No output page specified for {entry_key}")
        return False
    preprocessor_module = import_preprocessor(preprocessor_script)
    if not preprocessor_module:
        print(f"  Skipping: Preprocessor '{preprocessor_script}' not found")
        return False
    # Check if the preprocessor has the expected function
    if not hasattr(preprocessor_module, 'process_data'):
        print(f"  Error: Preprocessor '{preprocessor_script}' does not have 'process_data' function")
        return False
    
    process_function = preprocessor_module.process_data
    
    # Determine the input data file path
    # Extract the data file name from the entry key
    data_file = entry_key.split('/')[-1]  # Get the last part after the slash
    
    # Check if data file exists
    if not os.path.exists(data_file):
        print(f"  Error: Data file '{data_file}' not found")
        return False
    
    try:
        # Read the data file
        with open(data_file, 'r', encoding='utf-8') as f:
            json_content = f.read()
        
        # Process the content
        if display_category:
            lua_output = process_function(json_content, display_category)
        else:
            # For preprocessors that don't need display_category (like goods)
            lua_output = process_function(json_content)
        
        # Write the output to the target Lua file (same directory as preprocessor)
        output_filename = os.path.basename(output_page)
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(lua_output)
        
        print(f"  Success: Generated {output_filename}")
        return True
        
    except Exception as e:
        print(f"  Error: Failed to process {entry_key}: {e}")
        return False

def main():
    """Main ETL processing function."""
    # Parse command line arguments
    parser = argparse.ArgumentParser(description='ETL Manager for Against the Storm wiki data processors')
    parser.add_argument('--local', action='store_true', 
                       help='Use local file inputs and outputs (current behavior)')
    _args = parser.parse_args()  # TODO: Use _args.local to determine input/output mode
    
    print("Starting ETL processing...")
    print("=" * 50)
    
    # Load manifest
    manifest = load_manifest()
    
    for entry_key, entry_data in manifest.items():
        if process_data_file(entry_key, entry_data):
            print("File processed successfully.")
        else:
            print("File skipped.")
        print()  # Add blank line between entries
    
    print("=" * 50)
    print("ETL complete.")

if __name__ == "__main__":
    main()