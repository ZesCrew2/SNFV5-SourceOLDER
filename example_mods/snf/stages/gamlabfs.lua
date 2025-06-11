function onCreate()
	-- background shit
	makeLuaSprite('bfsvoid', 'BFS1Gamla', -600, -100);
	setLuaSpriteScrollFactor('gamla', 0.9, 0.9);
	
	makeLuaSprite('character_place_space_at_post_haste', 'BFS1GamlaPlaceholder', -600, -100);
	setLuaSpriteScrollFactor('gamla', 0.9, 0.9);

	makeLuaSprite('watermark', 'BFS1GamlaWatermark', -600, -100);
	setLuaSpriteScrollFactor('gamla', 0.9, 0.9);

	addLuaSprite('bfsvoid', false);
	addLuaSprite('', false);
	addLuaSprite('', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end