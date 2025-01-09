local CAMxx = 0.75;
local CAMyy = 0.75;
local xx = 400;
local yy = 620;
local xx2 = 925;
local yy2 = 620;
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
	makeLuaSprite('MT BG', 'BG/mm/MT BG', -500, -110);
	scaleObject('MT BG', 0.9, 0.9);
	addLuaSprite('MT BG',false)

	makeLuaSprite('battle', 'BG/mm/battlefield', 450, -500);
	scaleObject('battle', 0.8, 0.8);
end

function onStepHit()
    if curStep == 256 then
    xx2 = 1225;
    xx = 1225;
    yy = 0;
	addLuaSprite('battle',false)
	removeLuaSprite('MT BG',false)
    setProperty('dad.y', 0)
    setProperty('dad.x', 1200)
end
    if curStep == 512 then
    xx2 = 925;
    xx = 400;
    yy = 620;
	addLuaSprite('MT BG',false)
	removeLuaSprite('battle',false)
end
    if curStep == 896 then
    xx2 = 1225;
    xx = 1225;
    yy = 0;
	addLuaSprite('battle',false)
	removeLuaSprite('MT BG',false)
    setProperty('dad.y', 0)
    setProperty('dad.x', 1200)
end
    if curStep == 1152 then
    xx2 = 925;
    xx = 400;
    yy = 620;
	addLuaSprite('MT BG',false)
	removeLuaSprite('battle',false)
end
    if curStep == 1280 then
    xx2 = 1225;
    xx = 1225;
    yy = 0;
	addLuaSprite('battle',false)
	removeLuaSprite('MT BG',false)
    setProperty('dad.y', 0)
    setProperty('dad.x', 1200)
end
    if curStep == 1408 then
    xx2 = 925;
    xx = 400;
    yy = 620;
	addLuaSprite('MT BG',false)
	removeLuaSprite('battle',false)
    end
end