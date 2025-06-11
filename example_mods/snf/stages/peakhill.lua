function onCreate()
	-- background shit
	makeLuaSprite('ghz-sky', 'jokesky', -600, -250);
	setLuaSpriteScrollFactor('ghz-sky', 1.0, 1.0);
	scaleObject('ghz-sky', 0.8, 0.8);
	
	makeLuaSprite('ghz-back-mountains', 'jokemountains1', -600, -200);
	setLuaSpriteScrollFactor('ghz-back-mountains', 0.6, 0.8);
	scaleObject('ghz-back-mountains', 0.7, 0.7);
	
	makeLuaSprite('ghz-clouds', 'jokeclouds', -600, -200);
	setLuaSpriteScrollFactor('ghz-clouds', 0.3, 0.6);
	scaleObject('ghz-clouds', 0.7, 0.7);
	
	makeLuaSprite('ghz-mountains', 'jokemountains2', -600, -200);
	setLuaSpriteScrollFactor('ghz-mountains', 0.7, 0.8);
	scaleObject('ghz-mountains', 0.7, 0.7);
	
	makeLuaSprite('ghz-water-yum-yum', 'jokewater', -600, -200);
	setLuaSpriteScrollFactor('ghz-water-yum-yum', 0.8, 0.8);
	scaleObject('ghz-water-yum-yum', 0.7, 0.7);
	
	makeLuaSprite('ghz-hill-that-is-indeed-green', 'jokegrass', -600, 780);
	setLuaSpriteScrollFactor('ghz-hill-that-is-indeed-green', 0.9, 0.9);
	scaleObject('ghz-hill-that-is-indeed-green', 0.7, 0.7);
	
	addLuaSprite('ghz-sky', false);
	addLuaSprite('ghz-back-mountains', false);
	addLuaSprite('ghz-mountains', false);
	addLuaSprite('ghz-clouds', false);
	addLuaSprite('ghz-water-yum-yum', false);
	addLuaSprite('ghz-hill-that-is-indeed-green', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end