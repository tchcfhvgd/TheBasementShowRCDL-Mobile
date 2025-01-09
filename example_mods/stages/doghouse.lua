local CAMxx = 0.8;
local CAMyy = 0.8;
local xx = 450;
local yy = 600;
local xx2 = 1000;
local yy2 = 600;
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
--house
	makeLuaSprite('doghouse', 'BG/Spike/doghouse', -400, -580);
	scaleObject('doghouse', 1.1, 1.1);
	addLuaSprite('doghouse',false)
--house 2
	makeLuaSprite('doghouse2', 'BG/Spike/doghouse2', -400, -580);
	scaleObject('doghouse2', 1.1, 1.1);
	addLuaSprite('doghouse2',false)
--tree
	makeLuaSprite('tree', 'BG/Spike/tree', -400, -580);
	setLuaSpriteScrollFactor('tree', 1.1, 1.1);
	scaleObject('tree', 1.1, 1.1);
	addLuaSprite('tree',true)
--cup
	makeAnimatedLuaSprite('CUpheqdshidA','CUpheqdshidA', 0, 0)
	setObjectCamera('CUpheqdshidA', 'camOther')
	scaleObject('CUpheqdshidA', 1, 1);
	addAnimationByPrefix('CUpheqdshidA','CUpheqdshid','CUpheqdshid',24,true)
	addLuaSprite('CUpheqdshidA',true)
--shade
	makeLuaSprite('shade', 'shade2', 0, 0)
	scaleObject('shade', 0.5, 0.5);
	setObjectCamera('shade', 'other')
	addLuaSprite('shade',true)

--fuck shader / high Quality

	if lowQuality then
	removeLuaSprite('CUpheqdshidA',true)
	removeLuaSprite('shade',true)
	removeLuaSprite('tree',true)
end
end