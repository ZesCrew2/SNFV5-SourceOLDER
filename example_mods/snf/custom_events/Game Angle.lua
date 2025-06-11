local ogGameAngle = 0;

function onCreate()
    ogGameAngle = getProperty('camGame.angle');
end

function onEvent(ev, val1, val2)
    if ev == 'Game Angle' then
        doTweenAngle('camGameAngleEvent', 'camGame', ogGameAngle + val1, crochet / 1000, 'circout');
    end
end