function onCreate()
	-- background shit
	makeLuaSprite('mugthumbnailgrad', 'mugthumbnailgrad', -300, 300);
	setLuaSpriteScrollFactor('mugthumbnailgrad', 1.0, 1.0);

	addLuaSprite('mugthumbnailgrad', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end