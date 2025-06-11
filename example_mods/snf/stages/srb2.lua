function onCreate()
	-- background shit
	makeLuaSprite('P1314059', 'P1314059', -200, -200);
	setLuaSpriteScrollFactor('P1314059', 0.7, 0.7);
	scaleObject('angel-island-sky', 0.8, 0.8);
	
	addLuaSprite('P1314059', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end