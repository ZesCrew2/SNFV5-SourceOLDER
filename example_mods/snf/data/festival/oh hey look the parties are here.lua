function onCreate()
makeAnimatedLuaSprite('bgfolk', 'bgfolkSONG2', -250, 250)
addAnimationByPrefix('bgfolk', 'dancey', 'bg dance', 24, true)
objectPlayAnimation('bgfolk', 'dancey')
scaleObject('bgfolk', 1.7, 1.7)
addLuaSprite('bgfolk', false)
setLuaSpriteScrollFactor('bgfolk', 0.9, 0.9);

makeAnimatedLuaSprite('fgfolk', 'fgfolkSONG2', -150, 750)
addAnimationByPrefix('fgfolk', 'dancey', 'fg dance', 24, true)
objectPlayAnimation('fgfolk', 'dancey')
scaleObject('fgfolk', 1.5, 1.5)
addLuaSprite('fgfolk', true)
setLuaSpriteScrollFactor('fgfolk', 0.8, 0.8);

close(true);
end