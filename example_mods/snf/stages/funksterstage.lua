function onCreate()
	-- background shit
	makeLuaSprite('funkster-stage', 'funkster-stage', -600, -750);
	setLuaSpriteScrollFactor('funkster-stage', 1.0, 1.0);
	scaleObject('funkster-stage', 2.5, 2.6);

	addLuaSprite('funkster-stage', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end