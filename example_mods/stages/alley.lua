local CAMxx = 0.85;
local CAMyy = 1;
local xx = 725;
local yy = 300;
local xx2 = 725;
local yy2 = 500;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
			setProperty('defaultCamZoom', CAMyy)	
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
			setProperty('defaultCamZoom', CAMxx)	
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
	makeLuaSprite('sky', 'BG/Alley/sky', -700, -110);
	setLuaSpriteScrollFactor('sky', 0.8, 0.8);
	scaleObject('sky', 0.9, 0.9);
	addLuaSprite('sky',false)

	makeLuaSprite('alley light', 'BG/Alley/alley light', -700, -110);
	setLuaSpriteScrollFactor('alley light', 0.9, 0.9);
	scaleObject('alley light', 0.9, 0.9);
	addLuaSprite('alley light',false)

	makeLuaSprite('alley BG', 'BG/Alley/alley BG', -700, -110);
	setLuaSpriteScrollFactor('alley BG', 1, 1);
	scaleObject('alley BG', 0.9, 0.9);
	addLuaSprite('alley BG',false)
end