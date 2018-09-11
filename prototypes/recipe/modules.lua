local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
    for i = 2,8 do
        -- Change Raw Ingredients recipe to require 2x level-1 combined modules, from 1x
        bobmods.lib.recipe.remove_ingredient(moduletype..i, moduletype..i-1)
        bobmods.lib.recipe.add_ingredient(moduletype..i, {moduletype..i-1, 2})

        -- Add module level-1 to ingredients for Combined recipes
        bobmods.lib.recipe.add_ingredient(moduletype..i.."-combine", {moduletype..i-1, 1})
    end
end