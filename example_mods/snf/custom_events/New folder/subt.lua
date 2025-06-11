function onCreate()
    makeLuaText("sub", "", 0, 100, 600)
    setTextSize("sub", 20)
    setObjectOrder("sub", 1)
    setObjectCamera("sub", "other")
    setScrollFactor("sub", 0.0, 0.0)
    setProperty("sub.y", screenHeight - 60)
    screenCenter("sub", 'x')
    addLuaText("sub")
    startTween("", "", null, 0.0, null)
end

function onEvent(name, value1, value2)
    if name == 'subt' then
        setProperty("sub.text", value1)
		if value2 == nil then
		setProperty("sub.color", getColorFromHex("FFFFFF"))
		else
        setProperty("sub.color", getColorFromHex(value2))
		end
        screenCenter("sub", 'x')
        setProperty("sub.scale.x", 1.1)
        doTweenX("subTween", "sub.scale", 1, 0.2, "circInOut")
        return Function_Stop
    end
    return Function_Continue
end