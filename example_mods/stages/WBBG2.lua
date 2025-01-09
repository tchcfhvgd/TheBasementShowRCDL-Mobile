local CAMxx = 0.8;
local CAMyy = 0.8;
local xx = 330;
local yy = 700;
local xx2 = 1050;
local yy2 = 700;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;
local stopit = 'true'

function onUpdate()
if stopit == 'true' then
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
if stopit == 'false' or stopit == '' then
    if cameraPos == 'bf' then
        triggerEvent('Camera Follow Pos',xx2,yy2)
    elseif cameraPos == 'dad' then
        triggerEvent('Camera Follow Pos',xx,yy)
    end
end

    if localSpeed == 100 then
    ofs = 0
    else
    ofs = 30
    end
end

function onCreate()
	makeLuaSprite('WBBG2', 'BG/WB/WBBG2', -500, 70);
	scaleObject('WBBG2', 1.4, 1.4);
	addLuaSprite('WBBG2',false)

	makeLuaSprite('WBFG2', 'BG/WB/WBBG2 thing', -500, -220);
	setLuaSpriteScrollFactor('WBFG2', 0.75, 0.75);
	scaleObject('WBFG2', 1.4, 1.3);
	addLuaSprite('WBFG2',true)

	makeLuaSprite('R', 'BG/WB/rocket', 400, 150);
	setLuaSpriteScrollFactor('R', 1, 1);
	scaleObject('R', 0.7, 0.7);
	addLuaSprite('R',false)
end

function onEvent(stupid, v1, v2)
    if stupid == 'Camera Speed' then
        setProperty('cameraSpeed', v1)
        localSpeed = v1
    end
    
    if stupid== 'Cam Set Target' then
        cameraPos = v1
        stopit = v2
    end
end

function onStepHit()
    if curStep == 848 then
    xx = 700
    yy = 650
    end
    if curStep == 912 or curStep == 1296 then
    xx = 330
    yy = 700
    end
    if curStep == 1040 then
    xx = 750
    yy = 650
    end
end