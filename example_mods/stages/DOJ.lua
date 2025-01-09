local xx = 390;
local yy = 450;
local xx2 = 910;
local yy2 = 450;
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
	makeLuaSprite('wall', 'BG/DOJ/wall', -500, -200);
	scaleObject('wall', 0.9, 0.9);
	addLuaSprite('wall',false)

	makeLuaSprite('ground', 'BG/DOJ/ground', -500, -200);
	scaleObject('ground', 0.9, 0.9);
	addLuaSprite('ground',false)

	makeLuaSprite('cheese', 'BG/DOJ/cheese', -500, -350);
	scaleObject('cheese', 0.9, 0.9);
	addLuaSprite('cheese',false)

	makeAnimatedLuaSprite('fire','BG/DOJ/fire',-500, -200);
	scaleObject('fire', 0.9, 0.95);
	addAnimationByPrefix('fire','fire','fire',24,true)
	addLuaSprite('fire',false)

	makeLuaSprite('empty', 'BG/DOJ/empty', -475, -500);
	scaleObject('empty', 1.1, 1);
	addLuaSprite('empty',false)

	makeLuaSprite('DOJdead', 'BG/DOJ/DOJfuckingdies', 500, 600);
	scaleObject('DOJdead', 0.55, 0.55);
	addLuaSprite('DOJdead',false)

--bye bye
	setProperty('gfGroup.visible',false)
	setProperty('fire.alpha', 0)
	setProperty('DOJdead.alpha', 0)
	setProperty('empty.alpha', 0)
end