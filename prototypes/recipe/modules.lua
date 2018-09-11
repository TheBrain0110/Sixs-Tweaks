local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
    -- data.raw.recipe[moduletype..1] = nil
    data.raw.recipe[moduletype..1].hidden = true
    for i = 2,8 do
        -- remove raw-components recipe
        -- data.raw.recipe[moduletype..i] = nil -- Successfully removes recipe, but bob's complains about it missing. Maybe if this was moved to data-final-fixes...
        data.raw.recipe[moduletype..i].hidden = true -- hidden is almost as good as disabled for my purposes...

        -- Add module level-1 to ingredients for Combined recipes
        bobmods.lib.recipe.add_ingredient(moduletype..i.."-combine", {moduletype..i-1, 1})
    end
end