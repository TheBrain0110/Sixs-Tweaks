-- shamelessly copied from "Laser Beam Turrets" mod
local color = {r = 0.3, g = 0.2, b = 1.0}
local long_desc = "A high-powered laser turret with long range & massive damage, but high energy requirements and slow rate of fire"

local obelisk_shock_sticker = {
  type = "sticker",
  name = "obelisk-shock-sticker",
    animation = {
      scale = 1,
      filename = "__Sixs-Tweaks__/graphics/obelisk-shock-sticker.png",
      animation_speed = 3.14,
      frame_count = 16*6,
      line_length = 16,
      width = 800/16,
      height = 240/6,
     -- priority = "extra-high",
    },
    duration_in_ticks = 60*10, --75
    --flags ={"not-on-map"},
    target_movement_modifier = 0.25,
    damage_per_tick = { amount = 2, type = "electric" }
}

local obelisk_scatter_laser = {
    type = "projectile",
    name = "obelisk-scatter-laser",
    flags = {"not-on-map"},
    acceleration = 0.03,
    action = {
      { -- Types/TriggerItem
        type = "direct",
        force = "enemy",
        action_delivery =
        { -- Types/TriggerDelivery
          type = "instant",
          target_effects =
          { 
            { -- Types/TriggerEffect
              type = "create-entity",
              entity_name = "laser-bubble"
            },
            { -- Types/TriggerEffect
              type = "damage",
              damage = { amount = 50, type = "laser"}
            }
          }
        }
      },
      { -- Types/TriggerItem
        type = "area",
        radius = 1.5,
        force = "enemy",
        action_delivery =
        { -- Types/TriggerDelivery
          type = "instant",
          target_effects = {
            { -- Types/TriggerEffect
              type = "create-sticker",
              sticker = "electroshock-pulse-sticker", -- From MSI, should add as dependency. Or duplicate myself.
            },
            { -- Types/TriggerEffect
              type = "damage",
              damage = { amount = 30, type = "electric"}
            }
          }
        }
      }
    },
    light = {intensity = 0.75, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = color,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
    speed = 0.15
}

local obelisk_beam = {
    type = "beam",
    name = "laser-beam-big-blue",
    flags = {"not-on-map"},
    width = 0.8,
    damage_interval = 60,
    light = {intensity = 0.9, size = 10},
    working_sound = {
      {
        filename = "__Laser_Beam_Turrets__/laser-beam-01.ogg",
        volume = 0.9
      },
      {
        filename = "__Laser_Beam_Turrets__/laser-beam-02.ogg",
        volume = 0.9
      },
      {
        filename = "__Laser_Beam_Turrets__/laser-beam-03.ogg",
        volume = 0.9
      }
    },
    action = {
      { -- Types/TriggerItem
        type = "direct",
        action_delivery = 
        { -- Types/TriggerDelivery
          type = "instant",
          target_effects = {
            { -- Types/TriggerEffect
              type = "damage",
              damage = {amount = 450, type = "laser"}
            }
          }
        }
      },
      { -- Types/TriggerItem
        type = "area",
        radius = 3,
        force = "enemy",
        action_delivery =
        { -- Types/TriggerDelivery
          type = "instant",
          target_effects = {
            { -- Types/TriggerEffect
              type = "create-sticker",
              sticker = "obelisk-shock-sticker", -- Copied from MSI's electroshock-pulse-sticker
            },
            { -- Types/TriggerEffect
              type = "damage",
              damage = { amount = 90, type = "electric"}
            }
          }
        }
      }
    },
    head = {
        filename = "__Laser_Beam_Turrets__/laser-beam-head-2.png",
        line_length = 16,
        tint = color,
        frame_count = 12,
        x = 45 * 4,
        width = 45,
        height = 1,
        priority = "high",
        animation_speed = 0.1,
        blend_mode = "additive-soft"
    },
    start = {
        filename = "__Laser_Beam_Turrets__/laser-beam-head-2.png",
        line_length = 16,
        tint = color,
        frame_count = 12,
        x = 45 * 4,
        width = 45,
        height = 1,
        priority = "high",
        animation_speed = 0.1,
        blend_mode = "additive-soft"
    },
    ending = {
        filename = "__Laser_Beam_Turrets__/laser-beam-head-2.png",
        line_length = 16,
        tint = color,
        frame_count = 12,
        x = 45 * 4,
        width = 45,
        height = 1,
        priority = "high",
        animation_speed = 0.5,
        blend_mode = "additive-soft"
    },
    tail = {
        filename = "__Laser_Beam_Turrets__/laser-beam-tail-3.png",
        line_length = 16,
        tint = color,
        frame_count = 12,
        x = 48 * 4,
        width = 48,
        height = 24,
        priority = "high",
        animation_speed = 0.5,
        blend_mode = "additive-soft"
    },
    body = {
        {
            filename = "__Laser_Beam_Turrets__/laser-beam-body-2.png",
            line_length = 16,
            tint = color,
            frame_count = 12,
            x = 48 * 4,
            width = 48,
            height = 24,
            priority = "high",
            animation_speed = 0.5,
            blend_mode = "additive-soft"
        }
    }
}
local obelisk_turret = {
    type = "electric-turret",
    name = "obelisk-turret",
    localised_name = "Obelisk of Light",
	  localised_description = long_desc,
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 32,
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 5, result = "obelisk-turret" },
    max_health = 2500,
    corpse = "medium-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    rotation_speed = 0.001,
    preparing_speed = 0.005,
    dying_explosion = "medium-explosion",
    folding_speed = 0.005,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "80128kJ",
      input_flow_limit = "11128kW",
      drain = "128kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          shift = {-0.03125, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          flags = { "mask" },
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.03125, -1.3125}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.5, 0}
        }
      }
    },
    folding_animation =
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0.015625, 0.03125}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 54,
          height = 46,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          frame_count = 1,
          shift = {-0.046875, -0.109375}
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = 480,
      projectile_center = {-0.09375, -0.2},
      projectile_creation_distance = 1.4,
      range = 64,
      min_range = 16,
      damage_modifier = 1,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = "80MJ",
        action = 
        { -- Types/Trigger
          { -- Types/TriggerItem
            type = "direct",
            action_delivery = 
            { -- Types/TriggerDelivery
                type = "beam",
                beam = "laser-beam-big-blue",
                max_length = 64,
                duration = 60,
                source_offset = {0, -1.3}
            }
          },
          { -- Types/TriggerItem
            type = "cluster",
            cluster_count = 8,
            distance = 3,
            distance_deviation = 2,
            action_delivery =
            { -- Types/TriggerDelivery
                type = "projectile",
                projectile = "obelisk-scatter-laser",
                duration = 20,
                direction_deviation = 0.75,
                starting_speed = 0.3,
                starting_speed_deviation = 0.2
            }
          }
        }
      },
      sound = make_laser_sounds()
    },
    call_for_help_radius = 40
}

