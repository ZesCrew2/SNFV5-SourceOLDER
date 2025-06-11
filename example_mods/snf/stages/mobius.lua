function onCreate()
	-- background shit
	makeLuaSprite('mobiussky', 'mobiussky', -200, -200);
	setLuaSpriteScrollFactor('mobiussky', 0.7, 0.7);
	
	makeLuaSprite('mobiusground', 'mobiusground', -100, -250);
	setLuaSpriteScrollFactor('mobiusground', 0.9, 0.9);
	scaleObject('mobiusground', 1.2, 1.4);
	
	addLuaSprite('mobiussky', false);
	addLuaSprite('mobiusground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end