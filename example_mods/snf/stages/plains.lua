function onCreate()
	-- background shit
	makeLuaSprite('plains-sky', 'plains-sky', 100, -70);
	setLuaSpriteScrollFactor('stageback', 0.7, 0.7);
	scaleObject('plains-sky', 1.5, 1.0);
	
	makeLuaSprite('plains-grass', 'plains-grass', 100, 0);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('plains-grass', 1.5, 1.0);

	addLuaSprite('plains-sky', false);
	addLuaSprite('plains-grass', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end