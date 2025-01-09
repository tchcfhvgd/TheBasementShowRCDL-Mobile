-- Script by Mr Sropical - MaxPlay Games
-- I Was Supposed To Source Code The Script BTW - Mrsropical

function opponentNoteHit(id, direction, noteType, isSustainNote)
    local dadCharacter = getProperty('dad.curCharacter')
    if dadCharacter == '45 tom 2' or
        dadCharacter == '45 tom chain' or
        dadCharacter == '45 tom' or
        dadCharacter == 'alien cat old' or
        dadCharacter == 'alien cat' or
        dadCharacter == 'alien mouse' or
        dadCharacter == 'Famished' or
        dadCharacter == 'freeze jerry rtx' or
        dadCharacter == 'freeze jerry' or
        dadCharacter == 'imp jerry' or
        dadCharacter == 'JewelleryHXA' or
        dadCharacter == 'JewelleryHXA2' or
        dadCharacter == 'Lightning OLD' or
        dadCharacter == 'Lightning' or
        dadCharacter == 'madness tom OLD' or
        dadCharacter == 'madness tom' or
        dadCharacter == 'MEME BOI-sans' or
        dadCharacter == 'mouse 3 dark' or
        dadCharacter == 'mouse 3 OLD' or
        dadCharacter == 'mouse 3 rtx' or
        dadCharacter == 'mouse 3' or
        dadCharacter == 'mouse angry 2' or
        dadCharacter == 'mouse angry OLD' or
        dadCharacter == 'mouse angry' or
        dadCharacter == 'pibby tom old' or
        dadCharacter == 'pibby tom' or
        dadCharacter == 'spike' or
        dadCharacter == 'SpikeEXE' or
        dadCharacter == 'TomEXE' or
        dadCharacter == 'tuffy2' or
        dadCharacter == 'TuffyEXE' or
        dadCharacter == 'WB tom 2' or
        dadCharacter == 'WB tom old' or
        dadCharacter == 'WB tom' then

        if getProperty('health') > 1 then
           if not isSustainNote then
           setProperty('health', getProperty('health') - 0.027)
           else
           setProperty('health', getProperty('health') - 0.027 / 3)
           end
        end
    end
end