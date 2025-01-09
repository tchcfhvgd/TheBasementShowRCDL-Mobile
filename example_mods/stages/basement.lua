local xx = 420;
local yy = 550;
local xx2 = 850;
local yy2 = 550;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function onCreate()
	mechsOn = getPropertyFromClass('ClientPrefs','mechanicsOn')
	makeLuaSprite('basement', 'BG/Base/basement', -800, -450);
	scaleObject('basement', 1.1, 1.1);
	addLuaSprite('basement',false)
end

function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'knife' and not mechsOn then
			removeFromGroup('unspawnNotes', i, true)
		end
    end
    if songName == 'Vanishing OLD' or
       songName == 'House for Sale OLD' then
        setTextFont('scoreTxt', 'VCRREAL.ttf')
        setTextSize('scoreTxt', 20)
        setTextFont('timeTxt', 'VCRREAL.ttf')
        setTextFont('botplayTxt', 'VCRREAL.ttf')
        setTextFont('judjTxt', 'VCRREAL.ttf')

        for i = 0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', i, 'texture', 'oldNotesThing')
          end
          for i = 0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'texture', 'oldNotesThing')
          end
    end
end

function onUpdatePost(elapsed)
    if songName == 'Vanishing OLD' or
       songName == 'House for Sale OLD' then
    setProperty('iconP1.origin.y',0)
    setProperty('iconP2.origin.y',0)
    setProperty('iconP1.origin.x',0)
    end
end

function onStepHit()
if songName == 'Evaporate' then
    if curStep == 768 then
        xx2 = xx2 + 100
    end
    if curStep == 1016 then
        xx2 = xx2 - 100
    end
end
end