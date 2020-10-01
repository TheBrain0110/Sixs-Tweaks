-- Double Ore patch amounts
/c local surface = game.player.surface
local patches = {"iron-ore-patch", "copper-ore-patch", "coal-patch", "stone-patch", "uranium-ore-patch"}
for _, ore in pairs(surface.find_entities_filtered({type="resource"})) do
    for _, patchname in pairs(patches) do
        if ore.name == patchname then ore.amount = ore.amount * 2 end
    end
end

-- Increase Vanilla Ore field amounts
/c local surface = game.player.surface
local patches = {"iron-ore", "copper-ore", "coal", "stone", "uranium-ore", "crude-oil"}
for _, ore in pairs(surface.find_entities_filtered({type="resource"})) do
    for _, patchname in pairs(patches) do
        if ore.name == patchname then ore.amount = ore.amount * 3 end
    end
end

-- Disable secondary set of combined module recipes
/c local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
    for i = 2,8 do
        game.forces.player.recipes[moduletype..i].enabled = false
    end
end

-- Get Mapgen autoplace (resource) settings
/c game.player.print(serpent.block(surface.map_gen_settings.autoplace_controls))
-- or
/c game.write_file("mapgen_settings.txt", serpent.block(surface.map_gen_settings.autoplace_controls))

-- Change mapgen autoplace settings
/c local surface = game.player.surface
local patches = {"iron-ore", "copper-ore", "coal", "stone", "uranium-ore"}
local autoplace = surface.map_gen_settings.autoplace_controls
for _, resource in pairs(patches) do
  autoplace[resource].size = autoplace[resource].size + 1
  autoplace[resource].frequency = autoplace[resource].frequency * 2
  autoplace[resource].richness = 0.5
end
surface.map_gen_settings.autoplace_controls = autoplace