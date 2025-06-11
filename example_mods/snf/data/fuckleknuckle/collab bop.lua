switchDirectionLogo = 1

function onCreate()
	if not downscroll then
	makeLuaSprite('collabBop', 'snf-collab-logo', 915, 550)
	else
	makeLuaSprite('collabBop', 'snf-collab-logo', 915, 10)
	end
	setObjectCamera('collabBop', "camOther")
	scaleObject('collabBop', 0.3, 0.3)
	addLuaSprite('collabBop', true)
end

function danceLogo()
	if switchDirectionLogo == 1 then
	setProperty('collabBop.angle', 2)
	setProperty('collabBop.scale.x', 0.32)
	setProperty('collabBop.scale.y', 0.32)
	doTweenAngle("bopping", 'collabBop', 0, 0.5, 'cubeOut')
	doTweenX("bopping2", 'collabBop.scale', 0.3, 0.5, 'cubeOut')
	doTweenY("bopping3", 'collabBop.scale', 0.3, 0.5, 'cubeOut')
	switchDirectionLogo = switchDirectionLogo+1
	elseif switchDirectionLogo == 2 then
	setProperty('collabBop.angle', -2)
	setProperty('collabBop.scale.x', 0.32)
	setProperty('collabBop.scale.y', 0.32)
	doTweenAngle("bopping", 'collabBop', 0, 0.5, 'cubeOut')
	doTweenX("bopping2", 'collabBop.scale', 0.3, 0.5, 'cubeOut')
	doTweenY("bopping3", 'collabBop.scale', 0.3, 0.5, 'cubeOut')
	switchDirectionLogo = switchDirectionLogo+1
	else
	switchDirectionLogo = 0
	switchDirectionLogo = switchDirectionLogo+1
	danceLogo()
	end
end

function onBeatHit()
danceLogo()
end