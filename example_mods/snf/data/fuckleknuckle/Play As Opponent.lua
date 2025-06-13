--Script by Super_Hugo on GameBanana https://gamebanana.com/members/2151945
--Enjoy!

---------------------------------------------OPTIONS---------------------------------------------

--general
blockInput = false		--disables all input

dontHitIgnore = false		--if enabled you won't be able to hit ignore notes but fixes weird input issues (recommended for songs that have 3 strums/characters)

missFunctions = true		--disable if something breaks or doesn't work as it should when you miss a note (for example missing a note as opponent affects boyfriend somehow)
keyPressFunctions = true		--same as above but for when you press a key

strumLock = false		--if enabled all strums/notes will stay visible and at the same position even if there is a modchart


--score/ui
splashes = true
hitsounds = true
ratings = true
scores = true


--health
drainP1 = false
drainP2 = true		--disable if song already has opponent health drain, so you dont have double health drain

gameover = true		--if you die when health reaches left side (uses normal gameover)




------------------------------dont change anything from this point on------------------------------

local miss = false
local dead = false

function onCreate()
	runHaxeCode([[
		game.keysArray = []; //disables normal input
		game.controlArray = []; //disables sustain notes and the entire input system (not sure if it breaks other stuff as well)
	]])
	addHaxeLibrary('GameOverSubstate')
	addHaxeLibrary('Math')
	addHaxeLibrary('Conductor')
end

function onSpawnNote(id, noteData, noteType, isSustainNote)

	if getPropertyFromGroup('notes', id, 'ignoreNote') or getPropertyFromGroup('notes', id, 'hitCausesMiss') then
		setPropertyFromGroup('notes', id, 'rating', 'ignore')
	end

	setPropertyFromGroup('notes', id, 'ignoreNote', true)

	if strumLock then
		setPropertyFromGroup('notes', id, 'copyAlpha', false)
	end

end

function onUpdate(elapsed)

	animThingP2(elapsed)

	if miss and not (string.find(getProperty('dad.animation.curAnim.name'):lower(), 'sing')) then
		setProperty('dad.colorTransform.redMultiplier', 1)
		setProperty('dad.colorTransform.greenMultiplier', 1)
		setProperty('dad.colorTransform.blueMultiplier', 1)
		miss = false
	end

	--botplay
	if getProperty('cpuControlled') then
	
		for i = 0, getProperty('notes.length')-1 do

			if not getPropertyFromGroup('notes', i, 'mustPress') then
	
				if (getPropertyFromGroup('notes', i, 'strumTime') <= getPropertyFromClass('Conductor', 'songPosition')) or (getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'strumTime') <= getPropertyFromClass('Conductor', 'songPosition') + (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'earlyHitMult'))) then

					if not (getPropertyFromGroup('notes', i, 'hitByOpponent')) and not (getPropertyFromGroup('notes', i, 'noteWasHit')) then
				
						if not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') then
					
							if not (getPropertyFromGroup('notes', i, 'isSustainNote')) then
								setPropertyFromGroup('notes', i, 'strumTime', getPropertyFromClass('Conductor', 'songPosition')) --make bot hit notes perfectly
							else
								setPropertyFromGroup('notes', i, 'noteWasHit', true)
								setPropertyFromGroup('notes', i, 'ignoreNote', false)
							end
							
							--for hitting extra keys that are out of reach
							if getPropertyFromGroup('notes', i, 'noteData') > getProperty('opponentStrums.length') then
								setPropertyFromGroup('notes', i, 'noteData', getPropertyFromGroup('notes', i, 'noteData') % getProperty('opponentStrums.length'))
							end

							runHaxeCode('game.opponentNoteHit(game.notes.members['..i..']);')
						
						end
					
					end

				end
				
			end
				
		end
	
	end
	
	--boyfriend botplay
	for i = 0, getProperty('notes.length')-1 do

		if getPropertyFromGroup('notes', i, 'mustPress') then

			if (getPropertyFromGroup('notes', i, 'strumTime') <= getPropertyFromClass('Conductor', 'songPosition')) or (getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'canBeHit')) and not (getPropertyFromGroup('notes', i, 'wasGoodHit')) then
			
				if not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') then
			
					if not (getPropertyFromGroup('notes', i, 'isSustainNote')) then
						setPropertyFromGroup('notes', i, 'strumTime', getPropertyFromClass('Conductor', 'songPosition')) --make bot hit notes perfectly
					end
					
					--for hitting extra keys that are out of reach
					if getPropertyFromGroup('notes', i, 'noteData') > getProperty('playerStrums.length') then
						setPropertyFromGroup('notes', i, 'noteData', getPropertyFromGroup('notes', i, 'noteData') % getProperty('playerStrums.length'))
					end
					
					goodNoteHit2(i)

				end

			end
			
		end
		
	end

