local steamtemp = 500

if mods["Krastorio2"] then
    steamtemp = 415
end

local long_desc =
    "Utilizing high temperature & pressure steam in the refinement process allows for further yield improvements of lighter oil fractions"

local high_temp_refining_recipe = {
    type = "recipe",
    name = "high-temp-oil-processing",
    localised_name = "High Temperature Oil Processing",
    localised_description = long_desc,
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "steam", amount = 100, minimum_temperature = steamtemp},
        {type = "fluid", name = "crude-oil", amount = 100}
    },
    results = {
        {type = "fluid", name = "heavy-oil", amount = 10},
        {type = "fluid", name = "light-oil", amount = 40},
        {type = "fluid", name = "petroleum-gas", amount = 100}
    },
    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-b[high-temp-oil-processing]"
}

local high_temp_refining_tech = {
    type = "technology",
    name = "high-temp-oil-processing",
    localised_name = "High Temperature Oil Processing",
    localised_description = long_desc,
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__base__/graphics/technology/oil-processing.png",
    effects = {
        {
            type = "unlock-recipe",
            recipe = "high-temp-oil-processing"
        }
    },
    prerequisites = {"advanced-oil-processing", "nuclear-power"},
    unit = {
        count = 1000,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
        },
        time = 30
    },
    order = "d-b"
}

data:extend(
    {
        high_temp_refining_recipe,
        high_temp_refining_tech
    }
)

function allow_productivity(recipe_name)
    for _, prototype in pairs(data.raw["module"]) do
        if prototype.limitation and string.find(prototype.name, "productivity", 1, true) then
            table.insert(prototype.limitation, recipe_name)
        end
    end
end

allow_productivity("high-temp-oil-processing")
