--isSwitchedX = true
--isSwitchedY = true
allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
	allowCountdown = true
	runTimer('let him speak', 1)
	return Function_Stop;
	end
end

function onCreate()
makeLuaSprite('curtain', 'BBTCurtain', 0, 0)
scaleObject('curtain', 0.5, 0.5)
addLuaSprite('curtain', false)
screenCenter('curtain')
setObjectCamera('curtain', 'other')

makeAnimatedLuaSprite('puppet', 'hattyPuppet', 408, 96)
addAnimationByPrefix('puppet', 'hi', 'hi', 24, false)
addAnimationByPrefix('puppet', 'hiOff', 'hi', 0, false)
addAnimationByPrefix('puppet', "loop", 'loop', 24, true)
-- setProperty('puppetGHOST.x', 250)
-- setProperty('puppetGHOST.y', 100)
addAnimationByPrefix('puppet', 'bye', 'bye', 24, false)
-- setProperty('puppetGHOST.x', -287)
-- setProperty('puppetGHOST.y', -7)
objectPlayAnimation('puppet', "hiOff")
scaleObject('puppet', 1, 1)
setObjectCamera('puppet', 'other')
addLuaSprite('puppet', true)

--[[
makeAnimatedLuaSprite('puppetGHOST', 'hattyPuppet', 408, 96)
addAnimationByPrefix('puppetGHOST', 'hi', 'hi', 24, false)
-- setProperty('puppetGHOST.x', 408)
-- setProperty('puppetGHOST.y', 96)
addAnimationByPrefix('puppetGHOST', "loop", 'loop', 24, false)
-- addAnimationByPrefix('puppetGHOST', 'bye', 'bye', 24, true)
addAnimationByIndices('puppetGHOST', 'bye', 'bye', {0})
-- setProperty('puppetGHOST.x', -287)
-- setProperty('puppetGHOST.y', -7)
objectPlayAnimation('puppetGHOST', "bye")
scaleObject('puppetGHOST', 1, 1)
setObjectCamera('puppetGHOST', 'other')
addLuaSprite('puppetGHOST', true)
setProperty('puppetGHOST.alpha', 0.5) -- for the matching.

makeLuaText('points', "X: whar\nY: whar", 0, 100, 100);
setTextSize('points', 50);
addLuaText('points');
setObjectCamera('points', 'camOther');
]]
end

function onUpdate()
	if getProperty('puppet.animation.curAnim.name') == 'hi' and getProperty('puppet.animation.curAnim.finished') then
	objectPlayAnimation('puppet', "loop")
	setProperty('puppet.x', 250)
	setProperty('puppet.y', 100)
	
	randomLine = getRandomInt(1,13)
		if randomLine == 1 then
		randomLine = 'dieSCREAMING'
		elseif randomLine == 2 then
		randomLine = 'drPEPPER'
		elseif randomLine == 3 then
		randomLine = 'fakeSTAMPER'
		elseif randomLine == 4 then
		randomLine = 'filthyLIAR'
		elseif randomLine == 5 then
		randomLine = 'goldHAT'
		elseif randomLine == 6 then
		randomLine = 'JK'
		elseif randomLine == 7 then
		randomLine = 'LOL'
		elseif randomLine == 8 then
		randomLine = 'MEAT'
		elseif randomLine == 9 then
		randomLine = 'notTHISagain'
		elseif randomLine == 10 then
		randomLine = 'PIZZA'
		elseif randomLine == 11 then
		randomLine = 'POCKETS'
		elseif randomLine == 12 then
		randomLine = 'ready4FUN'
		elseif randomLine == 13 then
		randomLine = 'whoaRUDE'
		end
		
	soundName = 'quipINTRO/quipINTRO_'..randomLine
	playSound(soundName, 1, 'he finished talking');
	end
	
	--[[
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.P') then
	restartSong()
	end
	]]
end
	
--[[
-- Just the debugging for myself, Herox.
 
xPosition = getProperty('puppetGHOST.x')
yPosition = getProperty('puppetGHOST.y')

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') then
	setProperty('puppetGHOST.y', yPosition-1)
		if keyboardPressed('SHIFT') and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') then
		setProperty('puppetGHOST.y', yPosition-10)
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
	setProperty('puppetGHOST.y', yPosition+1)
		if keyboardPressed('SHIFT') and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
		setProperty('puppetGHOST.y', yPosition+10)
		end
	end
	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
	setProperty('puppetGHOST.x', xPosition-1)
		if keyboardPressed('SHIFT') and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
		setProperty('puppetGHOST.x', xPosition-10)
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
	setProperty('puppetGHOST.x', xPosition+1)
		if keyboardPressed('SHIFT') and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
		setProperty('puppetGHOST.x', xPosition+10)
		end
	end
	
	setTextString("points", "X: "..getProperty('puppetGHOST.x').." (Press A and D to switch X level)\nY: "..getProperty('puppetGHOST.y').." (Press Q and E to switch Y level)")
end
]]

function onTimerCompleted(tag)
	if tag == 'let him speak' then
	objectPlayAnimation('puppet', "hi")
	end
	
	if tag == 'wait for it' then
	setProperty('puppet.visible', false)
	setProperty('curtain.visible', false)
	startCountdown()
	end
end

function onSoundFinished(tag)
	if tag == 'he finished talking' then
	objectPlayAnimation('puppet', "bye")
	setProperty('puppet.x', -287)
	setProperty('puppet.y', -7)
	doTweenY('oh my god the song is gonna start!!', 'curtain', 800, 1, 'sineIn')
	runTimer('wait for it', 1.5)
	end
end