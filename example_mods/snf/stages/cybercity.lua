function onCreate()
	-- background shit
	makeLuaSprite('cybercityBG', 'cybercityBG', -400, 0);
	setLuaSpriteScrollFactor('cybercityBG', 0.69, 0.69);
	scaleObject('cybercityBG', 1.2, 1.2);
	
	makeLuaSprite('cybercityFloor', 'cybercityFloor', -350, 800);
	setLuaSpriteScrollFactor('cybercityFloor', 1.0, 1.0);
	scaleObject('cybercityFloor', 1.0, 1.0);

	makeLuaSprite('cybercityCeiling', 'cybercityCeiling', -350, -500);
	setLuaSpriteScrollFactor('cybercityCeiling', 1.0, 1.0);
	scaleObject('cybercityCeiling', 1.0, 1.0);

	addLuaSprite('cybercityBG', false);
	addLuaSprite('cybercityFloor', false);
	addLuaSprite('cybercityCeiling', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end