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

data.raw.recipe["se-kr-rare-metal-substrate"].ingredients = {
    {"electronic-components", 4},
    {"rare-metals", 2}
}

data.raw["generator-equipment"]["se-rtg-equipment-2"].power = "1600kW"
data.raw["generator-equipment"]["fusion-reactor-equipment"].power = "4800kW"
data.raw["generator-equipment"]["antimatter-reactor-equipment"].power = "9600kW"

-- I'm resisting the urge to add kiln recipes back to the Industrial Furnace because that's a very specific design choice they made. K2 Advanced Furnace should totally be fair game though.
-- table.insert(data.raw["assembling-machine"]["industrial-furnace"].crafting_categories, "kiln")
table.insert(data.raw["assembling-machine"]["kr-advanced-furnace"].crafting_categories, "kiln")
data_util.replace_or_add_ingredient("kr-advanced-furnace", nil, "industrial-furnace", 1)
data.raw["assembling-machine"]["kr-advanced-furnace"].module_specification.module_slots = 6