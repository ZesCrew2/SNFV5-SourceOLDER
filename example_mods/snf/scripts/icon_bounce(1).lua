-- russian code really is doing a great job here!!!!!!!!!!!!!
-- wow!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- WHAT THE FUCK NOT EVEN MINE IS WORKING (- Herox, as of May 18th, 2025. 2:19 PM)

-- I'm tired......................
-- I'm having a pain and crashout day right now. (- Herox, as of May 18th, 2025. 1 hour later after that comment, 3:53 PM)

--
iconBounce = 1
iconHeight = 15

function onBeatHit()
	if iconBounce == 1 then
		if not downscroll then
			if songName == "Re-Rocked" then
			doTweenY('playerIconTag', 'iconP1', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "Blasted Hedgehog" then
			doTweenY('playerIconTag', 'iconP1', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "Dithering Dingbots" then
			doTweenY('playerIconTag', 'iconP1', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "Robotnik_ii" then
			doTweenY('playerIconTag', 'iconP1', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "robotnik-ii" then
			doTweenY('playerIconTag', 'iconP1', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			else
			doTweenY('playerIconTag', 'iconP1', 565.8-iconHeight, 0.15, 'circOut') -- 565.8
			iconBounce = 2
			end
		else
			if songName == "Re-Rocked" then
			doTweenY('playerIconTag', 'iconP1', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "Blasted Hedgehog" then
			doTweenY('playerIconTag', 'iconP1', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "Dithering Dingbots" then
			doTweenY('playerIconTag', 'iconP1', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "Robotnik_ii" then
			doTweenY('playerIconTag', 'iconP1', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			elseif songName == "robotnik-ii" then
			doTweenY('playerIconTag', 'iconP1', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 2
			else
			doTweenY('playerIconTag', 'iconP1', 4.2-iconHeight, 0.15, 'circOut') -- 4.2
			iconBounce = 2
			end
		end
	elseif iconBounce == 2 then
		if not downscroll then
			if songName == "Re-Rocked" then
			doTweenY('opponentIconTag', 'iconP2', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "Blasted Hedgehog" then
			doTweenY('opponentIconTag', 'iconP2', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "Dithering Dingbots" then
			doTweenY('opponentIconTag', 'iconP2', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "Robotnik_ii" then
			doTweenY('opponentIconTag', 'iconP2', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "robotnik-ii" then
			doTweenY('opponentIconTag', 'iconP2', 725-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			else
			doTweenY('opponentIconTag', 'iconP2', 565.8-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			end
		else
			if songName == "Re-Rocked" then
			doTweenY('opponentIconTag', 'iconP2', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "Blasted Hedgehog" then
			doTweenY('opponentIconTag', 'iconP2', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "Dithering Dingbots" then
			doTweenY('opponentIconTag', 'iconP2', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "Robotnik_ii" then
			doTweenY('opponentIconTag', 'iconP2', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			elseif songName == "robotnik-ii" then
			doTweenY('opponentIconTag', 'iconP2', -150-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			else
			doTweenY('opponentIconTag', 'iconP2', 4.2-iconHeight, 0.15, 'circOut')
			iconBounce = 1
			end
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'playerIconTag' then
		if not downscroll then
			if songName == "Re-Rocked" then
			doTweenY('playerIconTagEnd', 'iconP1', 725, 0.15, 'circIn')
			elseif songName == "Blasted Hedgehog" then
			doTweenY('playerIconTagEnd', 'iconP1', 725, 0.15, 'circIn')
			elseif songName == "Dithering Dingbots" then
			doTweenY('playerIconTagEnd', 'iconP1', 725, 0.15, 'circIn')
			elseif songName == "Robotnik_ii" then
			doTweenY('playerIconTagEnd', 'iconP1', 725, 0.15, 'circIn')
			elseif songName == "robotnik-ii" then
			doTweenY('playerIconTagEnd', 'iconP1', 725, 0.15, 'circIn')
			else
			doTweenY('playerIconTagEnd', 'iconP1', 565.8, 0.15, 'circIn')
			end
		else
			if songName == "Re-Rocked" then
			doTweenY('playerIconTagEnd', 'iconP1', -150, 0.15, 'circIn')
			elseif songName == "Blasted Hedgehog" then
			doTweenY('playerIconTagEnd', 'iconP1', -150, 0.15, 'circIn')
			elseif songName == "Dithering Dingbots" then
			doTweenY('playerIconTagEnd', 'iconP1', -150, 0.15, 'circIn')
			elseif songName == "Robotnik_ii" then
			doTweenY('playerIconTagEnd', 'iconP1', -150, 0.15, 'circIn')
			elseif songName == "robotnik-ii" then
			doTweenY('playerIconTagEnd', 'iconP1', -150, 0.15, 'circIn')
			else
			doTweenY('playerIconTagEnd', 'iconP1', 4.2, 0.15, 'circIn')
			end
		end
	end
	
	if tag == 'opponentIconTag' then
		if not downscroll then
			if songName == "Re-Rocked" then
			doTweenY('opponentIconTagEnd', 'iconP2', 725, 0.15, 'circIn')
			elseif songName == "Blasted Hedgehog" then
			doTweenY('opponentIconTagEnd', 'iconP2', 725, 0.15, 'circIn')
			elseif songName == "Dithering Dingbots" then
			doTweenY('opponentIconTagEnd', 'iconP2', 725, 0.15, 'circIn')
			elseif songName == "Robotnik_ii" then
			doTweenY('opponentIconTagEnd', 'iconP2', 725, 0.15, 'circIn')
			elseif songName == "robotnik-ii" then
			doTweenY('opponentIconTagEnd', 'iconP2', 725, 0.15, 'circIn')
			else
			doTweenY('opponentIconTagEnd', 'iconP2', 565.8, 0.15, 'circIn')
			end
		else
			if songName == "Re-Rocked" then
			doTweenY('opponentIconTagEnd', 'iconP2', -150, 0.15, 'circIn')
			elseif songName == "Blasted Hedgehog" then
			doTweenY('opponentIconTagEnd', 'iconP2', -150, 0.15, 'circIn')
			elseif songName == "Dithering Dingbots" then
			doTweenY('opponentIconTagEnd', 'iconP2', -150, 0.15, 'circIn')
			elseif songName == "Robotnik_ii" then
			doTweenY('opponentIconTagEnd', 'iconP2', -150, 0.15, 'circIn')
			elseif songName == "robotnik-ii" then
			doTweenY('opponentIconTagEnd', 'iconP2', -150, 0.15, 'circIn')
			else
			doTweenY('opponentIconTagEnd', 'iconP2', 4.2, 0.15, 'circIn')
			end
		end
	end
end

--]]

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

-- old code from a russian person
--

-- Поочерёдное плавное подпрыгивание иконок на хелсбаре
-- Работает с Psych Engine 0.6.3

--[[
icon1Y = 0
icon2Y = 0
local bounceIcon = 1 -- 1 = P1, 2 = P2
local bounceHeight = 15
local bounceSpeed = 0.15

function onCreatePost()
icon1Y = getProperty('iconP1.y')
icon2Y = getProperty('iconP2.y')
end

function onBeatHit()
    if bounceIcon == 1 then
        -- Прыжок для iconP1 (игрок)
        triggerBounce('iconP1', icon1Y)
        bounceIcon = 2
    else
        -- Прыжок для iconP2 (оппонент)
        triggerBounce('iconP2', icon2Y)
        bounceIcon = 1
    end
end

function triggerBounce(tag, originalY)
    local upTag = tag .. '_up'
    local downTag = tag .. '_down'
    
    -- Прыгаем вверх
    doTweenY(upTag, tag, originalY - bounceHeight, bounceSpeed, 'circOut')
    
    -- Возвращаемся вниз чуть позже
    runTimer(downTag, bounceSpeed)
end

function onTimerCompleted(tag)
    if tag == 'iconP1_down' then
        doTweenY('iconP1_return', 'iconP1', icon1Y, bounceSpeed, 'circIn')
    elseif tag == 'iconP2_down' then
        doTweenY('iconP2_return', 'iconP2', icon2Y, bounceSpeed, 'circIn')
    end
end
--]]