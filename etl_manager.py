#!/usr/bin/env python3
"""
ETL Manager for Against the Storm wiki data processors.
Reads manifest.json and processes all data files through their respective preprocessors.
"""

import json
import os
import sys
import time
import argparse
from typing import Dict, Any, Optional
from mediawiki_client import create_client

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

def save_manifest(manifest: Dict[str, Any], manifest_path: str = "manifest.json") -> bool:
    """Save the manifest.json file with updated revision IDs."""
    try:
        with open(manifest_path, 'w', encoding='utf-8') as f:
            json.dump(manifest, f, indent=2)
        return True
    except Exception as e:
        print(f"Error: Failed to save manifest file: {e}")
        return False

def import_preprocessor(script_name: str):
    """Dynamically import a preprocessor script."""
    try:
        # Remove .py extension if present
        module_name = script_name.replace('.py', '')
        return __import__(module_name)
    except ImportError as e:
        print(f"Error: Could not import preprocessor '{script_name}': {e}")
        return None

def process_data_file(entry_key: str, entry_data: Dict[str, Any], use_local: bool = False, mediawiki_client=None) -> tuple[bool, Optional[str]]:
    """Process a single data file through its preprocessor."""
    print(f"Processing {entry_key}...")
    
    # Extract manifest data
    preprocessor_script = entry_data.get("preprocessor")
    output_page = entry_data.get("output_page")
    display_category = entry_data.get("display_category")
    last_revision_id = entry_data.get("last_revsion_id", 0)  # Note: typo in manifest
    
    if not preprocessor_script:
        print(f"  Error: No preprocessor specified for {entry_key}")
        return False, None
    if not output_page:
        print(f"  Error: No output page specified for {entry_key}")
        return False, None
    
    # Check revision ID first (only for MediaWiki mode)
    if not use_local and mediawiki_client:
        current_revision_id = mediawiki_client.get_input_file_revision_id(entry_key)
        if current_revision_id is None:
            print(f"  Error: Could not get revision ID for input file '{entry_key}'")
            return False, None
        
        # Convert to int for comparison (MediaWiki revision IDs are numeric)
        try:
            current_rev_id = int(current_revision_id)
            last_rev_id = int(last_revision_id)
            
            if current_rev_id == last_rev_id:
                print(f"  Skipped: Input file unchanged (revision {current_rev_id})")
                return True, current_revision_id  # Successfully skipped, return current revision ID
        except (ValueError, TypeError):
            print(f"  Warning: Could not compare revision IDs (current: {current_revision_id}, last: {last_revision_id})")
    
    preprocessor_module = import_preprocessor(preprocessor_script)
    if not preprocessor_module:
        print(f"  Skipping: Preprocessor '{preprocessor_script}' not found")
        return False, None
    # Check if the preprocessor has the expected function
    if not hasattr(preprocessor_module, 'process_data'):
        print(f"  Error: Preprocessor '{preprocessor_script}' does not have 'process_data' function")
        return False, None
    
    process_function = preprocessor_module.process_data
    
    try:
        # Read the data file based on mode
        if use_local:
            # Local mode: use filename from entry key
            data_file = entry_key.split('/')[-1]  # Get the last part after the slash
            
            # Check if data file exists
            if not os.path.exists(data_file):
                print(f"  Error: Data file '{data_file}' not found")
                return False, None
            
            # Read the data file
            with open(data_file, 'r', encoding='utf-8') as f:
                json_content = f.read()
        else:
            # MediaWiki mode: use full path from entry key
            if not mediawiki_client:
                print("  Error: MediaWiki client not available")
                return False, None
            
            json_content = mediawiki_client.fetch_page_content(entry_key)
            if json_content is None:
                print(f"  Error: Failed to fetch content from MediaWiki for '{entry_key}'")
                return False, None
        
        # Process the content
        if display_category:
            lua_output = process_function(json_content, display_category)
        else:
            # For preprocessors that don't need display_category (like goods)
            lua_output = process_function(json_content)
        
        # Write the output based on mode
        if use_local:
            # Local mode: write to local file
            output_filename = os.path.basename(output_page)
            with open(output_filename, 'w', encoding='utf-8') as f:
                f.write(lua_output)
            print(f"  Success: Generated {output_filename}")
            return True, None  # No revision ID for local mode
        else:
            # MediaWiki mode: update the page via API
            if not mediawiki_client:
                print("  Error: MediaWiki client not available for output")
                return False, None
            
            success = mediawiki_client.update_page_content(output_page, lua_output, f"Updated via ETL processor for {entry_key}")
            if not success:
                print(f"  Error: Failed to update MediaWiki page '{output_page}'")
                return False, None
            
            # Get the current revision ID of the input file to update manifest
            current_revision_id = mediawiki_client.get_input_file_revision_id(entry_key)
            return True, current_revision_id
        
    except Exception as e:
        print(f"  Error: Failed to process {entry_key}: {e}")
        return False, None

def main():
    """Main ETL processing function."""
    # Parse command line arguments
    parser = argparse.ArgumentParser(description='ETL Manager for Against the Storm wiki data processors')
    parser.add_argument('--local', action='store_true', 
                       help='Use local file inputs and outputs (current behavior)')
    parser.add_argument('--wiki-url', default='http://localhost:4000',
                       help='MediaWiki base URL (default: http://localhost:4000)')
    parser.add_argument('-u', '--username', 
                       help='MediaWiki username for authentication (required for API mode)')
    parser.add_argument('-p', '--password', 
                       help='MediaWiki password for authentication (required for API mode)')
    args = parser.parse_args()
    
    print("Starting ETL processing...")
    print("=" * 50)
    
    # Initialize MediaWiki client if not using local mode
    mediawiki_client = None
    if not args.local:
        # Check that credentials are provided for API mode
        if not args.username or not args.password:
            print("Error: Username and password are required for MediaWiki API mode.")
            print("Use --local for local file mode, or provide -u and -p for API mode.")
            sys.exit(1)
        
        print("Using MediaWiki API mode...")
        mediawiki_client = create_client(args.wiki_url, args.username, args.password)
        if not mediawiki_client.test_connection():
            print("Error: Could not connect to MediaWiki. Exiting.")
            sys.exit(1)
    else:
        print("Using local file mode...")
    
    # Load manifest
    manifest = load_manifest()
    manifest_updated = False
    
    for entry_key, entry_data in manifest.items():
        success, new_revision_id = process_data_file(entry_key, entry_data, args.local, mediawiki_client)
        
        if success:
            print("File processed successfully.")
            # Update manifest with new revision ID if we got one
            if new_revision_id is not None:
                entry_data["last_revsion_id"] = int(new_revision_id)
                manifest_updated = True
        else:
            print("File skipped.")
        print()  # Add blank line between entries
        
        # Add delay between requests to help with rate limiting
        if not args.local and mediawiki_client:
            time.sleep(1)  # 1 second delay between requests
    
    # Save manifest if it was updated
    if manifest_updated:
        if save_manifest(manifest):
            print("Manifest updated with new revision IDs.")
        else:
            print("Warning: Failed to save updated manifest.")
    
    print("=" * 50)
    print("ETL complete.")

if __name__ == "__main__":
    main()
