# againstthestorm-wiki-data-processors
Collection of python preprocessors to convert dev-provided data into ready-to-load Lua tables and pushes them to the MediaWiki database.

## How to

1. Make sure manifest.json is correctly configured with folder names, file names, and for buildings the displayed category in-game.
2. Check .env to make sure the MediaWiki site URL is correctly configured.
3. Look up your username and password.
4. Run python etl_manager -u YOUR_USERNAME -p YOUR_PASSWORD
5. Sit back and wait; it can take a while because of rate limiting

The ETL manager first authenticates with the MediaWiki server. Then it loops through manifest.json to check for any revisions, grab input files, run all preprocessors (with any auxiliary parameters like displayed category), and writes output files.

## Preprocessors written so far:

### Resources and Glades
1. resources (Goods.csv)
2. deposits (Glade_Resources.json, Trees.json, Ore.json)
3. biomes (Biomes.json)

### Buildings
1. blight posts (Blight_Posts.json)
2. camps (Camps.json, GathererHuts.json)
3. pumps (Extractors.json)
4. farms (Farms.json, Farmfields.json)
5. fishing huts (FishingHuts.json)
6. service buildings (Institutions.json)
7. mines (Mines.json)
8. rain collectors (RainCatchers.json)
9. warehouses (Storages.json)
10. workshops (Workshops.json)
11. hearths (Hearths.json)
12. houses (Houses.json)

## Maybe next?

Specializations and Species
Effects and Perks (since biomes references these)
Orders
Citadel Upgrades

