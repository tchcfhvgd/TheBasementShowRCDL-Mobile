function onCreate()
    makeAnimatedLuaSprite('staticinanutshell', 'Phase3Static', 0, 0)
    addAnimationByPrefix('staticinanutshell', 'gay', 'Phase3Static instance 1', 24, false)
    setGraphicSize('staticinanutshell', getProperty('staticinanutshell.width') * 4)
    setProperty('staticinanutshell.alpha', 0.3)
    setProperty('staticinanutshell.visible', false)
    addLuaSprite('staticinanutshell', true)
    setObjectCamera('staticinanutshell', 'other')
end

function onSongStart()
    setProperty('staticinanutshell.visible', true)
end

function onEvent(name)
    if name == 'SonicStatic' then
        objectPlayAnimation('staticinanutshell', 'gay', true)
    end
end

function onUpdate(elapsed)
    if getProperty('staticinanutshell.animation.curAnim.finished') and getProperty('staticinanutshell.animation.curAnim.name') == 'gay' then
        setProperty('staticinanutshell.alpha', 0)
    else
        setProperty('staticinanutshell.alpha', 0.7)
    end
end