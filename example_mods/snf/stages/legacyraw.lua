function onCreate()
	-- background shit
	makeLuaSprite('bg', 'legacyraw', -980.6, -388.4);
	
	addLuaSprite('bg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end