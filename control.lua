function queueRepairs(entity, tick)
    --log("Damaged " .. entity.name)
    global.RepairQueue[entity.unit_number] = {entity = entity, tick = tick}
end

function doRepairs()
    --log(serpent.block(global.RepairQueue))
    for k, v in pairs(global.RepairQueue) do
        local unit = v.entity
        local t = v.tick
        -- wait for 5 seconds
        if (game.tick - t > 60 * 5) then
            --this unit hasn't been damaged in the last 5 seconds, begin repair
            if (unit.valid) and (unit.get_health_ratio() < 1) then
                -- unit.health = unit.health + (unit.prototype.max_health / 60)
                --log("Healing ID " .. k)
                unit.health = unit.health + 1
            else
                --log("Removing ID " .. k)
                global.RepairQueue[k] = nil
            end
        end
    end
end

script.on_init(function()
    if (not global.RepairQueue) then
        global.RepairQueue = {}
    end
end)


script.on_event(
    defines.events.on_entity_damaged,
    function(event) queueRepairs(event.entity, event.tick) end,
    {{filter = "type", type = "wall"}, {filter = "type", type = "gate"}}
)

script.on_nth_tick(5, doRepairs)
