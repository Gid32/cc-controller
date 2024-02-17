local tArgs = { ... }
if (#tArgs ~= 2) then
	print( "Usage: reach <up|down|fwd> <distqnce> " )
	return
end

local function _dig()
  while detect()
  do
    if not dig() then 
      printError("stuck")
      return false
    end
  end
  return true
end

local function step()
  if not _dig() then return false end
  suck()
  if not fwd() then return false end
  return true
end

local function set()
  if tArgs[1] ==  "up"
  then
    detect = turtle.detectUp
    suck = turtle.suckUp
    dig = turtle.digUp
    fwd = turtle.up
    back = turtle.down
    return true
  end

  if tArgs[1] ==  "down"
  then
    detect = turtle.detectDown
    suck = turtle.suckDown
    dig = turtle.digDown
    fwd = turtle.down
    back = turtle.up
    return true
  end

  if tArgs[1] ==  "fwd"
  then
    detect = turtle.detect
    dig = turtle.dig
    suck = turtle.suck
    fwd = turtle.forward

    back = turtle.back
    return true
  end

  return false
end


local function _reach(dist)
  for s = 1,dist
  do
    if not step() then return s end
  end
  return dist
end
local function _return(dist)
  for j = 1,dist
  do
    back()
  end
end

----------------------------------
local dist = tonumber( tArgs[2] )

if not set() 
then 
  printError("config failed")
  return
end

s = _reach(dist)
print(s)
_return(s)

return
