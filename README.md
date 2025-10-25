# againstthestorm-wiki-data-processors
Collection of python preprocessors to convert dev-provided data into ready-to-load Lua tables and pushes them to the MediaWiki database.

## How to

1. Make sure manifest.json is correctly configured with folder names, file names, and for buildings the displayed category in-game.
2. Run python etl_manager.py and examine terminal output for any surprises.

The ETL manager loops through manifest.json to grab all input files, run all preprocessors (with any auxiliary parameters like displayed category), and writes all output files.
