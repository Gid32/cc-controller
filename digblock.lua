local tArgs = { ... }
if (#tArgs ~= 3) then
	print( "Usage: digblock <x> <y> <z>" )
	return
end

function sign(x)
  return x>0 and 1 or x<0 and -1 or 0
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



-- ============================== --

layers = ySize // 3
lastLayer = ySize % 3

vector

digLastlayer(lastLayer,xSize,zSize)
for i = 1,layers
do
  digLayer(xSize,zSize)
end
