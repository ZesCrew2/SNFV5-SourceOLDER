function onCreate()
	-- background shit
	makeLuaSprite('angel-island-sky', 'angel-island-sky', -600, -100);
	setLuaSpriteScrollFactor('angel-island-sky', 0.7, 0.7);
	scaleObject('angel-island-sky', 1.3, 1.3);
	
	makeLuaSprite('angel-island-clouds', 'angel-island-clouds', -600, -200);
	setLuaSpriteScrollFactor('angel-island-clouds', 0.1, 0.2);
	scaleObject('angel-island-clouds', 1.3, 1.3);
	
	makeLuaSprite('angel-island-water', 'angel-island-water', -600, -100);
	setLuaSpriteScrollFactor('angel-island-water', 0.2, 0.7);
	scaleObject('angel-island-water', 1.5, 1.3);
	
	makeLuaSprite('angel-island-ground', 'angel-island-ground', -1000, -200);
	setLuaSpriteScrollFactor('angel-island-ground', 0.9, 0.9);
	scaleObject('angel-island-ground', 1.6, 1.6);
	
	makeLuaSprite('angel-island-funnylolol', 'angel-island-funnylolol', -600, 0);
	setLuaSpriteScrollFactor('angel-island-funnylolol', 0.9, 0.9);
	scaleObject('angel-island-funnylolol', 1.3, 1.3);
	
	addLuaSprite('angel-island-sky', false);
	addLuaSprite('angel-island-clouds', false);
	addLuaSprite('angel-island-water', false);
	addLuaSprite('angel-island-ground', false);
	addLuaSprite('angel-island-funnylolol', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end