function onCreate()
	-- background shit
	makeLuaSprite('merostage', 'merostage', -600, -100);
	setLuaSpriteScrollFactor('merostage', 0.9, 0.9);
	
	addLuaSprite('merostage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end