return {
    ["Mine"] = {
        _id = "Mine",
        _displayName = "Mine",
        _description = "Can only be placed on coal, copper, or salt veins. Can produce:  <sprite name=[crafting] coal> Coal (<sprite name=grade2>), <sprite name=[metal] copper ore> Copper Ore (<sprite name=grade2>), <sprite name=[crafting] salt> Salt (<sprite name=grade2>).",
        _category = "Resource Acquisition",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 33,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 4,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 2},
            {id = "[Mat Processed] Bricks", amount = 4},
            {id = "[Mat Processed] Parts", amount = 2}
        },
        _tags = {
            "Metallurgy",
            "Tech",
            "FoxesCooperation"
        },
        _storage = 8,
        _recipes = {
            ["[Crafting] Coal"] = {
                [2] = {
                    [1] = {
                        _buildingArray = {"Mine"},
                        _grade = 2,
                        _time = 35.0,
                        _productPair = {
                            id = "[Crafting] Coal",
                            amount = 1
                        },
                        _isService = false,
                        _extraProductChances = {
                            {id = "[Mat Raw] Stone", amount = 1, chance = 0.3}
                        },
                        _ingredientsArray = {
                        }
                    },
                },
            },
            ["[Metal] Copper Ore"] = {
                [2] = {
                    [1] = {
                        _buildingArray = {"Mine"},
                        _grade = 2,
                        _time = 30.0,
                        _productPair = {
                            id = "[Metal] Copper Ore",
                            amount = 1
                        },
                        _isService = false,
                        _extraProductChances = {
                            {id = "[Mat Raw] Clay", amount = 1, chance = 0.3}
                        },
                        _ingredientsArray = {
                        }
                    },
                },
            },
            ["[Crafting] Salt"] = {
                [2] = {
                    [1] = {
                        _buildingArray = {"Mine"},
                        _grade = 2,
                        _time = 30.0,
                        _productPair = {
                            id = "[Crafting] Salt",
                            amount = 1
                        },
                        _isService = false,
                        _extraProductChances = {
                            {id = "[Crafting] Sea Marrow", amount = 1, chance = 0.3}
                        },
                        _ingredientsArray = {
                        }
                    },
                },
            },
        },
    },
    ["Alchemist Hut"] = {
        _id = "Alchemist Hut",
        _displayName = "Alchemist's Hut",
        _description = "Can produce:  <sprite name=[metal] crystalized dew> Crystalized Dew (<sprite name=grade2>), <sprite name=[needs] tea> Tea (<sprite name=grade2>), <sprite name=[needs] wine> Wine (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Alchemy",
            "Brewing",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Metal] Crystalized Dew"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Alchemist Hut"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Metal] Crystalized Dew",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 2},
                                {id = "[Food Raw] Insects", amount = 2},
                                {id = "[Mat Raw] Resin", amount = 2},
                                {id = "[Food Raw] Vegetables", amount = 2},
                                {id = "[Mat Raw] Algae", amount = 2}
                            },
                            {
                                {id = "[Mat Raw] Stone", amount = 3},
                                {id = "[Mat Raw] Clay", amount = 3},
                                {id = "[Crafting] Salt", amount = 2}
                            },
                            {
                                {id = "[Water] Storm Water", amount = 8},
                                {id = "[Water] Clearance Water", amount = 12},
                                {id = "[Water] Drizzle Water", amount = 16}
                            }
                        }
                    },
                },
            },
            ["[Needs] Tea"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Alchemist Hut"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Tea",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Food Raw] Roots", amount = 3}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 3},
                                {id = "[Water] Clearance Water", amount = 4},
                                {id = "[Water] Storm Water", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Wine"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Alchemist Hut"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Needs] Wine",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Apothecary"] = {
        _id = "Apothecary",
        _displayName = "Apothecary",
        _description = "Can produce:  <sprite name=[needs] tea> Tea (<sprite name=grade2>), <sprite name=[crafting] dye> Dye (<sprite name=grade2>), <sprite name=[food processed] jerky> Jerky (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Alchemy",
            "Rainwater",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Tea"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Apothecary"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Tea",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Food Raw] Roots", amount = 3}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 3},
                                {id = "[Water] Clearance Water", amount = 4},
                                {id = "[Water] Storm Water", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Dye"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Apothecary"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Crafting] Dye",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Metal] Copper Ore", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4},
                                {id = "[Crafting] Coal", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Jerky"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Apothecary"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Jerky",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Food Raw] Meat", amount = 5}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Salt", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Artisan"] = {
        _id = "Artisan",
        _displayName = "Artisan",
        _description = "Can produce:  <sprite name=[vessel] barrels> Barrels (<sprite name=grade2>), <sprite name=[needs] coats> Coats (<sprite name=grade2>), <sprite name=[needs] scrolls> Scrolls (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8},
            {id = "[Mat Processed] Fabric", amount = 4}
        },
        _tags = {
            "Cloth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Vessel] Barrels"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Artisan"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Vessel] Barrels",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Coats"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Artisan"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Coats",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Fabric", amount = 2},
                                {id = "[Mat Raw] Leather", amount = 2}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Scrolls"] = {
                [2] = {
                    [8] = {
                        _buildingArray = {"Artisan"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Needs] Scrolls",
                            amount = 8
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 3},
                                {id = "[Mat Raw] Plant Fibre", amount = 3},
                                {id = "[Mat Raw] Wood", amount = 8}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Needs] Wine", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Bakery"] = {
        _id = "Bakery",
        _displayName = "Bakery",
        _description = "Can produce:  <sprite name=[food processed] biscuits> Biscuits (<sprite name=grade2>), <sprite name=[food processed] pie> Pie (<sprite name=grade2>), <sprite name=[vessel] pottery> Pottery (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Biscuits"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Bakery"},
                        _grade = 2,
                        _time = 110.0,
                        _productPair = {
                            id = "[Food Processed] Biscuits",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Roots", amount = 3},
                                {id = "[Food Raw] Eggs", amount = 3},
                                {id = "[Crafting] Salt", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pie"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Bakery"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pie",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4},
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Pottery"] = {
                [2] = {
                    [5] = {
                        _buildingArray = {"Bakery"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Pottery",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 3}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Beanery"] = {
        _id = "Beanery",
        _displayName = "Beanery",
        _description = "Can produce:  <sprite name=[food processed] porridge> Porridge (<sprite name=grade3>), <sprite name=[food processed] pickled goods> Pickled Goods (<sprite name=grade1>), <sprite name=[metal] crystalized dew> Crystalized Dew (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8},
            {id = "[Mat Processed] Bricks", amount = 4}
        },
        _tags = {
            "Warmth",
            "Rainwater",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Porridge"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Beanery"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Porridge",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 4},
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Mushrooms", amount = 4},
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 6},
                                {id = "[Water] Clearance Water", amount = 8},
                                {id = "[Water] Storm Water", amount = 10}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pickled Goods"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Beanery"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pickled Goods",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Vegetables", amount = 6},
                                {id = "[Food Raw] Mushrooms", amount = 6},
                                {id = "[Food Raw] Roots", amount = 6},
                                {id = "[Food Raw] Berries", amount = 6},
                                {id = "[Food Raw] Eggs", amount = 6}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Metal] Crystalized Dew"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Beanery"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Metal] Crystalized Dew",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3},
                                {id = "[Food Raw] Vegetables", amount = 3},
                                {id = "[Mat Raw] Algae", amount = 3}
                            },
                            {
                                {id = "[Mat Raw] Stone", amount = 4},
                                {id = "[Mat Raw] Clay", amount = 4},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Water] Storm Water", amount = 10},
                                {id = "[Water] Clearance Water", amount = 14},
                                {id = "[Water] Drizzle Water", amount = 18}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Brewery"] = {
        _id = "Brewery",
        _displayName = "Brewery",
        _description = "Can produce:  <sprite name=[needs] ale> Ale (<sprite name=grade3>), <sprite name=[food processed] porridge> Porridge (<sprite name=grade2>), <sprite name=[packs] pack of crops> Pack of Crops (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 2},
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Ale"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Brewery"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Ale",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 2},
                                {id = "[Vessel] Barrels", amount = 1},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Porridge"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Brewery"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Porridge",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 7},
                                {id = "[Water] Clearance Water", amount = 9},
                                {id = "[Water] Storm Water", amount = 11}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Crops"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Brewery"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Crops",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Brick Oven"] = {
        _id = "Brick Oven",
        _displayName = "Brick Oven",
        _description = "Can produce:  <sprite name=[food processed] biscuits> Biscuits (<sprite name=grade3>), <sprite name=[needs] incense> Incense (<sprite name=grade2>), <sprite name=[crafting] coal> Coal (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 5}
        },
        _tags = {
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Food Processed] Biscuits"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Brick Oven"},
                        _grade = 3,
                        _time = 90.0,
                        _productPair = {
                            id = "[Food Processed] Biscuits",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 2},
                                {id = "[Food Raw] Berries", amount = 2},
                                {id = "[Food Raw] Roots", amount = 2},
                                {id = "[Food Raw] Eggs", amount = 2},
                                {id = "[Crafting] Salt", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Incense"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Brick Oven"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Incense",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5},
                                {id = "[Crafting] Salt", amount = 5},
                                {id = "[Mat Raw] Resin", amount = 7}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 6},
                                {id = "[Crafting] Oil", amount = 3},
                                {id = "[Crafting] Coal", amount = 2},
                                {id = "[Crafting] Sea Marrow", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Coal"] = {
                [1] = {
                    [3] = {
                        _buildingArray = {"Brick Oven"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Crafting] Coal",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 15},
                                {id = "[Mat Raw] Algae", amount = 8}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Brickyard"] = {
        _id = "Brickyard",
        _displayName = "Brickyard",
        _description = "Can produce:  <sprite name=[mat processed] bricks> Bricks (<sprite name=grade3>), <sprite name=[vessel] pottery> Pottery (<sprite name=grade2>), <sprite name=[metal] crystalized dew> Crystalized Dew (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 25,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8}
        },
        _tags = {
            "Stone",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Bricks"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Brickyard"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Mat Processed] Bricks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 2},
                                {id = "[Mat Raw] Stone", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Pottery"] = {
                [2] = {
                    [5] = {
                        _buildingArray = {"Brickyard"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Pottery",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 3}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Metal] Crystalized Dew"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Brickyard"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Metal] Crystalized Dew",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3},
                                {id = "[Food Raw] Vegetables", amount = 3},
                                {id = "[Mat Raw] Algae", amount = 3}
                            },
                            {
                                {id = "[Mat Raw] Stone", amount = 4},
                                {id = "[Mat Raw] Clay", amount = 4},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Water] Storm Water", amount = 10},
                                {id = "[Water] Clearance Water", amount = 14},
                                {id = "[Water] Drizzle Water", amount = 18}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Butcher"] = {
        _id = "Butcher",
        _displayName = "Butcher",
        _description = "Can produce:  <sprite name=[food processed] skewers> Skewers (<sprite name=grade2>), <sprite name=[food processed] jerky> Jerky (<sprite name=grade2>), <sprite name=[crafting] oil> Oil (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Animals",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Skewers"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Butcher"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Skewers",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Food Raw] Fish", amount = 3},
                                {id = "[Food Processed] Jerky", amount = 2}
                            },
                            {
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Jerky"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Butcher"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Jerky",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Food Raw] Meat", amount = 5}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Salt", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Oil"] = {
                [2] = {
                    [5] = {
                        _buildingArray = {"Butcher"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Crafting] Oil",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Food Raw] Vegetables", amount = 3},
                                {id = "[Mat Raw] Plant Fibre", amount = 3},
                                {id = "[Food Raw] Fish", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Cannery"] = {
        _id = "Cannery",
        _displayName = "Cannery",
        _description = "Can produce:  <sprite name=[food processed] paste> Paste (<sprite name=grade3>), <sprite name=[needs] wine> Wine (<sprite name=grade2>), <sprite name=[food processed] biscuits> Biscuits (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Paste"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Cannery"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Paste",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Food Raw] Eggs", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Needs] Wine"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Cannery"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Needs] Wine",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Biscuits"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Cannery"},
                        _grade = 1,
                        _time = 110.0,
                        _productPair = {
                            id = "[Food Processed] Biscuits",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4},
                                {id = "[Crafting] Salt", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Carpenter"] = {
        _id = "Carpenter",
        _displayName = "Carpenter",
        _description = "Can produce:  <sprite name=[mat processed] planks> Planks (<sprite name=grade2>), <sprite name=[tools] simple tools> Tools (<sprite name=grade2>), <sprite name=[packs] pack of luxury goods> Pack of Luxury Goods (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Wood",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Planks"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Carpenter"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Planks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Tools] Simple Tools"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Carpenter"},
                        _grade = 2,
                        _time = 75.0,
                        _productPair = {
                            id = "[Tools] Simple Tools",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 8},
                                {id = "[Mat Processed] Planks", amount = 2}
                            },
                            {
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Luxury Goods"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Carpenter"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Luxury Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Needs] Wine", amount = 4},
                                {id = "[Needs] Training Gear", amount = 4},
                                {id = "[Needs] Incense", amount = 4},
                                {id = "[Needs] Scrolls", amount = 4},
                                {id = "[Needs] Ale", amount = 4},
                                {id = "[Needs] Tea", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Cellar"] = {
        _id = "Cellar",
        _displayName = "Cellar",
        _description = "Can produce:  <sprite name=[needs] wine> Wine (<sprite name=grade3>), <sprite name=[food processed] pickled goods> Pickled Goods (<sprite name=grade2>), <sprite name=[packs] pack of provisions> Pack of Provisions (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Wine"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Cellar"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Needs] Wine",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Berries", amount = 2},
                                {id = "[Food Raw] Mushrooms", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 2},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pickled Goods"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Cellar"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pickled Goods",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Food Raw] Eggs", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Provisions"] = {
                [1] = {
                    [3] = {
                        _buildingArray = {"Cellar"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Provisions",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Food Raw] Meat", amount = 5},
                                {id = "[Food Raw] Eggs", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Clay Pit Workshop"] = {
        _id = "Clay Pit Workshop",
        _displayName = "Clay Pit",
        _description = "Uses Clearance Water to produce goods regardless of the season. Must be placed on fertile soil. Can produce:  <sprite name=[mat raw] clay> Clay (<sprite name=grade2>), <sprite name=[mat raw] reeds> Reed (<sprite name=grade2>), <sprite name=[mat raw] resin> Resin (<sprite name=grade2>)\nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Resource Acquisition",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 30,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Stone",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Raw] Clay"] = {
                [2] = {
                    [4] = {
                        _buildingArray = {"Clay Pit Workshop"},
                        _grade = 2,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Raw] Clay",
                            amount = 4
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Water] Clearance Water", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Mat Raw] Reeds"] = {
                [2] = {
                    [4] = {
                        _buildingArray = {"Clay Pit Workshop"},
                        _grade = 2,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Raw] Reeds",
                            amount = 4
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Water] Clearance Water", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Mat Raw] Resin"] = {
                [2] = {
                    [4] = {
                        _buildingArray = {"Clay Pit Workshop"},
                        _grade = 2,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Raw] Resin",
                            amount = 4
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Water] Clearance Water", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Clothier"] = {
        _id = "Clothier",
        _displayName = "Clothier",
        _description = "Can produce:  <sprite name=[needs] coats> Coats (<sprite name=grade3>), <sprite name=[packs] pack of building materials> Pack of Building Materials (<sprite name=grade2>), <sprite name=[vessel] waterskin> Waterskins (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Cloth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Needs] Coats"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Clothier"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Coats",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Fabric", amount = 1},
                                {id = "[Mat Raw] Leather", amount = 1}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Mat Raw] Resin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Building Materials"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Clothier"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Building Materials",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Planks", amount = 7},
                                {id = "[Mat Processed] Fabric", amount = 4},
                                {id = "[Mat Processed] Bricks", amount = 4},
                                {id = "[Metal] Copper Ore", amount = 10}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Waterskin"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Clothier"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Waterskin",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 6},
                                {id = "[Mat Raw] Scales", amount = 6}
                            },
                            {
                                {id = "[Crafting] Oil", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4},
                                {id = "[Crafting] Salt", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Cobbler"] = {
        _id = "Cobbler",
        _displayName = "Cobbler",
        _description = "Can produce:  <sprite name=[needs] boots> Boots (<sprite name=grade3>), <sprite name=[packs] pack of building materials> Pack of Building Materials (<sprite name=grade2>), <sprite name=[crafting] dye> Dye (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8}
        },
        _tags = {
            "Cloth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Needs] Boots"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Cobbler"},
                        _grade = 3,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Boots",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 3},
                                {id = "[Mat Raw] Scales", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Building Materials"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Cobbler"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Building Materials",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Planks", amount = 7},
                                {id = "[Mat Processed] Fabric", amount = 4},
                                {id = "[Mat Processed] Bricks", amount = 4},
                                {id = "[Metal] Copper Ore", amount = 10}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Dye"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Cobbler"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Crafting] Dye",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Metal] Copper Ore", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5},
                                {id = "[Crafting] Coal", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Cookhouse"] = {
        _id = "Cookhouse",
        _displayName = "Cookhouse",
        _description = "Can produce:  <sprite name=[food processed] skewers> Skewers (<sprite name=grade2>), <sprite name=[food processed] biscuits> Biscuits (<sprite name=grade2>), <sprite name=[food processed] porridge> Porridge (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 4,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 4,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8},
            {id = "[Mat Processed] Bricks", amount = 4}
        },
        _tags = {
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Skewers"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Cookhouse"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Skewers",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Food Raw] Fish", amount = 3},
                                {id = "[Food Processed] Jerky", amount = 2}
                            },
                            {
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Biscuits"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Cookhouse"},
                        _grade = 2,
                        _time = 110.0,
                        _productPair = {
                            id = "[Food Processed] Biscuits",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Roots", amount = 3},
                                {id = "[Food Raw] Eggs", amount = 3},
                                {id = "[Crafting] Salt", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Porridge"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Cookhouse"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Porridge",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 7},
                                {id = "[Water] Clearance Water", amount = 9},
                                {id = "[Water] Storm Water", amount = 11}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Cooperage"] = {
        _id = "Cooperage",
        _displayName = "Cooperage",
        _description = "Can produce:  <sprite name=[vessel] barrels> Barrels (<sprite name=grade3>), <sprite name=[needs] coats> Coats (<sprite name=grade2>), <sprite name=[packs] pack of luxury goods> Pack of Luxury Goods (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Wood",
            "Metallurgy",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Vessel] Barrels"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Cooperage"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Vessel] Barrels",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 1},
                                {id = "[Metal] Crystalized Dew", amount = 1}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Coats"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Cooperage"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Coats",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Fabric", amount = 2},
                                {id = "[Mat Raw] Leather", amount = 2}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Luxury Goods"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Cooperage"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Luxury Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Needs] Wine", amount = 5},
                                {id = "[Needs] Training Gear", amount = 5},
                                {id = "[Needs] Incense", amount = 5},
                                {id = "[Needs] Scrolls", amount = 5},
                                {id = "[Needs] Ale", amount = 5},
                                {id = "[Needs] Tea", amount = 5}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Crude Workstation"] = {
        _id = "Crude Workstation",
        _displayName = "Crude Workstation",
        _description = "Can produce:  <sprite name=[mat processed] planks> Planks (<sprite name=grade0>), <sprite name=[mat processed] fabric> Fabric (<sprite name=grade0>), <sprite name=[mat processed] bricks> Bricks (<sprite name=grade0>), <sprite name=[mat processed] pipe> Pipes (<sprite name=grade0>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 2,
        _movable = true,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Raw] Wood", amount = 5}
        },
        _tags = {
            "FoxesCooperation"
        },
        _storage = 5,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Planks"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Crude Workstation"},
                        _grade = 0,
                        _time = 56.0,
                        _productPair = {
                            id = "[Mat Processed] Planks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 8}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Fabric"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Crude Workstation"},
                        _grade = 0,
                        _time = 56.0,
                        _productPair = {
                            id = "[Mat Processed] Fabric",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Plant Fibre", amount = 6},
                                {id = "[Mat Raw] Reeds", amount = 6},
                                {id = "[Mat Raw] Algae", amount = 6}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Bricks"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Crude Workstation"},
                        _grade = 0,
                        _time = 56.0,
                        _productPair = {
                            id = "[Mat Processed] Bricks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 6},
                                {id = "[Mat Raw] Stone", amount = 6}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Pipe"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Crude Workstation"},
                        _grade = 0,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Processed] Pipe",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Distillery"] = {
        _id = "Distillery",
        _displayName = "Distillery",
        _description = "Can produce:  <sprite name=[needs] ale> Ale (<sprite name=grade2>), <sprite name=[needs] incense> Incense (<sprite name=grade2>), <sprite name=[food processed] pickled goods> Pickled Goods (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 2},
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "Rainwater",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Ale"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Distillery"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Ale",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Incense"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Distillery"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Incense",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5},
                                {id = "[Crafting] Salt", amount = 5},
                                {id = "[Mat Raw] Resin", amount = 7}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 6},
                                {id = "[Crafting] Oil", amount = 3},
                                {id = "[Crafting] Coal", amount = 2},
                                {id = "[Crafting] Sea Marrow", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pickled Goods"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Distillery"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pickled Goods",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Food Raw] Eggs", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Druid"] = {
        _id = "Druid",
        _displayName = "Druid's Hut",
        _description = "Can produce:  <sprite name=[crafting] oil> Oil (<sprite name=grade3>), <sprite name=[needs] tea> Tea (<sprite name=grade2>), <sprite name=[needs] coats> Coats (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 30,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Alchemy",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Oil"] = {
                [3] = {
                    [5] = {
                        _buildingArray = {"Druid"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Oil",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 2},
                                {id = "[Food Raw] Meat", amount = 2},
                                {id = "[Food Raw] Vegetables", amount = 2},
                                {id = "[Mat Raw] Plant Fibre", amount = 2},
                                {id = "[Food Raw] Fish", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Tea"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Druid"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Tea",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Mat Raw] Resin", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Food Raw] Roots", amount = 3}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 3},
                                {id = "[Water] Clearance Water", amount = 4},
                                {id = "[Water] Storm Water", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Coats"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Druid"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Coats",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Fabric", amount = 3},
                                {id = "[Mat Raw] Leather", amount = 3}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 4},
                                {id = "[Mat Raw] Resin", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Field Kitchen"] = {
        _id = "Field Kitchen",
        _displayName = "Field Kitchen",
        _description = "Can produce:  <sprite name=[food processed] skewers> Skewers (<sprite name=grade0>), <sprite name=[food processed] paste> Paste (<sprite name=grade0>), <sprite name=[food processed] biscuits> Biscuits (<sprite name=grade0>), <sprite name=[food processed] pickled goods> Pickled Goods (<sprite name=grade0>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = true,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Skewers"] = {
                [0] = {
                    [10] = {
                        _buildingArray = {"Field Kitchen"},
                        _grade = 0,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Skewers",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Food Raw] Meat", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5},
                                {id = "[Food Processed] Jerky", amount = 4}
                            },
                            {
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Food Raw] Eggs", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Paste"] = {
                [0] = {
                    [10] = {
                        _buildingArray = {"Field Kitchen"},
                        _grade = 0,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Paste",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Food Raw] Eggs", amount = 8},
                                {id = "[Food Raw] Fish", amount = 8},
                                {id = "[Food Raw] Meat", amount = 8}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Biscuits"] = {
                [0] = {
                    [10] = {
                        _buildingArray = {"Field Kitchen"},
                        _grade = 0,
                        _time = 110.0,
                        _productPair = {
                            id = "[Food Processed] Biscuits",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 8}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4},
                                {id = "[Crafting] Salt", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pickled Goods"] = {
                [0] = {
                    [10] = {
                        _buildingArray = {"Field Kitchen"},
                        _grade = 0,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pickled Goods",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Vegetables", amount = 7},
                                {id = "[Food Raw] Mushrooms", amount = 7},
                                {id = "[Food Raw] Roots", amount = 7},
                                {id = "[Food Raw] Berries", amount = 7},
                                {id = "[Food Raw] Eggs", amount = 7}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Finesmith"] = {
        _id = "Finesmith",
        _displayName = "Finesmith",
        _description = "Can produce:  <sprite name=[valuable] amber> Amber (<sprite name=grade3>), <sprite name=[tools] simple tools> Tools (<sprite name=grade3>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 10,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 10},
            {id = "[Mat Processed] Bricks", amount = 10}
        },
        _tags = {
            "Metallurgy",
            "Tech",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Valuable] Amber"] = {
                [3] = {
                    [1] = {
                        _buildingArray = {"Finesmith"},
                        _grade = 3,
                        _time = 42.0,
                        _productPair = {
                            id = "[Valuable] Amber",
                            amount = 1
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Resin", amount = 3}
                            },
                            {
                                {id = "[Water] Clearance Water", amount = 10},
                                {id = "[Crafting] Oil", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Tools] Simple Tools"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Finesmith"},
                        _grade = 3,
                        _time = 60.0,
                        _productPair = {
                            id = "[Tools] Simple Tools",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 6},
                                {id = "[Mat Processed] Planks", amount = 1}
                            },
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Brewery"] = {
        _id = "Flawless Brewery",
        _displayName = "Flawless Brewery",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[needs] ale> Ale (<sprite name=grade3>), <sprite name=[food processed] porridge> Porridge (<sprite name=grade3>), <sprite name=[packs] pack of crops> Pack of Crops (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 2},
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Ale"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Brewery"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Ale",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 2},
                                {id = "[Vessel] Barrels", amount = 1},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Porridge"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Brewery"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Porridge",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 4},
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Mushrooms", amount = 4},
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 6},
                                {id = "[Water] Clearance Water", amount = 8},
                                {id = "[Water] Storm Water", amount = 10}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Crops"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Flawless Brewery"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Packs] Pack of Crops",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Roots", amount = 3},
                                {id = "[Food Raw] Grain", amount = 3},
                                {id = "[Food Raw] Vegetables", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Cellar"] = {
        _id = "Flawless Cellar",
        _displayName = "Flawless Cellar",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[needs] wine> Wine (<sprite name=grade3>), <sprite name=[food processed] pickled goods> Pickled Goods (<sprite name=grade3>), <sprite name=[packs] pack of provisions> Pack of Provisions (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Wine"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Cellar"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Needs] Wine",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Berries", amount = 2},
                                {id = "[Food Raw] Mushrooms", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 2},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pickled Goods"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Cellar"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Pickled Goods",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Mushrooms", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Provisions"] = {
                [3] = {
                    [3] = {
                        _buildingArray = {"Flawless Cellar"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Packs] Pack of Provisions",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Food Raw] Eggs", amount = 3},
                                {id = "[Food Raw] Fish", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Cooperage"] = {
        _id = "Flawless Cooperage",
        _displayName = "Flawless Cooperage",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[vessel] barrels> Barrels (<sprite name=grade3>), <sprite name=[needs] coats> Coats (<sprite name=grade3>), <sprite name=[packs] pack of luxury goods> Pack of Luxury Goods (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Wood",
            "FoxesCooperation",
            "Metallurgy"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Vessel] Barrels"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Cooperage"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Vessel] Barrels",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 1},
                                {id = "[Metal] Crystalized Dew", amount = 1}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Coats"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Cooperage"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Coats",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Fabric", amount = 1},
                                {id = "[Mat Raw] Leather", amount = 1}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Mat Raw] Resin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Luxury Goods"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Flawless Cooperage"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Packs] Pack of Luxury Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Needs] Wine", amount = 3},
                                {id = "[Needs] Training Gear", amount = 3},
                                {id = "[Needs] Incense", amount = 3},
                                {id = "[Needs] Scrolls", amount = 3},
                                {id = "[Needs] Ale", amount = 3},
                                {id = "[Needs] Tea", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Druid"] = {
        _id = "Flawless Druid",
        _displayName = "Flawless Druid's Hut",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[crafting] oil> Oil (<sprite name=grade3>), <sprite name=[needs] tea> Tea (<sprite name=grade3>), <sprite name=[needs] coats> Coats (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 30,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Alchemy",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Oil"] = {
                [3] = {
                    [5] = {
                        _buildingArray = {"Flawless Druid"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Oil",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 2},
                                {id = "[Food Raw] Meat", amount = 2},
                                {id = "[Food Raw] Vegetables", amount = 2},
                                {id = "[Mat Raw] Plant Fibre", amount = 2},
                                {id = "[Food Raw] Fish", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Tea"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Druid"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Tea",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 2},
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Mat Raw] Resin", amount = 2},
                                {id = "[Food Raw] Mushrooms", amount = 2},
                                {id = "[Food Raw] Roots", amount = 2}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 2},
                                {id = "[Water] Clearance Water", amount = 3},
                                {id = "[Water] Storm Water", amount = 4}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 2},
                                {id = "[Vessel] Barrels", amount = 1},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Coats"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Druid"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Coats",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Fabric", amount = 1},
                                {id = "[Mat Raw] Leather", amount = 1}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Mat Raw] Resin", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Leatherworks"] = {
        _id = "Flawless Leatherworks",
        _displayName = "Flawless Leatherworker",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[vessel] waterskin> Waterskins (<sprite name=grade3>), <sprite name=[needs] boots> Boots (<sprite name=grade3>), <sprite name=[needs] training gear> Training Gear (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 25,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Cloth",
            "Animals",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Vessel] Waterskin"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Leatherworks"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Vessel] Waterskin",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4}
                            },
                            {
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Food Raw] Meat", amount = 2},
                                {id = "[Crafting] Salt", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Boots"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Leatherworks"},
                        _grade = 3,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Boots",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 3},
                                {id = "[Mat Raw] Scales", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Training Gear"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Leatherworks"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Training Gear",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Stone", amount = 3},
                                {id = "[Metal] Copper Bar", amount = 1},
                                {id = "[Metal] Crystalized Dew", amount = 1}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2},
                                {id = "[Mat Raw] Leather", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Rain Mill"] = {
        _id = "Flawless Rain Mill",
        _displayName = "Flawless Rain Mill",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[crafting] flour> Flour (<sprite name=grade3>), <sprite name=[needs] scrolls> Scrolls (<sprite name=grade3>), <sprite name=[food processed] paste> Paste (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Tech",
            "Farming",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Flour"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Rain Mill"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Flour",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Mat Raw] Algae", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Needs] Scrolls"] = {
                [3] = {
                    [8] = {
                        _buildingArray = {"Flawless Rain Mill"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Needs] Scrolls",
                            amount = 8
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 2},
                                {id = "[Mat Raw] Plant Fibre", amount = 2},
                                {id = "[Mat Raw] Wood", amount = 6}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 1},
                                {id = "[Needs] Wine", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Paste"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Rain Mill"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Paste",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Food Raw] Eggs", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Flawless Smelter"] = {
        _id = "Flawless Smelter",
        _displayName = "Flawless Smelter",
        _description = "An upgraded production building with all recipes at the highest grade. Can produce:  <sprite name=[metal] copper bar> Copper Bars (<sprite name=grade3>), <sprite name=[needs] training gear> Training Gear (<sprite name=grade3>), <sprite name=[food processed] pie> Pie (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 4}
        },
        _tags = {
            "Metallurgy",
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Metal] Copper Bar"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Flawless Smelter"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Metal] Copper Bar",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Ore", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Needs] Training Gear"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Smelter"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Training Gear",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Stone", amount = 3},
                                {id = "[Metal] Copper Bar", amount = 1},
                                {id = "[Metal] Crystalized Dew", amount = 1}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2},
                                {id = "[Mat Raw] Leather", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pie"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Flawless Smelter"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Pie",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Fish", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Furnace"] = {
        _id = "Furnace",
        _displayName = "Furnace",
        _description = "Can produce:  <sprite name=[food processed] pie> Pie (<sprite name=grade2>), <sprite name=[food processed] skewers> Skewers (<sprite name=grade2>), <sprite name=[metal] copper bar> Copper Bars (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Metallurgy",
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Pie"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Furnace"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pie",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4},
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Skewers"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Furnace"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Skewers",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Food Raw] Mushrooms", amount = 3},
                                {id = "[Food Raw] Fish", amount = 3},
                                {id = "[Food Processed] Jerky", amount = 2}
                            },
                            {
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Metal] Copper Bar"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Furnace"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Metal] Copper Bar",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Ore", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Granary"] = {
        _id = "Granary",
        _displayName = "Granary",
        _description = "Can produce:  <sprite name=[food processed] pickled goods> Pickled Goods (<sprite name=grade2>), <sprite name=[mat processed] fabric> Fabric (<sprite name=grade2>), <sprite name=[packs] pack of crops> Pack of Crops (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 30,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Farming",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Pickled Goods"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Granary"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pickled Goods",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Food Raw] Eggs", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Fabric"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Granary"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Fabric",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Plant Fibre", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Algae", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Crops"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Granary"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Crops",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Roots", amount = 4},
                                {id = "[Food Raw] Grain", amount = 4},
                                {id = "[Food Raw] Vegetables", amount = 4},
                                {id = "[Food Raw] Mushrooms", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Greenhouse Workshop"] = {
        _id = "Greenhouse Workshop",
        _displayName = "Greenhouse",
        _description = "Uses Drizzle Water to grow crops regardless of the season. Must be placed on fertile soil. Can produce:  <sprite name=[food raw] mushrooms> Mushrooms (<sprite name=grade2>), <sprite name=[food raw] herbs> Herbs (<sprite name=grade2>)",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 30,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Farming",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "None",
        _recipes = {
            ["[Food Raw] Mushrooms"] = {
                [2] = {
                    [4] = {
                        _buildingArray = {"Greenhouse Workshop"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Food Raw] Mushrooms",
                            amount = 4
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Water] Drizzle Water", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Food Raw] Herbs"] = {
                [2] = {
                    [4] = {
                        _buildingArray = {"Greenhouse Workshop"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Food Raw] Herbs",
                            amount = 4
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Water] Drizzle Water", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Grill"] = {
        _id = "Grill",
        _displayName = "Grill",
        _description = "Can produce:  <sprite name=[food processed] skewers> Skewers (<sprite name=grade3>), <sprite name=[food processed] paste> Paste (<sprite name=grade2>), <sprite name=[metal] copper bar> Copper Bars (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Animals",
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Skewers"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Grill"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Skewers",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 2},
                                {id = "[Food Raw] Meat", amount = 2},
                                {id = "[Food Raw] Mushrooms", amount = 2},
                                {id = "[Food Raw] Fish", amount = 2},
                                {id = "[Food Processed] Jerky", amount = 1}
                            },
                            {
                                {id = "[Food Raw] Vegetables", amount = 3},
                                {id = "[Food Raw] Roots", amount = 3},
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Food Raw] Eggs", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Paste"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Grill"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Paste",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Food Raw] Eggs", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5},
                                {id = "[Food Raw] Meat", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Metal] Copper Bar"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Grill"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Metal] Copper Bar",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Ore", amount = 6},
                                {id = "[Mat Raw] Scales", amount = 6}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Kiln"] = {
        _id = "Kiln",
        _displayName = "Kiln",
        _description = "Can produce:  <sprite name=[crafting] coal> Coal (<sprite name=grade3>), <sprite name=[mat processed] bricks> Bricks (<sprite name=grade1>), <sprite name=[food processed] jerky> Jerky (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 4}
        },
        _tags = {
            "Warmth",
            "Stone",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Crafting] Coal"] = {
                [3] = {
                    [5] = {
                        _buildingArray = {"Kiln"},
                        _grade = 3,
                        _time = 84.0,
                        _productPair = {
                            id = "[Crafting] Coal",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 10},
                                {id = "[Mat Raw] Algae", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Bricks"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Kiln"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Bricks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 4},
                                {id = "[Mat Raw] Stone", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Jerky"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Kiln"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Jerky",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 6},
                                {id = "[Food Raw] Meat", amount = 6}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Salt", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Leatherworks"] = {
        _id = "Leatherworks",
        _displayName = "Leatherworker",
        _description = "Can produce:  <sprite name=[vessel] waterskin> Waterskins (<sprite name=grade3>), <sprite name=[needs] boots> Boots (<sprite name=grade2>), <sprite name=[needs] training gear> Training Gear (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 25,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Cloth",
            "Animals",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Vessel] Waterskin"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Leatherworks"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Vessel] Waterskin",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4}
                            },
                            {
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Food Raw] Meat", amount = 2},
                                {id = "[Crafting] Salt", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Boots"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Leatherworks"},
                        _grade = 2,
                        _time = 168.0,
                        _productPair = {
                            id = "[Needs] Boots",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Needs] Training Gear"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Leatherworks"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Training Gear",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Stone", amount = 8},
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Leather", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Lumbermill"] = {
        _id = "Lumbermill",
        _displayName = "Lumber Mill",
        _description = "Can produce:  <sprite name=[mat processed] planks> Planks (<sprite name=grade3>), <sprite name=[needs] scrolls> Scrolls (<sprite name=grade1>), <sprite name=[packs] pack of trade goods> Pack of Trade Goods (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 25,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Wood",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Planks"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Lumbermill"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Mat Processed] Planks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Scrolls"] = {
                [1] = {
                    [8] = {
                        _buildingArray = {"Lumbermill"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Needs] Scrolls",
                            amount = 8
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 4},
                                {id = "[Mat Raw] Plant Fibre", amount = 4},
                                {id = "[Mat Raw] Wood", amount = 10}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Needs] Wine", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Trade Goods"] = {
                [1] = {
                    [2] = {
                        _buildingArray = {"Lumbermill"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Trade Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 8},
                                {id = "[Crafting] Oil", amount = 8},
                                {id = "[Crafting] Flour", amount = 6},
                                {id = "[Vessel] Pottery", amount = 6},
                                {id = "[Vessel] Barrels", amount = 6},
                                {id = "[Vessel] Waterskin", amount = 6}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Makeshift Post"] = {
        _id = "Makeshift Post",
        _displayName = "Makeshift Post",
        _description = "Can produce:  <sprite name=[packs] pack of crops> Pack of Crops (<sprite name=grade0>), <sprite name=[packs] pack of provisions> Pack of Provisions (<sprite name=grade0>), <sprite name=[packs] pack of building materials> Pack of Building Materials (<sprite name=grade0>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 2,
        _movable = true,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Raw] Wood", amount = 5}
        },
        _tags = {
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Packs] Pack of Crops"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Makeshift Post"},
                        _grade = 0,
                        _time = 56.0,
                        _productPair = {
                            id = "[Packs] Pack of Crops",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Roots", amount = 6},
                                {id = "[Food Raw] Grain", amount = 6},
                                {id = "[Food Raw] Vegetables", amount = 6},
                                {id = "[Food Raw] Mushrooms", amount = 6}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Provisions"] = {
                [0] = {
                    [3] = {
                        _buildingArray = {"Makeshift Post"},
                        _grade = 0,
                        _time = 56.0,
                        _productPair = {
                            id = "[Packs] Pack of Provisions",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 6},
                                {id = "[Food Raw] Berries", amount = 6},
                                {id = "[Food Raw] Insects", amount = 6},
                                {id = "[Food Raw] Meat", amount = 6},
                                {id = "[Food Raw] Eggs", amount = 6},
                                {id = "[Food Raw] Fish", amount = 6}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Building Materials"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Makeshift Post"},
                        _grade = 0,
                        _time = 56.0,
                        _productPair = {
                            id = "[Packs] Pack of Building Materials",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Processed] Planks", amount = 10},
                                {id = "[Mat Processed] Fabric", amount = 6},
                                {id = "[Mat Processed] Bricks", amount = 6},
                                {id = "[Metal] Copper Ore", amount = 14}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Manufactory"] = {
        _id = "Manufactory",
        _displayName = "Manufactory",
        _description = "Can produce:  <sprite name=[mat processed] fabric> Fabric (<sprite name=grade2>), <sprite name=[vessel] barrels> Barrels (<sprite name=grade2>), <sprite name=[crafting] dye> Dye (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Cloth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Fabric"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Manufactory"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Fabric",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Plant Fibre", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Algae", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Barrels"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Manufactory"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Vessel] Barrels",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Dye"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Manufactory"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Crafting] Dye",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Metal] Copper Ore", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4},
                                {id = "[Crafting] Coal", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Pantry"] = {
        _id = "Pantry",
        _displayName = "Pantry",
        _description = "Can produce:  <sprite name=[food processed] porridge> Porridge (<sprite name=grade2>), <sprite name=[food processed] pie> Pie (<sprite name=grade2>), <sprite name=[packs] pack of luxury goods> Pack of Luxury Goods (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 30,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Farming",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Porridge"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Pantry"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Porridge",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Vegetables", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 7},
                                {id = "[Water] Clearance Water", amount = 9},
                                {id = "[Water] Storm Water", amount = 11}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pie"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Pantry"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pie",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4},
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Luxury Goods"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Pantry"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Luxury Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Needs] Wine", amount = 4},
                                {id = "[Needs] Training Gear", amount = 4},
                                {id = "[Needs] Incense", amount = 4},
                                {id = "[Needs] Scrolls", amount = 4},
                                {id = "[Needs] Ale", amount = 4},
                                {id = "[Needs] Tea", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Press"] = {
        _id = "Press",
        _displayName = "Press",
        _description = "Can produce:  <sprite name=[crafting] oil> Oil (<sprite name=grade3>), <sprite name=[crafting] flour> Flour (<sprite name=grade1>), <sprite name=[food processed] paste> Paste (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Tech",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Oil"] = {
                [3] = {
                    [5] = {
                        _buildingArray = {"Press"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Oil",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 2},
                                {id = "[Food Raw] Meat", amount = 2},
                                {id = "[Food Raw] Vegetables", amount = 2},
                                {id = "[Mat Raw] Plant Fibre", amount = 2},
                                {id = "[Food Raw] Fish", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Flour"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Press"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Crafting] Flour",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 8},
                                {id = "[Food Raw] Mushrooms", amount = 8},
                                {id = "[Food Raw] Roots", amount = 8},
                                {id = "[Mat Raw] Algae", amount = 8}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Paste"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Press"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Paste",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Food Raw] Eggs", amount = 6},
                                {id = "[Food Raw] Fish", amount = 6},
                                {id = "[Food Raw] Meat", amount = 6}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Provisioner"] = {
        _id = "Provisioner",
        _displayName = "Provisioner",
        _description = "Can produce:  <sprite name=[crafting] flour> Flour (<sprite name=grade2>), <sprite name=[vessel] barrels> Barrels (<sprite name=grade2>), <sprite name=[packs] pack of provisions> Pack of Provisions (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8},
            {id = "[Mat Processed] Fabric", amount = 4}
        },
        _tags = {
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Flour"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Provisioner"},
                        _grade = 2,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Flour",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 7},
                                {id = "[Food Raw] Mushrooms", amount = 7},
                                {id = "[Food Raw] Roots", amount = 7},
                                {id = "[Mat Raw] Algae", amount = 7}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Barrels"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Provisioner"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Vessel] Barrels",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Provisions"] = {
                [2] = {
                    [3] = {
                        _buildingArray = {"Provisioner"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Provisions",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 4},
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4},
                                {id = "[Food Raw] Eggs", amount = 4},
                                {id = "[Food Raw] Fish", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Rain Mill"] = {
        _id = "Rain Mill",
        _displayName = "Rain Mill",
        _description = "Can produce:  <sprite name=[crafting] flour> Flour (<sprite name=grade3>), <sprite name=[needs] scrolls> Scrolls (<sprite name=grade1>), <sprite name=[food processed] paste> Paste (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Tech",
            "Farming",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Flour"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Rain Mill"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Flour",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Mushrooms", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Mat Raw] Algae", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Needs] Scrolls"] = {
                [1] = {
                    [8] = {
                        _buildingArray = {"Rain Mill"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Needs] Scrolls",
                            amount = 8
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 4},
                                {id = "[Mat Raw] Plant Fibre", amount = 4},
                                {id = "[Mat Raw] Wood", amount = 10}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 3},
                                {id = "[Needs] Wine", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Paste"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Rain Mill"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Paste",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Crafting] Salt", amount = 3}
                            },
                            {
                                {id = "[Food Raw] Eggs", amount = 6},
                                {id = "[Food Raw] Fish", amount = 6},
                                {id = "[Food Raw] Meat", amount = 6}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Rainpunk Foundry"] = {
        _id = "Rainpunk Foundry",
        _displayName = "Rainpunk Foundry",
        _description = "A very advanced piece of technology. Can produce  <sprite name=[mat processed] parts> Parts (<sprite name=grade3>), <sprite name=hearth parts> Wildfire Essence (<sprite name=grade3>).\nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 25,
        _cityScore = 10,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8},
            {id = "[Mat Processed] Bricks", amount = 2},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Metallurgy",
            "Tech",
            "Rainwater",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Parts"] = {
                [3] = {
                    [1] = {
                        _buildingArray = {"Rainpunk Foundry"},
                        _grade = 3,
                        _time = 90.0,
                        _productPair = {
                            id = "[Mat Processed] Parts",
                            amount = 1
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            },
                            {
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1},
                                {id = "[Crafting] Oil", amount = 1},
                                {id = "[Mat Raw] Wood", amount = 5}
                            }
                        }
                    },
                },
            },
            ["Hearth Parts"] = {
                [3] = {
                    [1] = {
                        _buildingArray = {"Rainpunk Foundry"},
                        _grade = 3,
                        _time = 90.0,
                        _productPair = {
                            id = "Hearth Parts",
                            amount = 1
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Coal", amount = 5},
                                {id = "[Crafting] Sea Marrow", amount = 5},
                                {id = "[Crafting] Oil", amount = 5},
                                {id = "[Mat Raw] Wood", amount = 15}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 1},
                                {id = "[Vessel] Waterskin", amount = 1},
                                {id = "[Vessel] Barrels", amount = 1}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 10},
                                {id = "[Water] Clearance Water", amount = 10},
                                {id = "[Water] Storm Water", amount = 10}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Ranch"] = {
        _id = "Ranch",
        _displayName = "Ranch",
        _description = "Can produce:  <sprite name=[food raw] meat> Meat (<sprite name=grade1>), <sprite name=[mat raw] leather> Leather (<sprite name=grade1>), <sprite name=[food raw] eggs> Eggs (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5}
        },
        _tags = {
            "Animals",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Raw] Meat"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Ranch"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Food Raw] Meat",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Plant Fibre", amount = 8},
                                {id = "[Mat Raw] Reeds", amount = 8},
                                {id = "[Mat Raw] Algae", amount = 8},
                                {id = "[Food Raw] Grain", amount = 8},
                                {id = "[Food Raw] Vegetables", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Mat Raw] Leather"] = {
                [1] = {
                    [4] = {
                        _buildingArray = {"Ranch"},
                        _grade = 1,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Raw] Leather",
                            amount = 4
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Algae", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2},
                                {id = "[Food Raw] Grain", amount = 2},
                                {id = "[Food Raw] Vegetables", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Food Raw] Eggs"] = {
                [1] = {
                    [5] = {
                        _buildingArray = {"Ranch"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Food Raw] Eggs",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 3},
                                {id = "[Food Raw] Insects", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2},
                                {id = "[Food Raw] Berries", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Scribe"] = {
        _id = "Scribe",
        _displayName = "Scribe",
        _description = "Can produce:  <sprite name=[needs] scrolls> Scrolls (<sprite name=grade3>), <sprite name=[packs] pack of trade goods> Pack of Trade Goods (<sprite name=grade2>), <sprite name=[needs] ale> Ale (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Needs] Scrolls"] = {
                [3] = {
                    [8] = {
                        _buildingArray = {"Scribe"},
                        _grade = 3,
                        _time = 63.0,
                        _productPair = {
                            id = "[Needs] Scrolls",
                            amount = 8
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 2},
                                {id = "[Mat Raw] Plant Fibre", amount = 2},
                                {id = "[Mat Raw] Wood", amount = 6}
                            },
                            {
                                {id = "[Crafting] Dye", amount = 1},
                                {id = "[Needs] Wine", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Trade Goods"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Scribe"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Trade Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 6},
                                {id = "[Crafting] Oil", amount = 6},
                                {id = "[Crafting] Flour", amount = 4},
                                {id = "[Vessel] Pottery", amount = 4},
                                {id = "[Vessel] Barrels", amount = 4},
                                {id = "[Vessel] Waterskin", amount = 4}
                            }
                        }
                    },
                },
            },
            ["[Needs] Ale"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Scribe"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Ale",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 6},
                                {id = "[Food Raw] Roots", amount = 6}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Smelter"] = {
        _id = "Smelter",
        _displayName = "Smelter",
        _description = "Can produce:  <sprite name=[metal] copper bar> Copper Bars (<sprite name=grade3>), <sprite name=[needs] training gear> Training Gear (<sprite name=grade2>), <sprite name=[food processed] pie> Pie (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Bricks", amount = 4}
        },
        _tags = {
            "Metallurgy",
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Metal] Copper Bar"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Smelter"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Metal] Copper Bar",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Ore", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Needs] Training Gear"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Smelter"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Training Gear",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Stone", amount = 5},
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Leather", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Food Processed] Pie"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Smelter"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Food Processed] Pie",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Flour", amount = 6}
                            },
                            {
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Meat", amount = 5},
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Food Raw] Berries", amount = 5},
                                {id = "[Food Raw] Fish", amount = 5}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Smithy"] = {
        _id = "Smithy",
        _displayName = "Smithy",
        _description = "Can produce:  <sprite name=[tools] simple tools> Tools (<sprite name=grade2>), <sprite name=[mat processed] pipe> Pipes (<sprite name=grade2>), <sprite name=[packs] pack of trade goods> Pack of Trade Goods (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Tech",
            "Metallurgy",
            "Warmth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Tools] Simple Tools"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Smithy"},
                        _grade = 2,
                        _time = 75.0,
                        _productPair = {
                            id = "[Tools] Simple Tools",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 8},
                                {id = "[Mat Processed] Planks", amount = 2}
                            },
                            {
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Pipe"] = {
                [2] = {
                    [3] = {
                        _buildingArray = {"Smithy"},
                        _grade = 2,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Processed] Pipe",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Packs] Pack of Trade Goods"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Smithy"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Packs] Pack of Trade Goods",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Crafting] Dye", amount = 6},
                                {id = "[Crafting] Oil", amount = 6},
                                {id = "[Crafting] Flour", amount = 4},
                                {id = "[Vessel] Pottery", amount = 4},
                                {id = "[Vessel] Barrels", amount = 4},
                                {id = "[Vessel] Waterskin", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Smokehouse"] = {
        _id = "Smokehouse",
        _displayName = "Smokehouse",
        _description = "Can produce:  <sprite name=[food processed] jerky> Jerky (<sprite name=grade3>), <sprite name=[vessel] pottery> Pottery (<sprite name=grade1>), <sprite name=[needs] incense> Incense (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Food Production",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Warmth",
            "Animals",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Food Processed] Jerky"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Smokehouse"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Food Processed] Jerky",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Salt", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Pottery"] = {
                [1] = {
                    [5] = {
                        _buildingArray = {"Smokehouse"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Pottery",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 4}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
            ["[Needs] Incense"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Smokehouse"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Incense",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 6},
                                {id = "[Food Raw] Roots", amount = 6},
                                {id = "[Food Raw] Insects", amount = 6},
                                {id = "[Mat Raw] Scales", amount = 6},
                                {id = "[Crafting] Salt", amount = 6},
                                {id = "[Mat Raw] Resin", amount = 8}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 6},
                                {id = "[Crafting] Oil", amount = 3},
                                {id = "[Crafting] Coal", amount = 2},
                                {id = "[Crafting] Sea Marrow", amount = 2}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Stamping Mill"] = {
        _id = "Stamping Mill",
        _displayName = "Stamping Mill",
        _description = "Can produce:  <sprite name=[mat processed] bricks> Bricks (<sprite name=grade2>), <sprite name=[crafting] flour> Flour (<sprite name=grade2>), <sprite name=[metal] copper bar> Copper Bars (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 2,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Metallurgy",
            "Tech",
            "Stone",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Mat Processed] Bricks"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Stamping Mill"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Bricks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 3},
                                {id = "[Mat Raw] Stone", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Crafting] Flour"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Stamping Mill"},
                        _grade = 2,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Flour",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 7},
                                {id = "[Food Raw] Mushrooms", amount = 7},
                                {id = "[Food Raw] Roots", amount = 7},
                                {id = "[Mat Raw] Algae", amount = 7}
                            }
                        }
                    },
                },
            },
            ["[Metal] Copper Bar"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Stamping Mill"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Metal] Copper Bar",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Ore", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Supplier"] = {
        _id = "Supplier",
        _displayName = "Supplier",
        _description = "Can produce:  <sprite name=[crafting] flour> Flour (<sprite name=grade2>), <sprite name=[mat processed] planks> Planks (<sprite name=grade2>), <sprite name=[vessel] waterskin> Waterskins (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Cloth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Crafting] Flour"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Supplier"},
                        _grade = 2,
                        _time = 63.0,
                        _productPair = {
                            id = "[Crafting] Flour",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 7},
                                {id = "[Food Raw] Mushrooms", amount = 7},
                                {id = "[Food Raw] Roots", amount = 7},
                                {id = "[Mat Raw] Algae", amount = 7}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Planks"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Supplier"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Planks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Waterskin"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Supplier"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Waterskin",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5}
                            },
                            {
                                {id = "[Crafting] Oil", amount = 3},
                                {id = "[Food Raw] Meat", amount = 3},
                                {id = "[Crafting] Salt", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Tea House"] = {
        _id = "Tea House",
        _displayName = "Teahouse",
        _description = "Can produce:  <sprite name=[needs] tea> Tea (<sprite name=grade3>), <sprite name=[needs] incense> Incense (<sprite name=grade2>), <sprite name=[vessel] waterskin> Waterskins (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Alchemy",
            "Rainwater",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Needs] Tea"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Tea House"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Needs] Tea",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 2},
                                {id = "[Crafting] Dye", amount = 2},
                                {id = "[Mat Raw] Resin", amount = 2},
                                {id = "[Food Raw] Mushrooms", amount = 2},
                                {id = "[Food Raw] Roots", amount = 2}
                            },
                            {
                                {id = "[Water] Drizzle Water", amount = 2},
                                {id = "[Water] Clearance Water", amount = 3},
                                {id = "[Water] Storm Water", amount = 4}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 2},
                                {id = "[Vessel] Barrels", amount = 1},
                                {id = "[Vessel] Waterskin", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Incense"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Tea House"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Incense",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Herbs", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5},
                                {id = "[Food Raw] Insects", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5},
                                {id = "[Crafting] Salt", amount = 5},
                                {id = "[Mat Raw] Resin", amount = 7}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 6},
                                {id = "[Crafting] Oil", amount = 3},
                                {id = "[Crafting] Coal", amount = 2},
                                {id = "[Crafting] Sea Marrow", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Waterskin"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Tea House"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Waterskin",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 6},
                                {id = "[Mat Raw] Scales", amount = 6}
                            },
                            {
                                {id = "[Crafting] Oil", amount = 4},
                                {id = "[Food Raw] Meat", amount = 4},
                                {id = "[Crafting] Salt", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Tinctury"] = {
        _id = "Tinctury",
        _displayName = "Tinctury",
        _description = "Can produce:  <sprite name=[crafting] dye> Dye (<sprite name=grade3>), <sprite name=[needs] ale> Ale (<sprite name=grade2>), <sprite name=[needs] wine> Wine (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] drizzle water\"> Drizzle Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Brewing",
            "Alchemy",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Drizzle Water",
        _recipes = {
            ["[Crafting] Dye"] = {
                [3] = {
                    [10] = {
                        _buildingArray = {"Tinctury"},
                        _grade = 3,
                        _time = 105.0,
                        _productPair = {
                            id = "[Crafting] Dye",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Insects", amount = 3},
                                {id = "[Food Raw] Berries", amount = 3},
                                {id = "[Metal] Copper Ore", amount = 3},
                                {id = "[Mat Raw] Scales", amount = 3},
                                {id = "[Crafting] Coal", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Ale"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Tinctury"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Ale",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Grain", amount = 5},
                                {id = "[Food Raw] Roots", amount = 5}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 2},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Wine"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Tinctury"},
                        _grade = 1,
                        _time = 84.0,
                        _productPair = {
                            id = "[Needs] Wine",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Food Raw] Berries", amount = 4},
                                {id = "[Food Raw] Mushrooms", amount = 4},
                                {id = "[Mat Raw] Reeds", amount = 4}
                            },
                            {
                                {id = "[Vessel] Pottery", amount = 3},
                                {id = "[Vessel] Barrels", amount = 3},
                                {id = "[Vessel] Waterskin", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Tinkerer"] = {
        _id = "Tinkerer",
        _displayName = "Tinkerer",
        _description = "Can produce:  <sprite name=[tools] simple tools> Tools (<sprite name=grade2>), <sprite name=[needs] training gear> Training Gear (<sprite name=grade2>), <sprite name=[vessel] pottery> Pottery (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 50,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 3,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Bricks", amount = 2}
        },
        _tags = {
            "Metallurgy",
            "Tech",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Tools] Simple Tools"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Tinkerer"},
                        _grade = 2,
                        _time = 75.0,
                        _productPair = {
                            id = "[Tools] Simple Tools",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 8},
                                {id = "[Mat Processed] Planks", amount = 2}
                            },
                            {
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Needs] Training Gear"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Tinkerer"},
                        _grade = 2,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Training Gear",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Stone", amount = 5},
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Leather", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Vessel] Pottery"] = {
                [2] = {
                    [5] = {
                        _buildingArray = {"Tinkerer"},
                        _grade = 2,
                        _time = 84.0,
                        _productPair = {
                            id = "[Vessel] Pottery",
                            amount = 5
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 3}
                            },
                            {
                                {id = "[Mat Raw] Wood", amount = 5},
                                {id = "[Crafting] Oil", amount = 2},
                                {id = "[Crafting] Coal", amount = 1},
                                {id = "[Crafting] Sea Marrow", amount = 1}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Toolshop"] = {
        _id = "Toolshop",
        _displayName = "Toolshop",
        _description = "Can produce:  <sprite name=[tools] simple tools> Tools (<sprite name=grade3>), <sprite name=[mat processed] pipe> Pipes (<sprite name=grade2>), <sprite name=[needs] boots> Boots (<sprite name=grade2>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 5},
            {id = "[Mat Processed] Fabric", amount = 2}
        },
        _tags = {
            "Tech",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Tools] Simple Tools"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Toolshop"},
                        _grade = 3,
                        _time = 60.0,
                        _productPair = {
                            id = "[Tools] Simple Tools",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 6},
                                {id = "[Mat Processed] Planks", amount = 1}
                            },
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Pipe"] = {
                [2] = {
                    [3] = {
                        _buildingArray = {"Toolshop"},
                        _grade = 2,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Processed] Pipe",
                            amount = 3
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 2},
                                {id = "[Metal] Crystalized Dew", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Boots"] = {
                [2] = {
                    [10] = {
                        _buildingArray = {"Toolshop"},
                        _grade = 2,
                        _time = 168.0,
                        _productPair = {
                            id = "[Needs] Boots",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 4},
                                {id = "[Mat Raw] Scales", amount = 4}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Weaver"] = {
        _id = "Weaver",
        _displayName = "Weaver",
        _description = "Can produce:  <sprite name=[mat processed] fabric> Fabric (<sprite name=grade3>), <sprite name=[needs] boots> Boots (<sprite name=grade1>), <sprite name=[needs] training gear> Training Gear (<sprite name=grade1>). \nRain engine: <sprite name=\"[water] clearance water\"> Clearance Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 2,
        _constructionTime = 40,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 8}
        },
        _tags = {
            "Cloth",
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Clearance Water",
        _recipes = {
            ["[Mat Processed] Fabric"] = {
                [3] = {
                    [2] = {
                        _buildingArray = {"Weaver"},
                        _grade = 3,
                        _time = 28.0,
                        _productPair = {
                            id = "[Mat Processed] Fabric",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Plant Fibre", amount = 2},
                                {id = "[Mat Raw] Reeds", amount = 2},
                                {id = "[Mat Raw] Algae", amount = 2}
                            }
                        }
                    },
                },
            },
            ["[Needs] Boots"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Weaver"},
                        _grade = 1,
                        _time = 168.0,
                        _productPair = {
                            id = "[Needs] Boots",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Leather", amount = 5},
                                {id = "[Mat Raw] Scales", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Needs] Training Gear"] = {
                [1] = {
                    [10] = {
                        _buildingArray = {"Weaver"},
                        _grade = 1,
                        _time = 126.0,
                        _productPair = {
                            id = "[Needs] Training Gear",
                            amount = 10
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Stone", amount = 8},
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            },
                            {
                                {id = "[Mat Processed] Planks", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Leather", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
    ["Workshop"] = {
        _id = "Workshop",
        _displayName = "Workshop",
        _description = "Can produce:  <sprite name=[mat processed] planks> Planks (<sprite name=grade2>), <sprite name=[mat processed] fabric> Fabric (<sprite name=grade2>), <sprite name=[mat processed] bricks> Bricks (<sprite name=grade2>), <sprite name=[mat processed] pipe> Pipes (<sprite name=grade0>). \nRain engine: <sprite name=\"[water] storm water\"> Storm Water.",
        _category = "Industry",
        _categoryDisplay = "Production Building",
        _sizeX = 3,
        _sizeY = 3,
        _constructionTime = 20,
        _cityScore = 5,
        _movable = false,
        _initiallyEssential = false,
        _workplaces = 2,
        _requiredGoods = {
            {id = "[Mat Processed] Planks", amount = 4},
            {id = "[Mat Processed] Bricks", amount = 4},
            {id = "[Mat Processed] Fabric", amount = 4}
        },
        _tags = {
            "FoxesCooperation"
        },
        _storage = 8,
        _waterUsed = "[Water] Storm Water",
        _recipes = {
            ["[Mat Processed] Planks"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Workshop"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Planks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Wood", amount = 5}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Fabric"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Workshop"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Fabric",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Plant Fibre", amount = 3},
                                {id = "[Mat Raw] Reeds", amount = 3},
                                {id = "[Mat Raw] Algae", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Bricks"] = {
                [2] = {
                    [2] = {
                        _buildingArray = {"Workshop"},
                        _grade = 2,
                        _time = 42.0,
                        _productPair = {
                            id = "[Mat Processed] Bricks",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Mat Raw] Clay", amount = 3},
                                {id = "[Mat Raw] Stone", amount = 3}
                            }
                        }
                    },
                },
            },
            ["[Mat Processed] Pipe"] = {
                [0] = {
                    [2] = {
                        _buildingArray = {"Workshop"},
                        _grade = 0,
                        _time = 60.0,
                        _productPair = {
                            id = "[Mat Processed] Pipe",
                            amount = 2
                        },
                        _isService = false,
                        _extraProductChances = {
                        },
                        _ingredientsArray = {
                            {
                                {id = "[Metal] Copper Bar", amount = 3},
                                {id = "[Metal] Crystalized Dew", amount = 3}
                            }
                        }
                    },
                },
            },
        },
    },
}