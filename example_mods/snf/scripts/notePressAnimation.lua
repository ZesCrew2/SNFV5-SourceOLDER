--[[
    CREDITS:
        - Kiitoliroo: made the code
        works with every character if their animation prefix has "sing" with LEFT/DOWN/UP/RIGHT (singLEFT, singDOWN, etc.)
        and are playable.
        Now, this script for some reason doesn't work in the default game stage, I will probably fix it later!
--]]

local hitArrow = true

function goodNoteHit()
    if hitArrow then
        hitArrow = getProperty('hitArrow') == 0
    end
    runTimer('Delay', 0.68, 1)
end

function onTimerCompleted(timerTag)
    if timerTag == 'Delay' then
        hitArrow = true
    end
end

function onUpdate()
    if hitArrow and keyJustPressed('left') then -- left arrow
        triggerEvent('Play Animation', 'singLEFT', 'bf', true)
    elseif hitArrow and keyJustPressed('down') then -- down arrow
        triggerEvent('Play Animation', 'singDOWN', 'bf', true)
    elseif hitArrow and keyJustPressed('up') then -- up arrow
        triggerEvent('Play Animation', 'singUP', 'bf', true)
    elseif hitArrow and keyJustPressed('right') then -- right arrow
        triggerEvent('Play Animation', 'singRIGHT', 'bf', true)
    elseif hitArrow and keyboardJustPressed('SPACE') then -- HEY animation -- space
        triggerEvent('Play Animation', 'hey', 'bf', true)
    end
end
