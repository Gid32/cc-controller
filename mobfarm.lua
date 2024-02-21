local tArgs = { ... }
if (#tArgs < 1) or (#tArgs > 2) then
	print( "Usage: mobfarm <attack side> [drop side]" )
	print( "sides up|fwd|down" )
	return
end

local function setAttack()
    if tArgs[1] ==  "up"
    then
        attack = turtle.attackUp
        suck = turtle.suckUp
        return true
    end

    if tArgs[1] ==  "down"
    then
        attack = turtle.attackDown
        suck = turtle.suckDown
        return true
    end

    if tArgs[1] ==  "fwd"
    then
        attack = turtle.attack
        suck = turtle.suck
        return true
    end
    return false
end

local function setDrop()
    if tArgs[2] ==  "up"
    then
        drop = turtle.dropUp
    return true
    end

    if tArgs[2] ==  "down"
    then
        drop = turtle.dropDown
    return true
    end

    if tArgs[2] ==  "fwd"
    then
        drop = turtle.drop
    return true
    end
    return false
end

local function freeInv()
    for i = 1,16 
    do
        if (turtle.getItemCount(i) ~= 0 )
        then
            turtle.select(i)
            drop()
        end
    end
end

setAttack()
setDrop()

while (true)
do
    attack()
    suck()
    if tArgs[2]
    then 
        freeInv()
    end
end