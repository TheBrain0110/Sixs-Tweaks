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
