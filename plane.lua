local tArgs = { ... }
if (#tArgs < 2) or (#tArgs > 3) then
	print( "Usage: plain <x> <z> [floor|ceil] " )
	return
end

local function countItems()
  s = 0
  for i=1,16
  do
    s = s + turtle.getItemCount(i)
  end
  return s
end

local function finditemToPlace()
  local currentSlot = 0
  while (turtle.getItemCount(currentSlot+1) == 0 )
  do
    currentSlot = ((currentSlot+1)%16)
  end
  turtle.select(currentSlot+1)
end

local function digF()
  while turtle.detect()
  do
    if not turtle.dig() then 
      printError("stuck")
      return false
    end
  end

end

local function step()
  finditemToPlace()
  place()
  digF()
  turtle.forward()
end

local function nextLine(line)
  if line%2 ~= 0
  then 
    turn = turtle.turnRight
  else
    turn = turtle.turnLeft
  end

  turn()
  step()
  turn()
end

local function buildHPlane(xSize, ySize)
  for i = 1,xSize
  do
    for j = 1,ySize-1
    do
      step()
    end
  
    if i ~= xSize 
    then 
      nextLine(i) 
    end
  end
end

local function returnY(ySize)
  turtle.turnRight()
  turtle.turnRight()
  for j = 1,ySize-1
  do
    step()
  end
end

local function returnX(xSize)
  turtle.turnRight()
  for i = 1,xSize-1
  do
    step()
  end
end

local function returnToStart(xSize, ySize)
  if xSize%2 ~= 0
  then
    returnY(ySize)
  end
  returnX(xSize)
end

----------------------------------
local xSize = tonumber( tArgs[1] )
local ySize = tonumber( tArgs[2] )

if tArgs[3] ==  "ceil"
then
  place = turtle.placeUp
else
  place = turtle.placeDown
end

area = xSize * ySize

print(("we will need %d items and %d fuel"):format(area,area*2))

buildHPlane(xSize, ySize)

returnToStart(xSize, ySize)

return
