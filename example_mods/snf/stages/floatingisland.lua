function onCreate()
	-- background shit
	makeLuaSprite('floating-island-sky', 'floating-island-sky', -100, 0);
	setLuaSpriteScrollFactor('floating-island-sky', 0.6, 0.6);
	
	makeLuaSprite('floating-island-foliage', 'floating-island-foliage', -100, 0);
	setLuaSpriteScrollFactor('floating-island-foliage', 0.6, 0.6);
	
	makeLuaSprite('floating-island-back-hills', 'floating-island-back-hills', -100, 0);
	setLuaSpriteScrollFactor('floating-island-back-hills', 0.7, 0.7);
	
	makeLuaSprite('floating-island-trees', 'floating-island-trees', -100, 0);
	setLuaSpriteScrollFactor('floating-island-trees', 0.8, 0.8);
	
	makeLuaSprite('floating-island-front-hills', 'floating-island-front-hills', -100, 0);
	setLuaSpriteScrollFactor('floating-island-front-hills', 0.9, 0.9);
	
	makeLuaSprite('floating-island-front-gaming-in-the-clinton-years', 'floating-island-gaming-in-the-clinton-years', -100, 0);
	setLuaSpriteScrollFactor('floating-island-gaming-in-the-clinton-years', 0.9, 0.9);
	
	addLuaSprite('floating-island-sky', false);
	addLuaSprite('floating-island-foliage', false);
	addLuaSprite('floating-island-back-hills', false);
	addLuaSprite('floating-island-trees', false);
	addLuaSprite('floating-island-front-hills', false);
	addLuaSprite('floating-island-gaming-in-the-clinton-years', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end