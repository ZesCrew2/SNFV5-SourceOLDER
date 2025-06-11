local SpawnGodDamnit = false

function onEvent(name, value1, value2)
    if name == 'black&whiteShit' and value1 == 'start' and SpawnGodDamnit == false then
        makeLuaSprite('black', '', -500, -300)
        setScrollFactor('black', 0, 0)
        makeGraphic('black', 5000, 5000, '000000')
        addLuaSprite('black', false)
        setProperty('black.alpha', 0)
        scaleObject('black', 18, 22)
        doTweenAlpha('blackTween', 'black', 1, value2, 'linear')
        doTweenColor('BfTween', 'Boyfriend', 'FFFFFF', value2, 'linear')
        doTweenColor('DadTween', 'Dad', 'FFFFFF', value2, 'linear')
        doTweenColor('GfTween', 'Gf', 'FFFFFF', value2, 'linear')
        doTweenAlpha('HpBgTween', 'HealthBarBG', 0, value2, 'linear')
        doTweenAlpha('HpTween', 'HealthBar', 0, value2, 'linear')
        doTweenAlpha('ScrTween', 'scoreTxt', 0, value2, 'linear')
        doTweenAlpha('IconP1Tween', 'iconP1', 0, value2, 'linear')
        doTweenAlpha('IconP2Tween', 'iconP2', 0, value2, 'linear')
        SpawnGodDamnit = true
    end
    if name == 'black&whiteShit' and value1 == 'start' and SpawnGodDamnit == true then
        doTweenAlpha('blackTween', 'black', 1, value2, 'linear')
        doTweenColor('BfTween', 'Boyfriend', 'FFFFFF', value2, 'linear')
        doTweenColor('DadTween', 'Dad', 'FFFFFF', value2, 'linear')
        doTweenColor('GfTween', 'Gf', 'FFFFFF', value2, 'linear')
        doTweenAlpha('HpBgTween', 'HealthBarBG', 0, value2, 'linear')
        doTweenAlpha('HpTween', 'HealthBar', 0, value2, 'linear')
        doTweenAlpha('ScrTween', 'scoreTxt', 0, value2, 'linear')
        doTweenAlpha('IconP1Tween', 'iconP1', 0, value2, 'linear')
        doTweenAlpha('IconP2Tween', 'iconP2', 0, value2, 'linear')
    end
    if name == 'black&whiteShit' and value1 == 'stop' then
        doTweenAlpha('blackTween', 'black', 0, value2, 'linear')
        doTweenColor('BfTween', 'Boyfriend', 'FFFFFF', value2, 'linear')
        doTweenColor('DadTween', 'Dad', 'FFFFFF', value2, 'linear')
        doTweenColor('GfTween', 'Gf', 'FFFFFF', value2, 'linear')
        doTweenAlpha('HpBgTween', 'HealthBarBG', 0, value2, 'linear')
        doTweenAlpha('HpTween', 'HealthBar', 0, value2, 'linear')
        doTweenAlpha('ScrTween', 'scoreTxt', 0, value2, 'linear')
        doTweenAlpha('IconP1Tween', 'iconP1', 0, value2, 'linear')
        doTweenAlpha('IconP2Tween', 'iconP2', 0, value2, 'linear')
    end
end
