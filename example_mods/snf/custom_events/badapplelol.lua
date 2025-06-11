local hasSpawned = false
function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' and hasSpawned == false then
		makeLuaSprite('blackbg', '', -500, -300)
		setScrollFactor('blackbg', 0, 0)
		makeGraphic('blackbg', 5000, 5000, '000000')
		addLuaSprite('blackbg', false)
		setProperty('blackbg.alpha', 0)
		scaleObject('blackbg', 18, 22);
		doTweenAlpha('applebadxd69', 'blackbg', 1, value2, 'linear')
		doTweenColor('badapplexd', 'link', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd1', 'ganon', 'FFFFFF', value2, 'linear')
		hasSpawned = true
	end
	if name == 'badapplelol' and value1 == 'a' and hasSpawned == true then
		doTweenAlpha('applebadxd69', 'blackbg', 1, value2, 'linear')
		doTweenColor('badapplexd', 'link', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd1', 'ganon', 'FFFFFF', value2, 'linear')
	end
	if name == 'badapplelol' and value1 == 'b' then
		doTweenAlpha('applebadxd', 'blackbg', 0, value2, 'linear')
		doTweenColor('badapplexd3', 'link', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd4', 'ganon', 'FFFFFF', value2, 'linear')
	end
end