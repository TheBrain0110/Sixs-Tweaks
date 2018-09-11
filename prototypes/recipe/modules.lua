local moduletypes = {"raw-speed-module-", "green-module-", "raw-productivity-module-"}

for _, moduletype in pairs(moduletypes) do
    for i = 2,8 do
        table.insert(data.raw.recipe[moduletype..i].ingredients, {moduletype..i-1, 1})
        table.insert(data.raw.recipe[moduletype..i.."-combine"].ingredients, {moduletype..i-1, 1})
    end
end