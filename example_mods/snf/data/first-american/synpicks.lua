function onCreate()
makeLuaText('congrats', "Congrats, you found a", 1280, 725, 175);
setTextSize('congrats', 27);
setTextAlignment('congrats', 'right')
setTextWidth('congrats', '1280')
addLuaText('congrats');
setObjectCamera('congrats', 'camHUD');

makeLuaText('syn pick', "Syn's Pick!", 1280, 725, 175);
setTextSize('syn pick', 27);
setTextAlignment('syn pick', 'right')
setTextWidth('syn pick', '1280')
setProperty('syn pick.color', getColorFromHex('006FFF'))
addLuaText('syn pick');
setObjectCamera('syn pick', 'camHUD');

makeLuaText('syn pick2', "\n\n\n\nThis means you're playing one\nof Syn's favorite charted songs. Good luck!", 1280, 725, 175);
setTextSize('syn pick2', 27);
setTextAlignment('syn pick2', 'right')
setTextWidth('syn pick2', '1280')
addLuaText('syn pick2');
setObjectCamera('syn pick2', 'camHUD');

makeAnimatedLuaSprite('synHi', 'synWaving', 1000+725, 180);
addAnimationByPrefix('synHi', 'hiiiii :3', 'hellohi', 24, true);
playAnim('synHi', 'hiiiii :3');
scaleObject('synHi', 0.3, 0.3);
setObjectCamera('synHi', 'camHUD');
addLuaSprite('synHi', false);
end

function onUpdate()
setProperty('congrats.x', getProperty('syn pick.x')-150)
end

function onSongStart()
doTweenX("no way wow it's not the credits itself!!", 'congrats', 0, 1, 'sineInOut')
doTweenX("no way wow it's not the credits itself 0!!", 'syn pick', 0, 1, 'sineInOut')
doTweenX("no way wow it's not the credits itself 1!!", 'syn pick2', 0, 1, 'sineInOut')
doTweenX("no way wow it's not the credits itself 2!!", 'synHi', 1000, 1, 'sineInOut')
runTimer('bye goober', 6)
end

function onTimerCompleted(tag)
	if tag == 'bye goober' then
	doTweenX("no way wow it's not the credits itself!!", 'congrats', 725, 1, 'sineInOut')
	doTweenX("no way wow it's not the credits itself 0!!", 'syn pick', 725, 1, 'sineInOut')
	doTweenX("no way wow it's not the credits itself 1!!", 'syn pick2', 725, 1, 'sineInOut')
	doTweenX("no way wow it's not the credits itself 2!!", 'synHi', 1725, 1, 'sineInOut')
	end
end