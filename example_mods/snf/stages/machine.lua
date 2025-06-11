
function onCreate()
		makeAnimatedLuaSprite('bg1', 'BG/machine', -220, -780);
		setLuaSpriteScrollFactor('bg1', 1.0, 1.0);
		scaleObject('bg1', 7, 7);
		setProperty('bg1.antialiasing', false);
		addAnimationByPrefix('bg1', 'prisonAnim', 'prisonAnim', 12, true);
		addLuaSprite('bg1', false);
		setScrollFactor('gf', 1, 1);
end
