local po = -75

function onCreatePost()
    setProperty('timeBar.y',-125)
    setProperty('timeTxt.y',-133)
    setProperty('healthBar.y',800)
    setProperty('scoreTxt.y',850)
    setProperty('iconP2.y',725)
    setProperty('iconP1.y',725)

    if downscroll then
        setProperty('timeBar.y',825)
        setProperty('timeTxt.y',817)
        setProperty('healthBar.y' ,-75)
        setProperty('scoreTxt.y',-25)
        setProperty('iconP2.y',-150)
        setProperty('iconP1.y',-150)
    end

    --Notes

    makeLuaSprite('borderL', 'aspect',0,0)
    addLuaSprite('borderL', false)
    setObjectCamera("borderL", "other")

    if downscroll then
        po = 700
    end
    for i = 0,3 do 
        setPropertyFromGroup('playerStrums',i,'y',po)
        setPropertyFromGroup('opponentStrums',i,'y',po)
    end
end



function onUpdatePost(elapsed)
    setProperty('camHUD.zoom',0.7)
end