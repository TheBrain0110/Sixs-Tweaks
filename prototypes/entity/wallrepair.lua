for _, wall in pairs(data.raw["wall"]) do
    table.insert(wall.flags, "not-repairable")
    -- wall.healing_per_tick = wall.max_health / 3600 -- This doesn't work because walls aren't "active" entities
end

for _, wall in pairs(data.raw["gate"]) do
    table.insert(wall.flags, "not-repairable")
    -- wall.healing_per_tick = wall.max_health / 3600 -- This doesn't work because walls aren't "active" entities
end

for _, bot in pairs(data.raw["construction-robot"]) do
    bot.resistances = { { type = "fire", decrease = 100, percent = 99 } }
    table.insert(bot.flags, "not-repairable")
end

for _, bot in pairs(data.raw["logistic-robot"]) do
    bot.resistances = { { type = "fire", decrease = 100, percent = 99 } }
    table.insert(bot.flags, "not-repairable")
end
