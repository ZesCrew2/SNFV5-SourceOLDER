debugCPUControlled = true -- disable this when it releases lol

firstControl = 'W'
secondControl = 'Q'
thirdControl = 'P'
switchBotplayControl = true
switchPracticeControl = true
switchIconControl = true

heroxLegacyControl = false

function onUpdatePost()
if keyboardJustPressed(''..thirdControl..'') and switchPracticeControl == true then
setProperty('practiceMode', true)
playSound('ring', 1)
switchPracticeControl = false
elseif keyboardJustPressed(''..thirdControl..'') and switchPracticeControl == false then
setProperty('practiceMode', false)
switchPracticeControl = true
end

if keyboardJustPressed('FIVE') and switchIconControl == true then
playSound('ring', 1)
runHaxeCode([[game.iconP1.changeIcon('funnytroll');]])
switchIconControl = false
elseif keyboardJustPressed('FIVE') and switchIconControl == false then
switchIconControl = true
	if boyfriendName == 'sonicsmol' then
	runHaxeCode([[game.iconP1.changeIcon('sonic');]])
	
	elseif boyfriendName == 'sonicbbt' then
	runHaxeCode([[game.iconP1.changeIcon('sonic');]])
	
	elseif boyfriendName == 'sonicmental' then
	runHaxeCode([[game.iconP1.changeIcon('sonic');]])
	
	elseif boyfriendName == 'sonicskeld' then
	runHaxeCode([[game.iconP1.changeIcon('sonic');]])
	
	elseif boyfriendName == 'sonicrb2' then
	runHaxeCode([[game.iconP1.changeIcon('sonic');]])
	
	elseif boyfriendName == 'syngoober' then
	runHaxeCode([[game.iconP1.changeIcon('syngooberflip');]])
	
	-- welcome to "WHAT THE FUCK DO YOU MEAN NUH UH?!??" part (- Herox/Arie Temps)
	--[[
	elseif boyfriendName == 'sonic' then
	runHaxeCode([[game.iconP1.changeIcon('sonic');]--])
	
	elseif boyfriendName == 'ralsei' then
	runHaxeCode([[game.iconP1.changeIcon('ralsei');]--])
	]]
	
	else
	runHaxeCode([[game.iconP1.changeIcon(']]..string.lower(boyfriendName)..[[');]])
	end
end
			
	if debugCPUControlled == true then
	
		if heroxLegacyControl == false then
			if keyboardJustPressed(''..firstControl..'') and switchBotplayControl == true then
			setProperty('cpuControlled', true)
			playSound('ring', 1)
			switchBotplayControl = false
			elseif keyboardJustPressed(''..firstControl..'') and switchBotplayControl == false then
			setProperty('cpuControlled', false)
			switchBotplayControl = true
			end
		else
			if keyboardJustPressed(''..firstControl..'') then
			setProperty('cpuControlled', true)
			playSound('ring', 1)
			elseif keyboardJustPressed(''..secondControl..'') then
			setProperty('cpuControlled', false)
			end
		end
	end
end
