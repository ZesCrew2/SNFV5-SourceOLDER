function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    local random = math.random (3)
    if random == 1 then
        playSound("missnote1", 0.4, "miss1") -- change the decimal number to change the volume
    elseif random == 2 then
        playSound("missnote2", 0.4, "miss2")
    elseif random == 3 then
        playSound("missnote3", 0.4, "miss3")
    end
end