-- Double Ore patch amounts
/c surface = game.player.surface
local patches = {"iron-ore-patch", "copper-ore-patch", "coal-patch", "stone-patch", "uranium-ore-patch"}
for _, ore in pairs(surface.find_entities_filtered({type="resource"})) do
    for _,patchname in pairs(patches) do
        if ore.name == patchname then ore.amount = ore.amount * 2 end
    end
end

-- Disable secondary set of combined module recipes
/c local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
    for i = 2,8 do
        game.forces.player.recipes[moduletype..i].enabled = false
    end
end