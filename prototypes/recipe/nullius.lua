data:extend({
  {
    type = "recipe",
    name = "nullius-brick-recycling",
    localised_name = "Brick Recycling",
    icons = {
        {
        icon = "__base__/graphics/icons/stone-brick.png",
        icon_size = 64,
        icon_mipmaps = 4
        },
        {
        icon = "__nullius__/graphics/icons/sand.png",
        icon_size = 64,
        scale = 0.3,
        shift = {7, 7}
        }
    },
    order = "nullius-bb",
    enabled = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    category = "ore-crushing",
    subgroup = "concrete",
    energy_required = 2,
    ingredients = {
        {type="item", name="stone-brick", amount=10}
    },
    results = {
        {type="item", name="nullius-sand", amount_min = 3, amount_max = 6},
        {type="item", name="nullius-gravel", amount_min = 1, amount_max = 3}
    }
  }
})

table.insert(data.raw.technology["nullius-concrete-1"].effects,
  {type = "unlock-recipe", recipe = "nullius-brick-recycling"})

data.raw.recipe["nullius-barrel-recycling"].category = "machine-casting"
data.raw.recipe["nullius-barrel-recycling"].hide_from_player_crafting = true
