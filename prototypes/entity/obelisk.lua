local obelisk_turret = {
    type = "electric-turret",
    name = "obelisk-turret",
    localised_name="Obelisk of Light",
	localised_description="A high-powered laser turret with massive damage, long range, but high energy requirements and slow rate of fire",
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
      damage_modifier = 120,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = "80000kJ",
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = "laser",
                starting_speed = 0.35
              }
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
    localised_name="Obelisk of Light",
	localised_description="A high-powered laser turret with massive damage, long range, but high energy requirements and slow rate of fire",
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
    --  {"uranium-fuel-cell", 1},
      {type="fluid", name= "lubricant", amount = 1000}
    },
    result = "obelisk-turret"
}

local obelisk_tech = {
    type = "technology",
    name="obelisk-turrets",
	localised_name="Obelisk of Light",
	localised_description="A high-powered laser turret with massive damage, long range, but high energy requirements and slow rate of fire",
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

  data:extend({obelisk_turret, obelisk_item, obelisk_recipe, obelisk_tech})