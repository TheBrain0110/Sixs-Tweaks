require("prototypes.entity.atomic-artillery")

if mods["space-exploration"] then
    require("prototypes.entity.spacex-late")
end


if mods["Krastorio2"] and mods["space-exploration"] then
    require("prototypes.recipe.spacex-late")
end
