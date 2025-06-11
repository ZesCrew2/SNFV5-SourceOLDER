function onCreate()
	makeLuaSprite('sky', 'ship/sky', -500, -600);
	setScrollFactor('sky', 1.0, 1.0);
	
	makeLuaSprite('water', 'ship/water', -500, -300);
	setScrollFactor('water', 1.0, 1.0);
	scaleObject('water', 1.0, 1.0);
	doTweenY('waterY', 'water', getProperty('water.y') + getRandomFloat(100, 200), getRandomInt(2, 3), 'quintInOut')

	makeLuaSprite('ship', 'ship/ship', -500, -300);
	setScrollFactor('ship', 1.0, 1.0);
	scaleObject('ship', 1.0, 1.0);

	makeAnimatedLuaSprite('BBFucks','ship/BBFucks',50, 630)
	addAnimationByPrefix('BBFucks','dance','Idle',24,false)
    objectPlayAnimation('BBFucks','dance',false)
    setScrollFactor('BBFucks', 1.0, 1.0);
	scaleObject('BBFucks', 1.0, 1.0);

	addLuaSprite('sky', false);
	addLuaSprite('water', false);
	addLuaSprite('ship', false);
	addLuaSprite('BBFucks', false);

	
end
function onCreatePost()
    setProperty('camGame.scroll.y', 1000)
    setProperty('camFollowPos.y', 1000)
    setProperty('camFollow.y', 1000)

    setProperty('camGame.scroll.x', 2000)
    setProperty('camFollowPos.x', 2000)
    setProperty('camFollow.x', 2000)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		playAnim('BBFucks', 'dance', true)
	end
  end

function onCountdownTick()
    playAnim('BBFucks', 'dance', true)
end

function onTweenCompleted(tag, vars)
	if tag == 'waterY' then
		if getProperty('water.y') ~= -300 then
			doTweenY('waterY', 'water', -300, getRandomInt(2, 3), 'quintInOut')
		else
			doTweenY('waterY', 'water', getProperty('water.y') + getRandomFloat(100, 200), getRandomInt(2, 3), 'quintInOut')
		end
	end
end