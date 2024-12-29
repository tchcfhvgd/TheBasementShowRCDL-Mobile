function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'butch-death'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'lmao'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end

function onSongStart()
    changeColorsBar()
end

function onEvent(nig, shit1, shit2)
    if nig == 'Change Character' then
        changeColorsBar()
    end
end

function changeColorsBar()    
    local dadColR = getProperty('dad.healthColorArray[0]')
    local dadColG = getProperty('dad.healthColorArray[1]')
    local dadColB = getProperty('dad.healthColorArray[2]')

    local newColorname = string.format('%02x%02x%02x', dadColR, dadColG, dadColB)

    setProperty('timeBar.color', getColorFromHex(newColorname))
end