if not mods["Krastorio2"] then
    data:extend({
    {
        type = "damage-type",
        name = "radioactive" -- Probably need to add a localization entry for this, but... meh.
    }
    })
end


data.raw["artillery-projectile"]["artillery-projectile"].action.action_delivery.target_effects[1].action.action_delivery.target_effects = {
    {
        type = "damage",
        damage = { amount = 1500, type = "physical" },
    },
    {
        type = "damage",
        damage = { amount = 2000, type = "explosion" },
    },
}


if mods["Krastorio2"] then
-- Krastorio's projectile effects definitions are flat, not sub-nested, and the indexes of the damage values may be subject to change.
-- TODO: use a lookup for the damage table entries specifically instead of using indexes.
data.raw["artillery-projectile"]["atomic-artillery"].action.action_delivery.target_effects[7] = {
    type = "damage",
    damage = { amount = 1500, type = "physical" }
}
data.raw["artillery-projectile"]["atomic-artillery"].action.action_delivery.target_effects[8] = {
    type = "damage",
    damage = { amount = 2000, type = "explosion" }
}
table.insert(data.raw["artillery-projectile"]["atomic-artillery"].action.action_delivery.target_effects, {
    type = "damage",
    damage = { amount = 2500, type = "radioactive" }
})

-- Krastorio's projectile effects definitions are flat, not sub-nested, and the indexes of the damage values may be subject to change.
-- TODO: use a lookup for the damage table entries specifically instead of using indexes.
data.raw["artillery-projectile"]["antimatter-artillery-projectile"].action.action_delivery.target_effects[7] = {
    type = "damage",
    damage = { amount = 1500, type = "physical" }
}
data.raw["artillery-projectile"]["antimatter-artillery-projectile"].action.action_delivery.target_effects[8] = {
    type = "damage",
    damage = { amount = 4000, type = "explosion" }
}
table.insert(data.raw["artillery-projectile"]["antimatter-artillery-projectile"].action.action_delivery.target_effects, {
    type = "damage",
    damage = { amount = 5000, type = "radioactive" }
})
end


data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects[7] = {
    type = "damage",
    damage = { amount = 2000, type = "physical" }
}
data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects[8] = {
    type = "damage",
    damage = { amount = 2500, type = "explosion" }
}
table.insert(data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects, {
    type = "damage",
    damage = { amount = 3000, type = "radioactive" }
})


if mods["Krastorio2"] then
data.raw["projectile"]["antimatter-rocket-projectile"].action.action_delivery.target_effects[7] = {
    type = "damage",
    damage = { amount = 2000, type = "physical" }
}
data.raw["projectile"]["antimatter-rocket-projectile"].action.action_delivery.target_effects[8] = {
    type = "damage",
    damage = { amount = 5000, type = "explosion" }
}
table.insert(data.raw["projectile"]["antimatter-rocket-projectile"].action.action_delivery.target_effects, {
    type = "damage",
    damage = { amount = 7000, type = "radioactive" }
})
end


data.raw["projectile"]["atomic-bomb-ground-zero-projectile"].action[1].radius = 3.5
data.raw["projectile"]["atomic-bomb-ground-zero-projectile"].action[1].action_delivery.target_effects = {
    {
        type = "damage",
        vaporize = true,
        lower_distance_threshold = 0,
        upper_distance_threshold = 35,
        lower_damage_modifier = 1,
        upper_damage_modifier = 0.01,
        damage = {amount = 200, type = "explosion"}
      },
      {
        type = "damage",
        vaporize = true,
        lower_distance_threshold = 0,
        upper_distance_threshold = 35,
        lower_damage_modifier = 1,
        upper_damage_modifier = 0.01,
        damage = {amount = 250, type = "radioactive"}
      }
}

data.raw["projectile"]["atomic-bomb-wave"].action[1].radius = 4.5
data.raw["projectile"]["atomic-bomb-wave"].action[1].action_delivery.target_effects = {
    {
        type = "damage",
        vaporize = false,
        lower_distance_threshold = 0,
        upper_distance_threshold = 35,
        lower_damage_modifier = 1,
        upper_damage_modifier = 0.1,
        damage = {amount = 200, type = "explosion"}
    },
    {
        type = "damage",
        vaporize = false,
        lower_distance_threshold = 0,
        upper_distance_threshold = 35,
        lower_damage_modifier = 1,
        upper_damage_modifier = 0.1,
        damage = {amount = 250, type = "radioactive"}
    }
}


if mods["Krastorio2"] then
data.raw["projectile"]["antimatter-bomb-wave"].action[1].radius = 5
data.raw["projectile"]["antimatter-bomb-wave"].action[1].action_delivery.target_effects = {
  {
    type = "damage",
    vaporize = false,
    lower_distance_threshold = 0,
    upper_distance_threshold = 50,
    lower_damage_modifier = 1,
    upper_damage_modifier = 0.1,
    damage = { amount = 900, type = "explosion" },
  },
  {
    type = "damage",
    vaporize = false,
    lower_distance_threshold = 0,
    upper_distance_threshold = 50,
    lower_damage_modifier = 1,
    upper_damage_modifier = 0.25,
    damage = { amount = 950, type = "radioactive" },
  }
}
end


for i = 5,10 do
    table.insert(data.raw.technology["stronger-explosives-"..i].effects,
    {
        type = "ammo-damage",
        ammo_category = "artillery-shell",
        modifier = 0.2,
    })
end


-- Make landmines immune to ALL damage. This will be bad for PvP scenarios, but I'll deal with that if it ever becomes relevant.
for _, mine in pairs(data.raw["land-mine"]) do
    mine.resistances = mine.resistances or {}
    for damageType, _ in pairs(data.raw["damage-type"]) do
        mine.resistances[damageType] = {
            type = damageType,
            percent = 100
        }
    end
end

if mods["Krastorio2"] then
    for _, wall in pairs(data.raw["wall"]) do
        table.insert(wall.resistances, {
            type = "kr-explosion",
            percent = 100
        })
    end
end
