local CAMxx = 0.75;
local CAMyy = 0.75;
local xx = 350;
local yy = 510;
local xx2 = 950;
local yy2 = 700;
local ofs = 25;
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
end
end

function onCreate()
	makeLuaSprite('alien', 'BG/alien', -600, 0);
	scaleObject('alien', 1, 1);
	addLuaSprite('alien',false)
end

function onCreatePost()
    if songName == 'Invade OLDER' then
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
    if songName == 'Invade OLDER' then
    setProperty('iconP1.origin.y',0)
    setProperty('iconP2.origin.y',0)
    setProperty('iconP1.origin.x',0)
    end
end