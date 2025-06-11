everyBeat = 4 --set to 1 in-case you want it every beat lol
autoBeat = false --if your lazy set this to true... 

function onEvent(eventName, value1, value2)
    if eventName == 'BassBounce' then

        noteShit('playerStrums', value1)
        noteShit('opponentStrums', value1)


        for i = 0, 7 do
            noteTweenAngle('resetAng'..i, i, 0, 0.6, 'bounceOut')
            noteTweenY('resetY'..i, i, defaultOpponentStrumY0, 0.6, 'bounceOut')
        end
    end

    if eventName == 'autoBBsettings' then

        everyBeat = value2
        autoBeat = value1

    end
end



function onBeatHit()
    if autoBeat then
        if curBeat % everyBeat == 0 then
            noteShit('playerStrums')
            noteShit('opponentStrums')
        end


        for i = 0, 7 do
            noteTweenAngle('resetAng'..i, i, 0, 0.6, 'bounceOut')
            noteTweenY('resetY'..i, i, defaultOpponentStrumY0, 0.6, 'bounceOut')
        end
    end
end

function noteShit(side, switchup)
    if curBeat % everyBeat * 2 == 0 or switchup == true then
        setPropertyFromGroup(side, 1, 'angle', -10)
        setPropertyFromGroup(side, 1, 'y', defaultOpponentStrumY0 - 40)

        setPropertyFromGroup(side, 2, 'angle', 10)
        setPropertyFromGroup(side, 2, 'y', defaultOpponentStrumY0 - 40)

        setPropertyFromGroup(side, 0, 'angle', 10)
        setPropertyFromGroup(side, 0, 'y', defaultOpponentStrumY0 - 20)

        setPropertyFromGroup(side, 3, 'angle', -10)
        setPropertyFromGroup(side, 3, 'y', defaultOpponentStrumY0 - 20)
    else
        setPropertyFromGroup(side, 1, 'angle', 10)
        setPropertyFromGroup(side, 1, 'y', defaultOpponentStrumY0 - 40)

        setPropertyFromGroup(side, 2, 'angle', -10)
        setPropertyFromGroup(side, 2, 'y', defaultOpponentStrumY0 - 40)

        setPropertyFromGroup(side, 0, 'angle', -10)
        setPropertyFromGroup(side, 0, 'y', defaultOpponentStrumY0 - 20)

        setPropertyFromGroup(side, 3, 'angle', 10)
        setPropertyFromGroup(side, 3, 'y', defaultOpponentStrumY0 - 20)
    end
end