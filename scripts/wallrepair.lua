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

function refreshAllWalls()
    for _, surface in pairs(game.surfaces) do
        for _, unit in pairs(surface.find_entities_filtered{type = {"wall", "gate"}}) do
            if unit.get_health_ratio() < 1 then queueRepairs(unit, game.tick) end
        end
    end
end


script.on_init(function()
    if (not global.RepairQueue) then
        global.RepairQueue = {}
    end
end)

script.on_configuration_changed(refreshAllWalls)


script.on_event(
    defines.events.on_entity_damaged,
    function(event) queueRepairs(event.entity, event.tick) end,
    {{filter = "type", type = "wall"}, {filter = "type", type = "gate"}}
)

-- Add all newly built walls to repair queue, otherwise pre-damaged walls wouldn't start repairing until they took damage again
script.on_event(
    {
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity,
    },
    function(event) queueRepairs(event.created_entity, event.tick) end
)

local filters = {{filter = "type", type = "wall"}, {filter = "name", name = "se-spaceship-wall", invert = true, mode = "and"}, {filter = "type", type = "gate"}, {filter = "name", name = "se-spaceship-gate", invert = true, mode = "and"}}
script.set_event_filter(defines.events.on_built_entity, filters)
script.set_event_filter(defines.events.on_robot_built_entity, filters)
-- Anything created by script we probably don't want to mess with. Often leads to crashes with the Ruins mod feeding nil entities to the event handler.


script.on_nth_tick(5, doRepairs)
