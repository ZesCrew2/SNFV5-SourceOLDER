-- TAKE ME TO THE ACTION
-- script by Moonlight
-- This script lets you skip right to gameplay! (Sends you right before the first note)
-- useful when a song has a long wait before the action and you're trying to do something

-- CONFIG:
local checkForBF = false    -- Should the script check if the first note is yours           > (Default: false)
local beatsBefore = 2       -- How many beats before the first note will the time skip to   > (Default: 2)
local keybind = ''      -- What keybind will trigger the skip, leave blank for none     > (Default: 'back')
local keyboard = 'E'         -- What keyboard key will trigger the skip, blank for none      > (Default: '')
-- DONT TOUCH ANYTHING BELOW THIS!

local skipTime = 0
local canSkip = false
local crochet1 = 0
function onCreatePost()
    crochet1 = crochet
    skipTime = getPropertyFromGroup('unspawnNotes', 0, 'strumTime') - (crochet1*2)
    if checkForBF then
        for i = 0, getProperty('unspawnNotes.length') do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                skipTime = getPropertyFromGroup('unspawnNotes', i, 'strumTime') - (crochet1*2)
                break
            end
        end
    end
    -- debugPrint(skipTime)
end

function onUpdate()
    if canSkip and getSongPosition() < skipTime then
        if (keybind ~= '' and keyJustPressed(keybind)) or (keyboard ~= '' and keyboardJustPressed(keyboard)) then
            canSkip = false
            -- debugPrint('hi ', getSongPosition(), ' ', skipTime)
            playSound('ring')
            cameraFlash('other', '0x55FFFFFF', crochet1*0.001, true)
            runHaxeCode([[game.setSongTime(]]..(skipTime)..[[)]])
        end
    end
end

function onSongStart()
    canSkip = true
end