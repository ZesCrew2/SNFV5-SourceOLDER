-- coded by @monoaether
-- for this to work i suggest you have zCameraFix placed within the scripts folder

function onEvent(GameAngleChange, value1, value2)
    cancelTween('anglechange')
    setProperty('camGame.angle', value1)
    startTween('anglechange', 'camGame', {angle = 0}, value2, {ease = 'expoOut'})
end