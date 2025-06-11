function onEvent(name, value1, value2)
	if name == "black" then
		makeLuaSprite('image', value1, -340, -100);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 2, 'quartIn');
		setObjectCamera('image', 'camGame');
		runTimer('wait', value2);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 0, 2, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end