end

function onUpdatePost(elapsed)

	--reset key
	if not getPropertyFromClass('ClientPrefs', 'noReset') and getControl('RESET') and getProperty('canReset') 
	and not getProperty('inCutscene') and getProperty('startedCountdown') and not getProperty('endingSong') then
		setProperty('health', 2)
	end

	doDeathCheck()

	if not getProperty('cpuControlled') then
	
		for i = 0, getProperty('notes.length')-1 do

			if not getPropertyFromGroup('notes', i, 'mustPress') then
			
				if not getPropertyFromGroup('notes', i, 'noteWasHit') then
					setPropertyFromGroup('notes', i, 'ignoreNote', true)
				end
			
				if getPropertyFromGroup('notes', i, 'strumTime') > getPropertyFromClass('Conductor', 'songPosition') - (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'lateHitMult'))
				and getPropertyFromGroup('notes', i, 'strumTime') < getPropertyFromClass('Conductor', 'songPosition') + (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'earlyHitMult')) then
					setPropertyFromGroup('notes', i, 'canBeHit', true)
				end
				
				if getPropertyFromGroup('notes', i, 'strumTime') < getPropertyFromClass('Conductor', 'songPosition') - getPropertyFromClass('Conductor', 'safeZoneOffset') and not (getPropertyFromGroup('notes', i, 'hitByOpponent')) then
					setPropertyFromGroup('notes', i, 'tooLate', true)
				end
				
				if getPropertyFromClass('Conductor', 'songPosition') > (getProperty('noteKillOffset') - 15) + getPropertyFromGroup('notes', i, 'strumTime') then
					
					setPropertyFromGroup('notes', i, 'strumTime', getPropertyFromClass('Conductor', 'songPosition'))

					if not (getProperty('cpuControlled')) and not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') and not (getProperty('endingSong')) 
					and (getPropertyFromGroup('notes', i, 'tooLate') or not (getPropertyFromGroup('notes', i, 'hitByOpponent'))) then
						opponentNoteMiss(i, getPropertyFromGroup('notes', i, 'noteData'), getPropertyFromGroup('notes', i, 'noteType'), getPropertyFromGroup('notes', i, 'isSustainNote'))
					end
					
					setPropertyFromGroup('notes', i, 'active', false)
					setPropertyFromGroup('notes', i, 'visible', false)

					removeFromGroup('notes', i)
					
				end
			
			end
				
		end
	
		local controlArray = {getControl('NOTE_LEFT_P'), getControl('NOTE_DOWN_P'), getControl('NOTE_UP_P'), getControl('NOTE_RIGHT_P')}
		
		for i = 1, #controlArray do
		
			if controlArray[i] and not blockInput then
				strumPlayAnim('opponentStrums', i-1, 'pressed', true, 0)
				handleInput(i-1)
			end
			
		end
		
		local holdArray = {getControl('NOTE_LEFT'), getControl('NOTE_DOWN'), getControl('NOTE_UP'), getControl('NOTE_RIGHT')}
		
		for i = 1, #holdArray do
		
			if holdArray[i] and not blockInput then
			
				runHaxeCode([[
					var key = ]]..(i-1)..[[;
					var dontHitIgnore = ]]..tostring(dontHitIgnore)..[[;
					
					if (game.startedCountdown && !game.paused && key > -1)
					{
						if(game.generatedMusic && !game.endingSong)
						{
							game.notes.forEachAlive(function(daNote)
							{
								if (!daNote.mustPress && daNote.isSustainNote && daNote.canBeHit && !daNote.hitByOpponent && !daNote.blockHit)
								{
									if (daNote.noteData == key && ((dontHitIgnore && daNote.rating != 'ignore') || !dontHitIgnore)) 
									{
										daNote.noteWasHit = true;
										daNote.ignoreNote = false;
										game.opponentNoteHit(daNote);
									}
								}
							});
						}
					}
				]])
				
			end
			
		end
		
		local releaseArray = {getControl('NOTE_LEFT_R'), getControl('NOTE_DOWN_R'), getControl('NOTE_UP_R'), getControl('NOTE_RIGHT_R')}
		
		for i = 1, #releaseArray do
		
			if releaseArray[i] then
				strumPlayAnim('opponentStrums', i-1, 'static', true, 0)
				callOnLuas('onKeyRelease', {i-1}, true, false, {scriptName})
			end
			
		end
		
	end
	
	if strumLock then
		
		for i = 0, 3 do

			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i])
			setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i])
			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i])
			setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i])

			setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			setPropertyFromGroup('playerStrums', i, 'visible', true)
			setPropertyFromGroup('playerStrums', i, 'direction', 90)
			setPropertyFromGroup('playerStrums', i, 'downScroll', getPropertyFromClass('ClientPrefs', 'downScroll'))
			
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			setPropertyFromGroup('opponentStrums', i, 'visible', true)
			setPropertyFromGroup('opponentStrums', i, 'direction', 90)
			setPropertyFromGroup('opponentStrums', i, 'downScroll', getPropertyFromClass('ClientPrefs', 'downScroll'))
			
		end
	
	end

