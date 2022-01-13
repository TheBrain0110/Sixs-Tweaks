local data_util = require("data_util")

data.raw["ammo-turret"]["kr-railgun-turret"].attack_parameters.range = 70
data.raw["ammo-turret"]["kr-railgun-turret"].attack_parameters.prepare_range = 75

data_util.replace_or_add_ingredient("heavy-rocket", "rocket-fuel", "rocket-fuel", 2)
data_util.replace_or_add_ingredient("explosive-turret-rocket", "rocket-fuel", "rocket-fuel", 2)
