local noteSkins = {}
local noteSplashSkins = {}
local moveOn = false
local tableMax = 0

function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
			SplashSHITIDFK = getPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture')
		else
			strangeCheck = getPropertyFromGroup('unspawnNotes', i, 'noteType')
			strangeSplash = i
			for i = 0, tableMax do
				if strangeCheck == noteSkins[i] then
					moveOn = true
				end
			end
			if moveOn == false then
				table.insert(noteSkins, strangeCheck);
				table.insert(noteSplashSkins, getPropertyFromGroup('unspawnNotes', strangeSplash, 'noteSplashTexture'));
				tableMax = tableMax + 1
			end
		end
	end
	--[[for i = 0, tableMax do
		debugPrint(noteSkins[i])
		debugPrint(noteSplashSkins[i])
	end--]]
	if SplashSHITIDFK == 'noteSplashTexture' then
		SplashSHITIDFK = 'noteSplashes'
	end
	LeftX = getPropertyFromGroup('opponentStrums', 0, 'x') - 90
	DownX = getPropertyFromGroup('opponentStrums', 1, 'x') - 90
	UpX = getPropertyFromGroup('opponentStrums', 2, 'x') - 90
	RightX = getPropertyFromGroup('opponentStrums', 3, 'x') - 90
	LeftY = getPropertyFromGroup('opponentStrums', 0, 'y') - 90
	UpY = getPropertyFromGroup('opponentStrums', 1, 'y') - 90
	DownY = getPropertyFromGroup('opponentStrums', 2, 'y') - 90
	RightY = getPropertyFromGroup('opponentStrums', 3, 'y') - 90
	makeAnimatedLuaSprite('Left', SplashSHITIDFK, LeftX, LeftY)
	addAnimationByPrefix('Left', 'LSplash', 'note splash purple', 24, false)
	addLuaSprite('Left', true)
	setObjectCamera('Left', 'hud')
	scaleObject('Left', 0.85, 0.85);
	setProperty('Left.alpha', 0)
	makeAnimatedLuaSprite('Down', SplashSHITIDFK, DownX, DownY)
	addAnimationByPrefix('Down', 'DSplash', 'note splash blue', 24, false)
	addLuaSprite('Down', true)
	setObjectCamera('Down', 'hud')
	scaleObject('Down', 0.85, 0.85);
	setProperty('Down.alpha', 0)
	makeAnimatedLuaSprite('Up', SplashSHITIDFK, UpX, UpY)
	addAnimationByPrefix('Up', 'USplash', 'note splash green', 24, false)
	addLuaSprite('Up', true)
	setObjectCamera('Up', 'hud')
	scaleObject('Up', 0.85, 0.85);
	setProperty('Up.alpha', 0)
	makeAnimatedLuaSprite('Right', SplashSHITIDFK, RightX, RightY)
	addAnimationByPrefix('Right', 'RSplash', 'note splash red ', 24, false)
	addLuaSprite('Right', true)
	setObjectCamera('Right', 'hud')
	scaleObject('Right', 0.85, 0.85);
	setProperty('Right.alpha', 0)
	for i = 0, tableMax do
		LeftName = 'Left'..i
		DownName = 'Down'..i
		UpName = 'Up'..i
		RightName = 'Right'..i
		LeftAName = 'Left'..i..'.alpha'
		DownAName = 'Down'..i..'.alpha' 
		UpAName = 'Up'..i..'.alpha'
		RightAName = 'Right'..i..'.alpha'
		makeAnimatedLuaSprite(LeftName, noteSplashSkins[i], LeftX, LeftY)
		addAnimationByPrefix(LeftName, 'LSplash', 'note splash purple 1', 24, false)
		addLuaSprite(LeftName, true)
		setObjectCamera(LeftName, 'hud')
		scaleObject(LeftName, 0.85, 0.85);
		setProperty(LeftAName, 0)
		makeAnimatedLuaSprite(DownName, noteSplashSkins[i], DownX, DownY)
		addAnimationByPrefix(DownName, 'DSplash', 'note splash blue 1', 24, false)
		addLuaSprite(DownName, true)
		setObjectCamera(DownName, 'hud')
		scaleObject(DownName, 0.85, 0.85);
		setProperty(DownAName, 0)
		makeAnimatedLuaSprite(UpName, noteSplashSkins[i], UpX, UpY)
		addAnimationByPrefix(UpName, 'USplash', 'note splash green 1', 24, false)
		addLuaSprite(UpName, true)
		setObjectCamera(UpName, 'hud')
		scaleObject(UpName, 0.85, 0.85);
		setProperty(UpAName, 0)
		makeAnimatedLuaSprite(RightName, noteSplashSkins[i], RightX, RightY)
		addAnimationByPrefix(RightName, 'RSplash', 'note splash red 1', 24, false)
		addLuaSprite(RightName, true)
		setObjectCamera(RightName, 'hud')
		scaleObject(RightName, 0.85, 0.85);
		setProperty(RightAName, 0)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		if noteType == '' then
			if direction == 0 then
				setProperty('Left.alpha', (getPropertyFromGroup('opponentStrums', 0, 'alpha') / 2))
				objectPlayAnimation('Left', 'LSplash', true)
				runTimer('LSpl', 0.16)
			elseif direction == 1 then
				setProperty('Down.alpha', (getPropertyFromGroup('opponentStrums', 1, 'alpha') / 2))
				objectPlayAnimation('Down', 'DSplash', true)
				runTimer('DSpl', 0.16)
			elseif direction == 2 then
				setProperty('Up.alpha', (getPropertyFromGroup('opponentStrums', 2, 'alpha') / 2))
				objectPlayAnimation('Up', 'USplash', true)
				runTimer('USpl', 0.16)
			elseif direction == 3 then
				setProperty('Right.alpha', (getPropertyFromGroup('opponentStrums', 3, 'alpha') / 2))
				objectPlayAnimation('Right', 'RSplash', true)
				runTimer('RSpl', 0.16)
			end
		else
			for i = 0, tableMax do
				if noteType == noteSkins[i] then
					if direction == 0 then
						LeftName = 'Left'..i
						LeftAName = 'Left'..i..'.alpha'
						setProperty(LeftAName, (getPropertyFromGroup('opponentStrums', 0, 'alpha') / 2))
						objectPlayAnimation(LeftName, 'LSplash', true)
						runTimer('LSpl', 0.16)
					elseif direction == 1 then
						DownName = 'Down'..i
						DownAName = 'Down'..i..'.alpha'
						setProperty(DownAName, (getPropertyFromGroup('opponentStrums', 1, 'alpha') / 2))
						objectPlayAnimation(DownName, 'DSplash', true)
						runTimer('DSpl', 0.16)
					elseif direction == 2 then
						UpName = 'Up'..i
						UpAName = 'Up'..i..'.alpha'
						setProperty(UpAName, (getPropertyFromGroup('opponentStrums', 2, 'alpha') / 2))
						objectPlayAnimation(UpName, 'USplash', true)
						runTimer('USpl', 0.16)
					elseif direction == 3 then
						RightName = 'Right'..i
						RightAName = 'Right'..i..'.alpha'
						setProperty(RightAName, (getPropertyFromGroup('opponentStrums', 3, 'alpha') / 2))
						objectPlayAnimation(RightName, 'RSplash', true)
						runTimer('RSpl', 0.16)
					end
				end
			end
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'LSpl' then
		setProperty('Left.alpha', 0)
		for i = 0, tableMax do
			LeftAName = 'Left'..i..'.alpha'
			setProperty(LeftAName, 0)
		end
	elseif tag == 'DSpl' then
		setProperty('Down.alpha', 0)
		for i = 0, tableMax do
			DownAName = 'Down'..i..'.alpha'
			setProperty(DownAName, 0)
		end
	elseif tag == 'USpl' then
		setProperty('Up.alpha', 0)
		for i = 0, tableMax do
			UpAName = 'Up'..i..'.alpha'
			setProperty(UpAName, 0)
		end
	elseif tag == 'RSpl' then
		setProperty('Right.alpha', 0)
		for i = 0, tableMax do
			RightAName = 'Right'..i..'.alpha'
			setProperty(RightAName, 0)
		end
	end
