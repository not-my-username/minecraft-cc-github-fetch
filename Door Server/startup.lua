rednet.open("back")

os.loadAPI("touchpoint")

local traiding_door_state = false

local traiding_door_panel_1 = touchpoint.new("monitor_17")
traiding_door_panel_1:add("Door 1", function ()
                toggleAll()
                traiding_door_state = not traiding_door_state
                rednet.send(19, traiding_door_state)
end, 1, 1, 7, 5, colors.lime, colors.red)

local traiding_door_panel_2 = touchpoint.new("monitor_18")
traiding_door_panel_2:add("Door 1", function ()
                toggleAll()
                traiding_door_state = not traiding_door_state
                rednet.send(19, traiding_door_state)
end, 1, 1, 7, 5, colors.lime, colors.red)

function toggleAll()
        traiding_door_panel_1:toggleButton("Door 1")
        traiding_door_panel_2:toggleButton("Door 1")    
end

parallel.waitForAll(
    function()
        traiding_door_panel_1:run()
    end,
    function()
        traiding_door_panel_2:run()
    end
)
