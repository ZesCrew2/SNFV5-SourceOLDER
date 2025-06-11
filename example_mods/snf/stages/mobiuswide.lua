function onCreate()
	-- background shit
	makeLuaSprite('mobiussky', 'mobiussky', -200, -200);
	setLuaSpriteScrollFactor('mobiussky', 0.7, 0.7);
	scaleObject('angel-island-sky', 0.8, 0.8);
	
	makeLuaSprite('mobiusground', 'mobiusground', -100, 0);
	setLuaSpriteScrollFactor('mobiusground', 0.9, 0.9);
	
	addLuaSprite('mobiussky', false);
	addLuaSprite('mobiusground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end