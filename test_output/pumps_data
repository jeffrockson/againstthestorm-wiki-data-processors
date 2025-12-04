return {
    ["Water Extractor"] = {
        _id = "Water Extractor",
        _displayName = "Geyser Pump",
        _description = "Used to extract and pump infused rainwater through underground pipes to production buildings, where it can be used to increase productivity. Must be placed on an active geyser. Has a tank capacity of 50.",
        _iconFilename = "Water Extractor_icon.png",
        _category = "Resource Acquisition",
        _categoryDisplay = "Extraction Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 5,
        _cityScore = 2,
        _isMovable = false,
        _isInitiallyEssential = true,
        _workerCapacity = 2,
        _constructionCosts = {
            {_id = "[Mat Processed] Planks", _amount = 6},
            {_id = "[Mat Processed] Pipe", _amount = 4}
        },
        _tags = {
            "Rainwater"
        },
        _baseTankCapacity = 50,
        _levels = {
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Pipe", _amount = 2}
                    },
                    {
                        {_id = "Hearth Parts", _amount = 1}
                    }
                },
                _upgrades = {
                    "[U] Pump Automaton"
                },
            },
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Planks", _amount = 10},
                        {_id = "[Mat Processed] Bricks", _amount = 10}
                    },
                    {
                        {_id = "[Mat Processed] Pipe", _amount = 2}
                    }
                },
                _upgrades = {
                    "[U] Extractor Tank"
                },
            },
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Pipe", _amount = 2}
                    },
                    {
                        {_id = "Hearth Parts", _amount = 1}
                    }
                },
                _upgrades = {
                    "[U] Pump Automaton"
                },
            }
        },
        _recipes = {
            ["[Water] Drizzle Water"] = {
                [1] = {
                    [2] = {
                        _buildings = {"Water Extractor"},
                        _grade = 3,
                        _time = 10.0,
                        _productPair = {_id = "[Water] Drizzle Water", _amount = 2},
                        _isService = false,
                        _ingredients = {},
                    },
                },
            },
            ["[Water] Clearance Water"] = {
                [1] = {
                    [2] = {
                        _buildings = {"Water Extractor"},
                        _grade = 3,
                        _time = 10.0,
                        _productPair = {_id = "[Water] Clearance Water", _amount = 2},
                        _isService = false,
                        _ingredients = {},
                    },
                },
            },
            ["[Water] Storm Water"] = {
                [1] = {
                    [2] = {
                        _buildings = {"Water Extractor"},
                        _grade = 3,
                        _time = 10.0,
                        _productPair = {_id = "[Water] Storm Water", _amount = 2},
                        _isService = false,
                        _ingredients = {},
                    },
                },
            },
        },
    },
}