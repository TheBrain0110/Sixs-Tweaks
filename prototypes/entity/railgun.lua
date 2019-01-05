-- probably will use assets from obelisk.lua, ensure this loads after

local railgun_tech = {
  type = "technology",
  name = "railgun-tech",
  localised_name = "Handheld Railgun",
  localised_description = "Further research into high-energy particle accelerators and long-range ballistics has led to the development of a portable railgun, capable of inflicting devastating damage to everything in its path.",
  icon = "__base__/graphics/technology/cannon-speed.png",
  icon_size = 128,
  effects = {
    {type = "unlock-recipe", recipe = "railgun"},
    {type = "unlock-recipe", recipe = "railgun-dart"}
  },
  prerequisites = {"obelisk-turrets", "uranium-ammo", "artillery"},
  unit = {
    count = 600,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
      {"military-science-pack", 3},
      {"science-pack-3", 1},
      {"high-tech-science-pack", 1}
    },
    time = 60
  },
  order = "a-e-b"
}

local electric_blast_wave = {
  type = "explosion",
  name = "electric-blast-wave",
  flags = {"not-on-map"},
  animations = {
    {
      scale = 1,
      axially_symmetrical = false,
      direction_count = 1,
      filename = "__Sixs-Tweaks__/graphics/electroshock-pulse-explosion.png", -- Borrowed from MSI
      animation_speed = 1,
      frame_count = 7 * 5,
      line_length = 5,
      width = 1675 / 5,
      height = 2044 / 7,
      priority = "extra-high"
    }
  },
  light = {
    intensity = 1,
    size = 25,
    color = {a = 1, b = 1, g = 0.3, r = 0.1}
  }
}

data:extend({railgun_tech, electric_blast_wave})

local railgun_ingredients = {
  {"rocket-launcher", 1},
  {"processing-unit", 20},
  {"effectivity-module-3", 3},
  {"speed-module-3", 3},
  {"productivity-module-3", 3},
  {"uranium-fuel-cell", 2}
}

local railgun_round_ingredients = {
  {"uranium-cannon-shell", 1},
  {"processing-unit", 2},
  {"battery", 5}
}

local railgun_shot = {
  category = "railgun",
  target_type = "direction",
  clamp_position = true,
  action = {
    type = "line",
    range = 32,
    width = 2.25,
    source_effects = {
      {
        type = "create-explosion",
        entity_name = "railgun-beam"
      },
      {
        type = "create-explosion",
        entity_name = "electric-blast-wave"
      },
      {
        type = "create-entity",
        entity_name = "small-scorchmark",
        check_buildability = true
      },
      {
        type = "nested-result",
        affects_target = false,
        action = {
          type = "area",
          radius = 7,
          force = "enemy",
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "create-sticker",
                sticker = "obelisk-shock-sticker"
              },
              {
                type = "push-back", -- Appears to be non-functional. Oh well.
                distance = 7
              }
            }
          }
        }
      }
    },
    action_delivery = {
      type = "instant",
      target_effects = {
        {
          type = "damage",
          damage = {amount = 600, type = "physical"}
        },
        {
          type = "damage",
          damage = {amount = 200, type = "laser"}
        },
        {
          type = "create-sticker",
          sticker = "obelisk-shock-sticker"
        }
      }
    }
  }
}

data.raw["gun"]["railgun"].flags = {"goes-to-main-inventory"} -- Remove "hidden" flag
data.raw["gun"]["railgun"].attack_parameters.range = 30

data.raw["ammo"]["railgun-dart"].flags = {"goes-to-main-inventory"}
data.raw["ammo"]["railgun-dart"].magazine_size = null
data.raw["ammo"]["railgun-dart"].ammo_type = railgun_shot

data.raw["recipe"]["railgun"].energy_required = 120
data.raw["recipe"]["railgun"].ingredients = railgun_ingredients
data.raw["recipe"]["railgun-dart"].energy_required = 30
data.raw["recipe"]["railgun-dart"].ingredients = railgun_round_ingredients
