-- HEY NO TOUCHIE, i had a hard enough time getting this working in the first place
-- events coded by @monoaether

function onCreate()
    setProperty('defaultCamZoom', 2.0)

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth, screenHeight, '000000')
    setObjectCamera('black', 'other')
    setObjectOrder('black', getObjectOrder('healthBar')+100)
    addLuaSprite('black', true)

    makeLuaSprite('blackbg', '', -800, 0)
    makeGraphic('blackbg', 3000, 3000, '000000')
    setObjectOrder('blackbg', 8)
    setProperty('blackbg.alpha', 0)
    addLuaSprite('blackbg', true)
end

function onSongStart()
    startTween('opening', 'black', {alpha = 0}, 6, {ease = 'linear'})
end

function onBeatHit()
    if curBeat == 208 or curBeat == 272 then
        startTween('fade', 'blackbg', {alpha = 0.5}, 2, {ease = 'quintOut'})
    end
    if curBeat == 224 then
        startTween('fadepart2', 'blackbg', {alpha = 0}, 2, {ease = 'quintOut'})
    end
    if curBeat == 288 then
        setProperty('cameraSpeed', 0.3)
        startTween('fadepart3', 'blackbg', {alpha = 0}, 6, {ease = 'quintOut'})
    end
    if curBeat == 304 then
        startTween('ending', 'black', {alpha = 1}, 6, {ease = 'quintIn'})
    end
end