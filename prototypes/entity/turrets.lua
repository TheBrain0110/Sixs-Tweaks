data.raw["electric-turret"]["laser-turret"].energy_source = {
  type = "electric",
  buffer_capacity = "48800kJ",
  input_flow_limit = "4808kW",
  drain = "8kW",
  usage_priority = "primary-input"
}

if not mods["Krastorio2"] then -- I think K2 v1.3 adds this itself now, and something about my version breaks now
  for i = 4,7 do
      table.insert(data.raw.technology["stronger-explosives-"..i].effects,
      {
          type = "ammo-damage",
          ammo_category = "artillery-shell",
          modifier = 0.2,
      })
  end
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