end

function opponentNoteMiss(id, noteData, noteType, isSustainNote)

	if scores then
	
		setProperty('combo', 0)
		setProperty('songMisses', getProperty('songMisses') + 1)
		setProperty('totalPlayed', getProperty('totalPlayed') + 1)
		
		if not (getProperty('practiceMode')) then setProperty('songScore', getProperty('songScore') - 10) end
		
		runHaxeCode('game.RecalculateRating(true);')
		
	end
	
	if drainP2 then
		setProperty('health', getProperty('health') + getPropertyFromGroup('notes', id, 'missHealth') * getProperty('healthLoss'))
	end
	
	if getProperty('instakillOnMiss') then
		setProperty('health', 2)
		doDeathCheck()
	end
	
	setProperty('vocals.volume', 0)
	
	if not (getPropertyFromGroup('notes', id, 'noMissAnimation')) then
	
		if getProperty('dad.hasMissAnimations') then
		
			local animToPlay = getProperty('singAnimations')[noteData + 1]..'miss'
			
			playAnim('dad', animToPlay, true)
			setProperty('dad.holdTimer', 0)

		else
		
			local animToPlay = getProperty('singAnimations')[noteData + 1]
		
			playAnim('dad', animToPlay, true)
			setProperty('dad.holdTimer', 0)

			setProperty('dad.colorTransform.redMultiplier', 0.6)
			setProperty('dad.colorTransform.greenMultiplier', 0.1)
			setProperty('dad.colorTransform.blueMultiplier', 0.6)
				
			miss = true

		end
	
	end
	
	if missFunctions then
		callOnLuas('noteMiss', {id, noteData, noteType, isSustainNote}, true, false)
	end
	
end

function noteMissPress(key)
	
	if getPropertyFromClass('ClientPrefs', 'ghostTapping') then return end
	
	if drainP2 then
		setProperty('health', getProperty('health') + 0.05 * getProperty('healthLoss'))
	end
	
	if getProperty('instakillOnMiss') then
		setProperty('health', 2)
		doDeathCheck()
	end
	
	if getProperty('combo') > 5 and not (getProperty('gf') == nil) then
		playAnim('gf', 'sad', true)
	end
	
	if scores then
	
		setProperty('combo', 0)
		setProperty('songMisses', getProperty('songMisses') + 1)
		setProperty('totalPlayed', getProperty('totalPlayed') + 1)
		
		if not (getProperty('practiceMode')) then setProperty('songScore', getProperty('songScore') - 10) end

		runHaxeCode('game.RecalculateRating(true);')
		
	end
	
	playSound('missnote'..getRandomInt(1, 3), getRandomFloat(0.1, 0.2))

	if getProperty('dad.hasMissAnimations') then
	
		local animToPlay = getProperty('singAnimations')[key + 1]..'miss'
		
		playAnim('dad', animToPlay, true)
		setProperty('dad.holdTimer', 0)

	else
	
		local animToPlay = getProperty('singAnimations')[key + 1]
	
		playAnim('dad', animToPlay, true)
		setProperty('dad.holdTimer', 0)

		setProperty('dad.colorTransform.redMultiplier', 0.6)
		setProperty('dad.colorTransform.greenMultiplier', 0.1)
		setProperty('dad.colorTransform.blueMultiplier', 0.6)
			
		miss = true

	end
	
	setProperty('vocals.volume', 0)
	
