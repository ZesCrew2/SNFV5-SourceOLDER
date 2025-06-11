function onCreate()
	makeLuaSprite('BG', 'community-service/CsStageBG', -600, -500);
	scaleObject('BG', 0.7, 0.7);
	
	makeLuaSprite('FG', 'community-service/CsStageFG', -600, -100);
	setScrollFactor('FG', 0.9, 0.9)
	scaleObject('FG', 0.7, 0.7);

	addLuaSprite('BG', false);
	addLuaSprite('FG', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end