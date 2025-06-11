
function onCreate()
		makeLuaSprite('bg1', 'BG/machine', -520, -780);
		scaleObject('bg1', 7, 7);
		setProperty('bg1.antialiasing', false);
		addLuaSprite('bg1', false);
		setScrollFactor('gf', 1, 1);
end
