local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
    for i = 1,8 do
        -- There's 2 recipes for each merged module by default
        -- One made with raw components, and one that just takes completed modules
        -- I want to remove the raw components recipe, and rework the combining one.
        bobmods.lib.item.remove(data.raw.recipe, moduletype..i) -- May need to just disable, tech unlock might complain if recipe doesn't exist
        
        local recipe = moduletype..i.."-combine"
        table.insert(data.raw.recipe[recipe].ingredients, {"alien-artifact", 1})
    end
end