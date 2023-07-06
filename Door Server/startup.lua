rednet.open("back")

os.loadAPI("touchpoint")

term.clear()

local trading_door_state = false
local iron_door_state = false

local trading_door_panel_1 = touchpoint.new("monitor_17")
trading_door_panel_1:add("Door 1", function ()
                toggleTradingDoor()
end, 1, 1, 7, 5, colors.lime, colors.red)

local trading_door_panel_2 = touchpoint.new("monitor_18")
trading_door_panel_2:add("Door 1", function ()
                toggleTradingDoor()
        end, 1, 1, 7, 5, colors.lime, colors.red)


local iron_door_panel_1 = touchpoint.new("monitor_19")
iron_door_panel_1:add("Door 1", function ()
                toggleIronDoor()
end, 1, 1, 7, 5, colors.lime, colors.red)

local iron_door_panel_2 = touchpoint.new("monitor_20")
iron_door_panel_2:add("Door 1", function ()
                toggleIronDoor()
end, 1, 1, 7, 5, colors.lime, colors.red)
        
function toggleTradingDoor()
        trading_door_state = not trading_door_state
        rednet.send(19, trading_door_state)
        trading_door_panel_1:toggleButton("Door 1")
        trading_door_panel_2:toggleButton("Door 1")    
        renderUi()
end

function toggleIronDoor()
        iron_door_state = not iron_door_state
        rednet.send(23, iron_door_state)
        iron_door_panel_1:toggleButton("Door 1")
        iron_door_panel_2:toggleButton("Door 1")    
        renderUi()
end

function renderUi()
        term.clear()
        term.setCursorPos(1,1)
        print("Door 1: ",  trading_door_state)
        print("Door 2: ",  iron_door_state)    
end

parallel.waitForAll(
    function()
        trading_door_panel_1:run()
    end,
    function()
        trading_door_panel_2:run()
    end,
    function()
        iron_door_panel_1:run()
    end,
    function()
        iron_door_panel_2:run()
    end,
    function ()
        renderUi()
    end
)

