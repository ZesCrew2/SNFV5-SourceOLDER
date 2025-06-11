function onCreate()
	makeLuaSprite('BG', 'community-service/CsStageBG', -500, -250);
	
	makeLuaSprite('FG', 'community-service/CsStageFG', -500, -250);
	setScrollFactor('FG', 0.9, 0.9)
	scaleObject('FG', 1.0, 1.0);

	addLuaSprite('BG', false);
	addLuaSprite('FG', true);
	
end
function onCreatePost()
    setProperty('camGame.scroll.y', 1200)
    setProperty('camFollowPos.y', 1200)
    setProperty('camFollow.y', 1200)

    setProperty('camGame.scroll.x', 2000)
    setProperty('camFollowPos.x', 2000)
    setProperty('camFollow.x', 2000)
end