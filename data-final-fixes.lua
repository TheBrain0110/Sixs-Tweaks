if mods["Krastorio2"] then
    require("prototypes.entity.atomic-artillery")
end

if mods["Krastorio2"] and mods["space-exploration"] then
    require("prototypes.recipe.spacex-late")
    require("prototypes.entity.spacex-late")
end
