function onCreate() -- backwards compatibility
    runHaxeCode([[
        for (note in game.unspawnNotes)
        {
            if (note.noteType == 'plr3')
            {
                note.noteType == 'Third Player Note';
		note.noteData += 4;
		note.mustPress = false;
                note.noAnimation = true;
            }
        }
    ]])
end

function goodNoteHit()
    if type == 'plr3' then
		characterPlayAnim('gf', getProperty('singAnimations')[math.abs(dir)+1], true)
            setProperty('gf.holdTimer',0)
    end
end