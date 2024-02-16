local level = turtle.getFuelLevel()
if level == "unlimited" then error("Turtle does not need fuel", 0) end

local limit = turtle.getFuelLimit()
if level == limit then error("Turtle at full capacity", 0) end

local function tryPlaceDown()
  while (not turtle.placeDown()) 
  do 
  end
end

while (level < limit)
do
  tryPlaceDown()
  turtle.refuel()
  level = turtle.getFuelLevel()
  print(("Fuelled level is: %d/%d"):format(level,limit))
end

tryPlaceDown()
turtle.back()
turtle.refuel()
print("Done")