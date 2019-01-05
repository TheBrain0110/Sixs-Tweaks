local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
  for i = 1, 8 do
    -- Remove raw ingredients recipe variants, leave only module-combining recipes
    -- Hidden is almost as good as removed for my purposes...
    data.raw.recipe[moduletype .. i].hidden = true
  end
  for i = 1, 8 do
    -- Require 2x modules for each level of combined module
    for _, ingredient in pairs(data.raw.recipe[moduletype .. i .. "-combine"].ingredients) do
      -- Sometimes recipes use named fields, sometimes they're just lists. See bobmods.lib.item.basic_item for reference.
      if ingredient.amount then
        ingredient.amount = ingredient.amount * 2
      else
        ingredient[2] = ingredient[2] * 2
      end
    end
  end
  for i = 2, 8 do
    -- Add module level-1 to ingredients for Combined recipes
    table.insert(data.raw.recipe[moduletype .. i .. "-combine"].ingredients, {moduletype .. i - 1, 1})
  end
end

for _, beacon in pairs(data.raw.beacon) do
  -- Scale beacon power usage
  beacon.energy_usage = (24 * beacon.module_specification.module_slots * beacon.supply_area_distance ^ 2) .. "kW"
end
