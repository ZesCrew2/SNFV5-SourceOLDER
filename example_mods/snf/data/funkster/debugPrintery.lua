function onEvent(name, v1, v2)
	if name == '' then
		if v1 == 'show launch' then
		runTimer('this and that', 0.0001)
		-- when the event is triggered, it'll add more than one.
		-- so I thought adding as a timer would work as one.
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'this and that' then
	debugPrint("runHaxeCode: Object BreitbartEncrypter.exe failed to launch!", "red")
	end
end