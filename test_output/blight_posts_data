return {
    ["Blight Post"] = {
        _id = "Blight Post",
        _displayName = "Blight Post",
        _description = "A specialized building dedicated to fighting Blightrot. Blight Fighters will prepare <sprite name=\"blight fuel\"> Purging Fire during drizzle and clearance seasons, and use it to burn Blightrot Cysts during the storm.",
        _iconFilename = "Blight Post_icon.png",
        _category = "City Buildings",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 5,
        _isMovable = false,
        _isInitiallyEssential = false,
        _workerCapacity = 3,
        _constructionCosts = {
            {_id = "[Mat Processed] Planks", _amount = 4},
            {_id = "[Mat Processed] Bricks", _amount = 3},
            {_id = "[Mat Processed] Parts", _amount = 2}
        },
        _tags = {
            "Alchemy",
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 20,
        _timePerCyst = 15.0,
        _levels = {
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Pipe", _amount = 4}
                    },
                    {
                        {_id = "[Packs] Pack of Building Materials", _amount = 2}
                    },
                },
                _upgrades = {
                    "[U][BP] Blight Fighter Automaton",
                    "[U][BP] Blight Fighter Speed",
                    "[U][BP] Faster Cysts Burning"
                },
            },
            {
                _upgradeCostOptions = {
                    {
                        {_id = "[Mat Processed] Pipe", _amount = 6}
                    },
                    {
                        {_id = "[Packs] Pack of Building Materials", _amount = 3}
                    },
                },
                _upgrades = {
                    "[U][BP] Blight Fighter Automaton",
                    "[U][BP] Extra Production Chance",
                    "[U][BP] Global Background - Cyst Generation Rate"
                },
            }
        },
        _recipes = {
            ["Blight Fuel"] = {
                [3] = {
                    [1] = {
                        _buildings = {"Blight Post"},
                        _grade = 3,
                        _time = 40.0,
                        _productPair = {_id = "Blight Fuel", _amount = 1},
                        _isService = false,
                        _ingredients = {
                            {
                                {_id = "[Mat Raw] Wood", _amount = 10},
                                {_id = "[Crafting] Oil", _amount = 4},
                                {_id = "[Crafting] Coal", _amount = 3},
                                {_id = "[Crafting] Sea Marrow", _amount = 3}
                            }
                        },
                    },
                },
            },
        },
    },
}