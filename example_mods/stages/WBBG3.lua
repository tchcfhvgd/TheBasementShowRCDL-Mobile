local CAMxx = 0.8;
local CAMyy = 0.8;
local xx = 400;
local yy = 600;
local xx2 = 1050;
local yy2 = 700;
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

	makeLuaSprite('WBTOMDEAD', 'BG/WB/wbtomfuckingdies', -500, 250);
	setLuaSpriteScrollFactor('WBTOMDEAD', 1, 1);
	scaleObject('WBTOMDEAD', 0.7, 0.7);
	addLuaSprite('WBTOMDEAD',false)

	makeLuaSprite('shade', 'shade2', 0, 0)
	scaleObject('shade', 0.5, 0.5);
	setObjectCamera('shade', 'other')
	addLuaSprite('shade',true)

--fuck shader / high Quality

	if lowQuality then
	removeLuaSprite('shade',true)
end
end