end

function onUpdate(elapsed)
	LeftX = getPropertyFromGroup('opponentStrums', 0, 'x') - 90
	DownX = getPropertyFromGroup('opponentStrums', 1, 'x') - 90
	UpX = getPropertyFromGroup('opponentStrums', 2, 'x') - 90
	RightX = getPropertyFromGroup('opponentStrums', 3, 'x') - 90
	LeftY = getPropertyFromGroup('opponentStrums', 0, 'y') - 90
	UpY = getPropertyFromGroup('opponentStrums', 1, 'y') - 90
	DownY = getPropertyFromGroup('opponentStrums', 2, 'y') - 90
	RightY = getPropertyFromGroup('opponentStrums', 3, 'y') - 90
	setProperty('Left.x', LeftX)
	setProperty('Left.y', LeftY)
	setProperty('Down.x', DownX)
	setProperty('Down.y', DownY)
	setProperty('Up.x', UpX)
	setProperty('Up.y', UpY)
	setProperty('Right.x', RightX)
	setProperty('Right.y', RightY)
	for i = 0, tableMax do
		LeftNameX = 'Left'..i..'.x'
		DownNameX = 'Down'..i..'.x'
		UpNameX = 'Up'..i..'.x'
		RightNameX = 'Right'..i..'.x'
		LeftNameY = 'Left'..i..'.y'
		DownNameY = 'Down'..i..'.y'
		UpNameY = 'Up'..i..'.y'
		RightNameY = 'Right'..i..'.y'
		setProperty(LeftNameX, LeftX)
		setProperty(LeftNameY, LeftY)
		setProperty(DownNameX, DownX)
		setProperty(DownNameY, DownY)
		setProperty(UpNameY, UpX)
		setProperty(UpNameY, UpY)
		setProperty(RightNameX, RightX)
		setProperty(RightNameY, RightY)
	end
end