end

function doDeathCheck()
	
	if not dead and getProperty('health') >= 2 and gameover then
	
		dead = true
		
		runHaxeCode([[
			game.boyfriend.stunned = true;
			PlayState.deathCounter++;

			game.paused = true;

			game.vocals.stop();
			FlxG.sound.music.stop();

			game.persistentUpdate = false;
			game.persistentDraw = false;
			
			for (tween in game.modchartTweens) {
				tween.active = true;
			}
			for (timer in game.modchartTimers) {
				timer.active = true;
			}
			
			game.openSubState(new GameOverSubstate(game.dad.getScreenPosition().x - game.dad.positionArray[0], game.dad.getScreenPosition().y - game.dad.positionArray[1], game.camFollowPos.x, game.camFollowPos.y));
			game.isDead = true;
		]])
		
	end
	
end

function handleInput(key)

	runHaxeCode([[
		var key = ]]..key..[[;
		var dontHitIgnore = ]]..tostring(dontHitIgnore)..[[;
		
		if (game.startedCountdown && !PlayState.paused && key > -1)
		{
			if (game.generatedMusic && !PlayState.endingSong)
			{
				var lastTime = Conductor.songPosition;
				Conductor.songPosition = FlxG.sound.music.time;

				var canMiss = !ClientPrefs.ghostTapping;
				var sortedNotesList = [];
				
				game.notes.forEachAlive(function(daNote)
				{
					if (!daNote.mustPress && daNote.canBeHit && !daNote.hitByOpponent && !daNote.isSustainNote && !daNote.blockHit)
					{
						if (daNote.noteData == key)
						{
							sortedNotesList.push(daNote);
						}
						canMiss = true;
					}
				});
				sortedNotesList.sort(game.sortHitNotes);

				if (sortedNotesList.length > 0) 
				{
					var epicNote = sortedNotesList[0];

					for (doubleNote in sortedNotesList) 
					{
						if (doubleNote != epicNote)
						{
							if (Math.abs(doubleNote.strumTime - epicNote.strumTime) < 2) 
							{
								doubleNote.kill();
								game.notes.remove(doubleNote, true);
								doubleNote.destroy();
							}
						}
					}
					game.opponentNoteHit(epicNote);
				}
				else
				{
					game.callOnLuas('onGhostTap', [key], true);
					if (canMiss) {
						game.callOnLuas('noteMissPress', [key], true);
					}
				}
				
				Conductor.songPosition = lastTime;
			}
		}
	]])
	
	if keyPressFunctions then
		callOnLuas('onKeyPress', {data}, true, false, {scriptName})
	end
	
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

	local noteDiff = math.abs(getPropertyFromGroup('notes', id, 'strumTime') - getPropertyFromClass('Conductor', 'songPosition') + getPropertyFromClass('ClientPrefs', 'ratingOffset'))
	
	if tonumber(playbackRate) == nil or not (type(playbackRate) == 'number') then playbackRate = 1 end
	local daRating = judgeNote(noteDiff / playbackRate)

	if getPropertyFromGroup('notes', id, 'hitCausesMiss') or noteType == 'Hurt Note' then

		--make a splash even when not sick rating
		if not (getPropertyFromGroup('notes', id, 'noteSplashDisabled')) and not (isSustainNote) and splashes then
			spawnNoteSplash(id)
		end
		
		opponentNoteMiss(id, noteData, noteType, isSustainNote)

		if not (getPropertyFromGroup('notes', id, 'noMissAnimation')) then

			if noteType == 'Hurt Note' then
				playAnim('dad', 'hurt', true)
				setProperty('dad.specialAnim', true)
			end
			
		end
		
		if not (isSustainNote) then
			removeFromGroup('notes', id)
		else
			setPropertyFromGroup('notes', id, 'hitByOpponent', true)
		end
			
		return
		
	end

	if not isSustainNote then
	
		--hitsounds
		if hitsounds then
		
			if isLoreEngine then
			
				if not (getPropertyFromClass('ClientPrefs', 'hitSounds') == 'OFF') and not (getPropertyFromGroup('notes', id, 'hitsoundDisabled')) then
					playSound('hitsounds/'..getPropertyFromClass('ClientPrefs', 'hitSounds'):lower(), 1)
				end

			else

				if getPropertyFromClass('ClientPrefs', 'hitsoundVolume') > 0 and not (getPropertyFromGroup('notes', id, 'hitsoundDisabled')) then
					playSound('hitsound', getPropertyFromClass('ClientPrefs', 'hitsoundVolume'))
				end

			end
		
		end

		if splashes and daRating == 'sick' and not (getPropertyFromGroup('notes', id, 'noteSplashDisabled')) and getRatingData('sick', 'noteSplash') then
			spawnNoteSplash(id)
		end
		
		if scores then
		
			setPropertyFromGroup('notes', id, 'noteSplashDisabled', true)
			setProperty('combo', getProperty('combo') + 1)

			if ratings then
				runHaxeCode('game.popUpScore(game.notes.members['..id..']);')
			end
			
			if getProperty('cpuControlled') then
				
				setProperty('songScore', getProperty('songScore') + getRatingData(daRating, 'score'))
				setProperty('songHits', getProperty('songHits') + 1)
				setProperty('totalPlayed', getProperty('totalPlayed') + 1)
			
				runHaxeCode('game.RecalculateRating(false);')
				
			end
		
		end
		
	end
	
	if drainP2 then
	
		if getProperty('health') > 0.01 then
			setProperty('health', getProperty('health') - getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain'))
		end
		
	end
	
	if miss then
		setProperty('dad.colorTransform.redMultiplier', 1)
		setProperty('dad.colorTransform.greenMultiplier', 1)
		setProperty('dad.colorTransform.blueMultiplier', 1)
		miss = false
	end

	if not getProperty('cpuControlled') then
		strumPlayAnim('opponentStrums', noteData, 'confirm', true, 0)
	end
	
	setPropertyFromGroup('notes', id, 'hitByOpponent', true)
		
end

function goodNoteHit2(id)

	local noteData = getPropertyFromGroup('notes', id, 'noteData')
	local noteType = getPropertyFromGroup('notes', id, 'noteType')
	local isSustainNote = getPropertyFromGroup('notes', id, 'isSustainNote')

	if not getPropertyFromGroup('notes', id, 'wasGoodHit') and getPropertyFromGroup('notes', id, 'mustPress') then
	
		setProperty('vocals.volume', 1)

		--animations and stuff
		if not (getPropertyFromGroup('notes', id, 'noAnimation')) then

			local animToPlay = ''

			--for Psych Engine with extra keys
			if not (getPropertyFromClass('MainMenuState', 'extraKeysVersion') == nil or getPropertyFromClass('MainMenuState', 'extraKeysVersion') == 'extraKeysVersion') then
			
				addHaxeLibrary('Note')
				
				animToPlay = runHaxeCode([[
					var animToPlay = 'sing' + Note.keysShit.get(PlayState.mania).get('anims')[]]..noteData..[[];
					return animToPlay;
				]])
				
				if animToPlay == nil then animToPlay = '' end
				
			else
				animToPlay = getProperty('singAnimations')[noteData + 1]
			end
			
			local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
			if noteType == 'Alt Animation' or altAnim then animSuffix = '-alt' end
			
			if animSuffix == nil or animSuffix == 'animSuffix' then
				animSuffix = ''
			end
			
			if getPropertyFromGroup('notes', id, 'gfNote') then
			
				if not (getProperty('gf') == nil) then
				
					playAnim('gf', animToPlay..animSuffix, true)
					
					--if no animation with alt anims, play normal animation
					if not (animSuffix == '') and not (getProperty('gf.animation.curAnim.name') == animToPlay..animSuffix) then
						playAnim('gf', animToPlay, true)
					end
				
					setProperty('gf.holdTimer', 0)

				end
				
			else
			
				playAnim('boyfriend', animToPlay..animSuffix, true)
				
				--if no animation with alt anims, play normal animation
				if not (animSuffix == '') and not (getProperty('boyfriend.animation.curAnim.name') == animToPlay..animSuffix) then
					playAnim('boyfriend', animToPlay, true)
				end
				
				setProperty('boyfriend.holdTimer', 0)

			end
			
			if noteType == 'Hey!' then
			
				playAnim('boyfriend', 'hey', true)
				
				if isCharacter('boyfriend') then
					setProperty('boyfriend.specialAnim', true)
					setProperty('boyfriend.heyTimer', 0.6)
				end
				
				if not (getProperty('gf') == nil) then
					playAnim('gf', 'cheer', true)
					setProperty('gf.specialAnim', true)
					setProperty('gf.heyTimer', 0.6)
				end
				
			end
		
		end
		
		if drainP1 then
	
			if getProperty('health') < 1.95 then
				setProperty('health', getProperty('health') + getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain'))
			end
			
		end

		strumPlayAnim('playerStrums', noteData, 'confirm', true, 0.15)
		
		setPropertyFromGroup('notes', id, 'wasGoodHit', true)
		callOnLuas('goodNoteHit', {id, noteData, noteType, isSustainNote}, true, false)

		if not isSustainNote then
			removeFromGroup('notes', id)
		end
		
	end
	
end

function judgeNote(diff)

	for i = 1, getProperty('ratingsData.length')-1 do

		if diff <= getProperty('ratingsData['..(i - 1)..'].hitWindow') then
			return getProperty('ratingsData['..(i - 1)..'].name')
		end
	
	end
	
	return getProperty('ratingsData['..(getProperty('ratingsData.length'))..'].name')
	
end

function getRatingData(name, data)
	
	for i = 1, getProperty('ratingsData.length')-1 do

		if name == getProperty('ratingsData['..(i - 1)..'].name') then
			return getProperty('ratingsData['..(i - 1)..'].'..data)
		end
	
	end
	
end

function onGameOver()
	return Function_Stop
end

function animThingP2(elapsed)

	local holdArray = {getControl('NOTE_LEFT'), getControl('NOTE_DOWN'), getControl('NOTE_UP'), getControl('NOTE_RIGHT')}
	
	--animation stuff
	local thing = getPropertyFromClass('Conductor', 'stepCrochet') * 0.0011 * getProperty('dad.singDuration')
	
	if table.contains(holdArray, true) then
	
		if getProperty('dad.holdTimer') > thing - 0.03 then
			setProperty('dad.holdTimer', thing - 0.03)
		end
		
	end
	
end

function spawnNoteSplash(id, isPlayer)

	local strum = 'opponentStrums'
	
	if isPlayer then
		strum = 'playerStrums'
	end
	
	local noteData = getPropertyFromGroup('notes', id, 'noteData')
	local x = getPropertyFromGroup(strum, noteData, 'x')
	local y = getPropertyFromGroup(strum, noteData, 'y')

	runHaxeCode([[
		game.spawnNoteSplash(]]..x..[[, ]]..y..[[, game.notes.members[]]..id..[[].noteData, game.notes.members[]]..id..[[])
	]])
	
end

function getControl(tag)
	return runHaxeCode('return game.controls.'..tag..';')
end

function strumPlayAnim(strum, id, anim, forced, resetTime)

	if resetTime == nil then resetTime = 0 end
	if forced == nil then forced = false end
	
	--resets the animation
	if forced then
		setPropertyFromGroup(strum, id, 'animation.name', nil)
	end
	
	setPropertyFromGroup(strum, id, 'animation.name', anim) --play animation
	setPropertyFromGroup(strum, id, 'resetAnim', resetTime)
	
	--center offsets and origins
	setPropertyFromGroup(strum, id, 'origin.x', getPropertyFromGroup(strum, id, 'frameWidth') / 2)
	setPropertyFromGroup(strum, id, 'origin.y', getPropertyFromGroup(strum, id, 'frameHeight') / 2)
	setPropertyFromGroup(strum, id, 'offset.x', (getPropertyFromGroup(strum, id, 'frameWidth') - getPropertyFromGroup(strum, id, 'width')) / 2)
	setPropertyFromGroup(strum, id, 'offset.y', (getPropertyFromGroup(strum, id, 'frameHeight') - getPropertyFromGroup(strum, id, 'height')) / 2)

end

function table.contains(table, val)

	for i = 1, #table do

		if table[i] == val then
			return true
		end

	end
	return false

end