local CAMxx = 0.8;
local CAMyy = 0.8;
local xx = 330;
local yy = 500;
local xx2 = 710;
local yy2 = 500;
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
if getProperty('girlfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('girlfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('girlfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('girlfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('girlfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    end
    
end

function onCreate()
--BG1
	makeLuaSprite('Dside', 'BG/Dside', -500, -120);
	scaleObject('Dside', 0.8, 0.8);
	addLuaSprite('Dside',false)
--BG2
	makeAnimatedLuaSprite('fire','BG/DOJ/fire',-500, -270);
	scaleObject('fire', 0.9, 0.95);
	addAnimationByPrefix('fire','fire','fire',24,true)
	addLuaSprite('fire',false)
--BG3
	makeLuaSprite('doghouse', 'BG/Spike/doghouse2', -600, -650);
	scaleObject('doghouse', 1.1, 1.1);
	addLuaSprite('doghouse',false)

	makeLuaSprite('tree', 'BG/Spike/tree', -600, -650);
	setLuaSpriteScrollFactor('tree', 1.1, 1.1);
	scaleObject('tree', 1.1, 1.1);
	addLuaSprite('tree',true)
--BG4
	makeLuaSprite('MT BG', 'BG/mm/MT BG', -550, -255);
	scaleObject('MT BG', 0.9, 0.9);
	addLuaSprite('MT BG',false)
--BG5
	makeLuaSprite('WBBG2', 'BG/WB/WBBG2', -580, 0);
	scaleObject('WBBG2', 1.3, 1.3);
	addLuaSprite('WBBG2',false)

	makeLuaSprite('WBFG2', 'BG/WB/WBBG2 thing', -580, -400);
	setLuaSpriteScrollFactor('WBFG2', 0.75, 0.75);
	scaleObject('WBFG2', 1.3, 1.3);
	addLuaSprite('WBFG2',true)

	makeLuaSprite('R', 'BG/WB/rocket', 380, 0);
	scaleObject('R', 0.7, 0.7);
	addLuaSprite('R',false)
--BG6
	makeLuaSprite('basement', 'BG/Base/basement', -800, -450);
	scaleObject('basement', 1.1, 1.1);
	addLuaSprite('basement',false)
--2 to 6 are gone
	setProperty('fire.alpha', 0)
	setProperty('doghouse.alpha', 0)
	setProperty('tree.alpha', 0)
	setProperty('MT BG.alpha', 0)
	setProperty('WBBG2.alpha', 0)
	setProperty('WBFG2.alpha', 0)
	setProperty('R.alpha', 0)
	setProperty('basement.alpha', 0)
end