function onEvent(ev, val1, val2)
    if ev == "Notes Spin" then
        noteTweenAngle('notesSpin-0' + val1, 0, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-1' + val1, 1, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-2' + val1, 2, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-3' + val1, 3, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-4' + val1, 4, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-5' + val1, 5, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-6' + val1, 6, 360, 0.2, 'quadin');
        noteTweenAngle('notesSpin-7' + val1, 7, 360, 0.2, 'quadin');
    end
end