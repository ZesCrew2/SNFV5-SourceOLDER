function onCreate()
	-- background shit
	makeLuaSprite('bittensburrow', 'bittensburrow', -600, -100);
	setLuaSpriteScrollFactor('bittensburrow', 0.9, 0.9);
	
	makeLuaSprite('mogus', 'anima_stage_mogus', -800, 600);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('mogus', 1.1, 1.1);

	addLuaSprite('bittensburrow', false);
	addLuaSprite('mogus', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end