/c surface = game.player.surface
local patches = {"iron-ore-patch", "copper-ore-patch", "coal-patch", "stone-patch", "uranium-ore-patch"}
for _, ore in pairs(surface.find_entities_filtered({type="resource"})) do
    for _,patchname in pairs(patches) do
        if ore.name == patchname then ore.amount = ore.amount * 2 end
    end
end