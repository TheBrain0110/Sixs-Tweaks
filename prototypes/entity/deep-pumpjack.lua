local long_desc = "An advanced oil pump, going deeper to extract oil more efficiently. Runs slower & uses more power, but extends the life of an oil deposit"

local deep_pumpjack = table.deepcopy(data.raw["mining-drill"]["pumpjack"])

deep_pumpjack.name = "deep-pumpjack"
deep_pumpjack.localised_name = "Deep Pumpjack"
deep_pumpjack.localised_description = long_desc
deep_pumpjack.mining_speed = 0.15
deep_pumpjack.base_productivity = 5.0
deep_pumpjack.energy_usage = "900kW"
deep_pumpjack.energy_source.emissions_per_minute = 20
deep_pumpjack.module_specification = {module_slots = 0}
deep_pumpjack.minable = {mining_time = 5, result = "deep-pumpjack"}

if mods["Krastorio2"] then
  deep_pumpjack.resource_categories = {"oil"}
end

local deep_pumpjack_item = {
  type = "item",
  name = "deep-pumpjack",
  localised_name = "Deep Pumpjack",
  localised_description = long_desc,
  icon = "__base__/graphics/icons/pumpjack.png",
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "extraction-machine",
  order = "b[fluids]-b[pumpjack]",
  place_result = "deep-pumpjack",
  stack_size = 1
}

local deep_pumpjack_recipe = {
  type = "recipe",
  name = "deep-pumpjack",
  localised_name = "Deep Pumpjack",
  localised_description = long_desc,
  enabled = false,
  energy_required = 60,
    ingredients = {
    {"pumpjack", 1},
    {"productivity-module-3", 5},
  },
  result = "deep-pumpjack"
}

local deep_pumpjack_tech = {
  type = "technology",
  name = "deep-pumpjack",
  localised_name = "Deep Pumpjacks",
  localised_description = long_desc,
  icon_size = 128,
  icon = "__base__/graphics/technology/oil-gathering.png",
  effects = {
    {
      type = "unlock-recipe",
      recipe = "deep-pumpjack"
    }
  },
  prerequisites = {"advanced-oil-processing", "productivity-module-3"},
  unit =
  {
    count = 2000,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1}
    },
    time = 30
  },
  order = "d-d"
}

data:extend(
  {
    deep_pumpjack,
    deep_pumpjack_item,
    deep_pumpjack_recipe,
    deep_pumpjack_tech
  }
)
