return {
    ["Mine"] = {
        _id = "Mine",
        _displayName = "Mine",
        _description = "Can only be placed on coal, copper, or salt veins. Can produce:  <sprite name=[crafting] coal> Coal (<sprite name=grade2>), <sprite name=[metal] copper ore> Copper Ore (<sprite name=grade2>), <sprite name=[crafting] salt> Salt (<sprite name=grade2>).",
        _iconFilename = "Mine_icon.png",
        _category = "Resource Acquisition",
        _categoryDisplay = "Extraction Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 33,
        _cityScore = 5,
        _isMovable = false,
        _isInitiallyEssential = false,
        _workerCapacity = 4,
        _constructionCosts = {
            {_id = "[Mat Processed] Planks", _amount = 2},
            {_id = "[Mat Processed] Bricks", _amount = 4},
            {_id = "[Mat Processed] Parts", _amount = 2}
        },
        _tags = {
            "Metallurgy",
            "Tech",
            "FoxesCooperation"
        },
        _storage = 8,
        _levels = {
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Planks", _amount = 15},
                        {_id = "[Mat Processed] Bricks", _amount = 15}
                    }
                },
                _upgrades = {
                    "[U] Mine Extra Charges Unlock 1",
                    "[U] Mine Upgrade Cart 1",
                    "[U] Mine Upgrade Speed 1"
                },
            },
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Planks", _amount = 15},
                        {_id = "[Mat Processed] Bricks", _amount = 15}
                    },
                    {
                        {_id = "[Mat Processed] Pipe", _amount = 12},
                        {_id = "[Tools] Simple Tools", _amount = 10},
                        {_id = "[Mat Processed] Parts", _amount = 4}
                    }
                },
                _upgrades = {
                    "[U] Mine Extra Charges Unlock 2",
                    "[U] Mine Upgrade Cart 2",
                    "[U] Mine Upgrade Speed 2"
                },
            }
        },
        _recipes = {
            ["[Crafting] Coal"] = {
                [2] = {
                    [1] = {
                        _buildings = {"Mine"},
                        _grade = 2,
                        _time = 35.0,
                        _productPair = {_id = "[Crafting] Coal", _amount = 1},
                        _isService = false,
                        _extraProductChances = {
                            {_id = "[Mat Raw] Stone", _amount = 1, _chance = 0.3}
                        },
                        _ingredients = {},
                    },
                },
            },
            ["[Metal] Copper Ore"] = {
                [2] = {
                    [1] = {
                        _buildings = {"Mine"},
                        _grade = 2,
                        _time = 30.0,
                        _productPair = {_id = "[Metal] Copper Ore", _amount = 1},
                        _isService = false,
                        _extraProductChances = {
                            {_id = "[Mat Raw] Clay", _amount = 1, _chance = 0.3}
                        },
                        _ingredients = {},
                    },
                },
            },
            ["[Crafting] Salt"] = {
                [2] = {
                    [1] = {
                        _buildings = {"Mine"},
                        _grade = 2,
                        _time = 30.0,
                        _productPair = {_id = "[Crafting] Salt", _amount = 1},
                        _isService = false,
                        _extraProductChances = {
                            {_id = "[Crafting] Sea Marrow", _amount = 1, _chance = 0.3}
                        },
                        _ingredients = {},
                    },
                },
            },
        },
    },
}