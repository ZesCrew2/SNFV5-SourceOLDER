debugCPUControlled = true

firstControl = 'W'
secondControl = 'Q'
thirdControl = 'P'
switchBotplayControl = true
switchPracticeControl = true

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