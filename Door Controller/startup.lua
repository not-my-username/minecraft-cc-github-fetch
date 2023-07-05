rednet.open("back")

while true do
    local senderID, message, protocol = rednet.receive()
    print(message)
    redstone.setOutput("left", message)
  end
  