local obelisk_item = {
    type = "item",
    name = "obelisk-turret",
    localised_name = "Obelisk of Light",
	  localised_description = long_desc,
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-b[obelisk-turret]",
    place_result = "obelisk-turret",
    stack_size = 10
}

local obelisk_recipe = {
    type = "recipe",
    name = "obelisk-turret",
    enabled = false,
    energy_required = 60,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"laser-turret", 10},
      {"processing-unit", 20},
      {"battery", 50},
      {"uranium-fuel-cell", 1},
      {type="fluid", name= "lubricant", amount = 1000}
    },
    result = "obelisk-turret"
}

local obelisk_tech = {
  type = "technology",
  name = "obelisk-turrets",
	localised_name = "Obelisk of Light",
	localised_description = long_desc,
  icon = "__base__/graphics/technology/laser-turrets.png",
	icon_size = 128,
  effects = {{type = "unlock-recipe", recipe="obelisk-turret"}},
  prerequisites = {"laser-turrets", "military-4", "nuclear-power"},
	unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"military-science-pack", 3},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
      },
      time = 30
    },
    order="a-e-b",
  }

data:extend({obelisk_shock_sticker, obelisk_scatter_laser, obelisk_beam, obelisk_turret, obelisk_item, obelisk_recipe, obelisk_tech})