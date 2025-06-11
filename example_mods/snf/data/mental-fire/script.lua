-- events coded by @monoaether

function onCreate()
    setProperty('defaultCamZoom', 2.0)

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth, screenHeight, '000000')
    setObjectCamera('black', 'other')
    addLuaSprite('black', true)

    makeLuaSprite('white', '', 0, 0)
    makeGraphic('white', screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera('white', 'other')
    setProperty('white.alpha', 0)
    setObjectOrder('white', 15)
    addLuaSprite('white', true)

    makeLuaSprite('blackbg', '', -800, 0)
    makeGraphic('blackbg', 3000, 3000, '000000')
    setObjectOrder('blackbg', 3)
    setProperty('blackbg.alpha', 0)
    addLuaSprite('blackbg', true)

    makeLuaSprite('SpbarringUp', 'bar', -110, -850)
	setObjectCamera('SpbarringUp', 'HUD')
	addLuaSprite('SpbarringUp', true)
    setObjectOrder('SpbarringUp', 0)

    makeLuaSprite('SpbarringDown', 'bar', -110, 720)
	setObjectCamera('SpbarringDown', 'HUD')
	addLuaSprite('SpbarringDown', true)
    setObjectOrder('SpbarringDown', 0)

    makeLuaSprite('aliendealer', 'aliendealer', 0, 0)
    screenCenter('aliendealer', 'x')
    setObjectCamera('aliendealer', 'other')
    setObjectOrder('aliendealer', 10)
    setProperty('aliendealer.alpha', 0)
    scaleObject('aliendealer', 0.68, 0.68)
    addLuaSprite('aliendealer', true)
end

function onSongStart()
    startTween('opening', 'black', {alpha = 0}, 2, {ease = 'linear'})
    setProperty('aliendealer.x', getProperty('aliendealer.x')+120)
end

function onBeatHit()
    if curBeat == 32 then
        setProperty('white.alpha', 0.5)
        startTween('whitefade', 'white', {alpha = 0}, 1, {ease = 'linear'})
        startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') + 120}, 2, {ease = 'quintOut'})
        startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') - 120}, 2, {ease = 'quintOut'})
    end
    if curBeat == 160 then
        setProperty('white.alpha', 0.5)
        startTween('whitefade', 'white', {alpha = 0}, 1, {ease = 'linear'})
        startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') - 60}, 4, {ease = 'expoOut'})
        startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') + 60}, 4, {ease = 'expoOut'})
    end
    if curBeat == 224 then
        startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') + 60}, 4, {ease = 'expoOut'})
        startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') - 60}, 4, {ease = 'expoOut'})
    end
    if curBeat == 352 then
        setProperty('black.alpha', 1)
        setProperty('blackbg.alpha', 1)
        setProperty('dad.alpha', 0)
        setProperty('gf.alpha', 0)
        setProperty('boyfriend.alpha', 0)
        startTween('black', 'black', {alpha = 0}, 1, {ease = 'expoOut'})
        startTween('dad', 'dad', {alpha = 0.5}, 1, {ease = 'expoOut'})
        startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') - 120}, 2, {ease = 'quintOut'})
        startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') + 120}, 2, {ease = 'quintOut'})
    end
    if curBeat == 368 then
        startTween('dad', 'dad', {alpha = 0}, 1, {ease = 'expoOut'})
        startTween('bf', 'boyfriend', {alpha = 0.5}, 1, {ease = 'expoOut'})
    end
    if curBeat == 384 then
        startTween('blackbg', 'blackbg', {alpha = 0.7}, 1, {ease = 'expoOut'})
        startTween('dad', 'dad', {alpha = 0.5}, 1, {ease = 'expoOut'})
        startTween('bf', 'boyfriend', {alpha = 0}, 1, {ease = 'expoOut'})
    end
    if curBeat == 400 then
        startTween('dad', 'dad', {alpha = 0}, 1, {ease = 'expoOut'})
        startTween('bf', 'boyfriend', {alpha = 0.5}, 1, {ease = 'expoOut'})
    end
    if curBeat == 416 or curBeat == 424 then
        startTween('dad', 'dad', {alpha = 0.5}, 0.4, {ease = 'expoOut'})
        startTween('bf', 'boyfriend', {alpha = 0}, 0.4, {ease = 'expoOut'})
    end
    if curBeat == 420 or curBeat == 428 then
        startTween('dad', 'dad', {alpha = 0}, 0.4, {ease = 'expoOut'})
        startTween('bf', 'boyfriend', {alpha = 0.5}, 0.4, {ease = 'expoOut'})
    end
    if curBeat == 432 then
        startTween('dad', 'dad', {alpha = 0.5}, 0.4, {ease = 'expoOut'})
        startTween('bf', 'boyfriend', {alpha = 0.5}, 0.4, {ease = 'expoOut'})
    end
    if curBeat == 448 then
        setProperty('white.alpha', 1)
        setProperty('camHUD.alpha', 0)
        setProperty('dad.alpha', 0)
        setProperty('boyfriend.alpha', 0)
        setProperty('blackbg.alpha', 1)
        setProperty('aliendealer.alpha', 1)
        startTween('whitefade', 'white', {alpha = 0}, 1, {ease = 'linear'})
    end
end