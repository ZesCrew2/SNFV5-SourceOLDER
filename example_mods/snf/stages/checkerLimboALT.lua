function onCreate()
	-- background shit
	makeLuaSprite('checker-sky', 'checker-sky', -600, -400);
	setLuaSpriteScrollFactor('stageback', 0.7, 0.7);
	scaleObject('checker-sky', 2.5, 2.5);
	
	makeLuaSprite('checker-ground', 'checker-ground', -600, -400);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('checker-ground', 2.5, 2.5);

	addLuaSprite('checker-sky', false);
	addLuaSprite('checker-ground', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end