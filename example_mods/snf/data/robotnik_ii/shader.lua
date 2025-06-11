function onCreate()
initLuaShader('vhs')
makeLuaSprite('vhsshader')
makeGraphic('vhsshader', screenWidth, screenHeight)
setSpriteShader('vhsshader', 'vhs')

		runHaxeCode([[
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject('vhsshader').shader)]);
			game.camHUD.setFilters();
			game.camOther.setFilters();
		]])
end

function onUpdate()
setShaderFloat("vhsshader", 'iTime', os.clock())
end