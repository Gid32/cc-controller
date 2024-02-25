local tArgs = { ... }
if (#tArgs ~= 3) then
	print( "Usage: plain <x> <z> [floor|ceil] " )
	return
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

layers = ySize // 3
lastLayer = ySize % 3