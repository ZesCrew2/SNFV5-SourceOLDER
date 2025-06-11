function onCreate()
	-- background shit
	makeLuaSprite('discordcolor', 'discordcolor', -600, -300);
	setLuaSpriteScrollFactor('discordcolor', 0.9, 0.9);
	
	makeLuaSprite('', '', -650, 600);
	setLuaSpriteScrollFactor('', 0.9, 0.9);
	scaleObject('', 1.1, 1.1);

	addLuaSprite('discordcolor', false);
	addLuaSprite('', false);
	addLuaSprite('', false);
	addLuaSprite('', false);
	addLuaSprite('', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end