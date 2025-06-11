-- This can work on specific song if you just place it in the song's data folder instead of script


function onCreate()
    addLuaScript('loadscripts/notefadecontrol')
    

    -- Icon in the image folder, do not write .png, just the name. Also I only tested it with 200x200 so not sure if it works with another image resolution

    local iconName = "icon16X"
    
    addHaxeLibrary("Application", "lime.app")
    addHaxeLibrary("Image", "lime.graphics")
    
    local haxeCode = string.format([[
        var icon:Image = Image.fromFile(Paths.modFolders("images/%s.png"));
        Application.current.window.setIcon(icon);
    ]], iconName)
    runHaxeCode(haxeCode)
    

    -- Set the window title write whatever you want

    setPropertyFromClass("openfl.Lib", "application.window.title", "Sonic Night Funkin' V5.0")
end