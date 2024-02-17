local tArgs = { ... }
if (#tArgs ~= 1) then
	print( "Usage: tunnel3 <length> " )
	return
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

local function digU()
  while turtle.detectUp()
  do
    if not turtle.digUp() then 
      printError("stuck")
      return false
    end
  end
end

local function step()
  digF()
  turtle.forward()
  digU()

  finditemToPlace()
  turtle.placeDown()
end

local length = tonumber( tArgs[1] )

for i = 1,length
do
  step()
end