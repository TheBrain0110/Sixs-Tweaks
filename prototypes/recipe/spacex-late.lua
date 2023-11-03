local data_util = require("data_util")

data_util.replace_or_add_ingredient("rocket-fuel", "oxygen", "oxygen", 250, true)
data_util.replace_or_add_ingredient("rocket-fuel-with-ammonia", "ammonia", "ammonia", 200, true)
data_util.replace_or_add_ingredient("rocket-fuel-with-ammonia", "oxygen", "oxygen", 500, true)
data_util.replace_or_add_ingredient("rocket-fuel-with-hydrogen-chloride", "hydrogen-chloride", "hydrogen-chloride", 200, true)
data_util.replace_or_add_ingredient("rocket-fuel-with-hydrogen-chloride", "oxygen", "oxygen", 500, true)
data_util.replace_or_add_ingredient("se-vulcanite-rocket-fuel", "se-vulcanite-block", "se-vulcanite-block", 2)
data_util.replace_or_add_ingredient("se-vulcanite-rocket-fuel", "oxygen", "oxygen", 250, true)

data_util.tech_add_prerequisites("kr-efficient-fabrication", {"kr-lithium-processing"})
data_util.tech_add_prerequisites("se-kr-rare-metal-substrate", {"kr-efficient-fabrication"})

if data.raw.recipe["se-kr-rare-metal-substrate"] then -- Somebody had an error about this missing somehow.
    data.raw.recipe["se-kr-rare-metal-substrate"].ingredients = {
        {"electronic-components", 4},
        {"rare-metals", 2}
    }
end

-- I'm resisting the urge to add kiln recipes back to the Industrial Furnace because that's a very specific design choice they made. K2 Advanced Furnace should totally be fair game though.
-- table.insert(data.raw["assembling-machine"]["industrial-furnace"].crafting_categories, "kiln")
table.insert(data.raw["assembling-machine"]["kr-advanced-furnace"].crafting_categories, "kiln")
data_util.replace_or_add_ingredient("kr-advanced-furnace", nil, "industrial-furnace", 1)

-- bzmods adjust their omni core fragment amounts directly on the recipe after the fact, not via multiplier. Rebalance some of those...
if mods["bztitanium"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "titanium-ore", "titanium-ore", 3)
end
if mods["bzlead"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "lead-ore", "lead-ore", 5)
end
if mods["bztungsten"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "tungsten-ore", "tungsten-ore", 2)
end
if mods["bzzirconium"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "zircon", "zircon", 4)
end
if mods["bzcarbon"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "flake-graphite", "flake-graphite", 6)
end
if mods["bzaluminum"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "aluminum-ore", "aluminum-ore", 8)
end
if mods["bztin"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "tin-ore", "tin-ore", 7)
end
if mods["bzgas"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "gas", "gas", 12, true)
end

-- BZores replace K2 rare metals in a lot of recipes, so need a lot less of them.
if mods["Krastorio2"] and mods["bztitanium"] then
    data_util.replace_or_add_result("se-core-fragment-omni", "raw-rare-metals", "raw-rare-metals", 1)
end
