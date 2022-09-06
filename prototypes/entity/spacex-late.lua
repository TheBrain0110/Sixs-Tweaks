-- Copied from Space Rails
local collision_floor = {
    "floor-layer",
    "water-tile",
    "rail-layer"
}

-- Used by Pylons
-- local collision_mask = {
--     --"item-layer", -- stops player from dropping items on belts.
--     "floor-layer",
--     --"object-layer",
--     "water-tile",
--     "player-layer",
-- }

-- Used by Flat solar panels by default
-- collision_mask = {
--     "floor-layer",
--     "object-layer",
--     "water-tile",
--     --"ground-tile"
-- }

data.raw["solar-panel"]["kr-advanced-solar-panel"].next_upgrade = nil
data.raw["solar-panel"]["se-space-solar-panel"].collision_mask = collision_floor
data.raw["solar-panel"]["se-space-solar-panel-2"].collision_mask = collision_floor
data.raw["solar-panel"]["se-space-solar-panel-3"].collision_mask = collision_floor

data.raw["assembling-machine"]["kr-advanced-furnace"].module_specification.module_slots = 6
data.raw["assembling-machine"]["kr-advanced-assembling-machine"].module_specification.module_slots = 6
data.raw["assembling-machine"]["kr-advanced-assembling-machine"].crafting_speed = 6

data.raw["generator-equipment"]["se-rtg-equipment-2"].power = "1600kW"
data.raw["generator-equipment"]["fusion-reactor-equipment"].power = "4800kW"
data.raw["generator-equipment"]["antimatter-reactor-equipment"].power = "9600kW"
