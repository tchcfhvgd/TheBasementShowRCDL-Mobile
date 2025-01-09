local CAMxx = 0.85;
local CAMyy = 0.85;
local xx = 575;
local yy = 650;
local xx2 = 900;
local yy2 = 650;
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
	makeAnimatedLuaSprite('snowing','BG/cold/snowy',-370,-200)
	scaleObject('snowing', 1.8, 1.5);
	addAnimationByPrefix('snowing','BG/cold/snowy','snow',20,true)
	addLuaSprite('snowing',true)

	makeLuaSprite('back', 'BG/cold/freezebg back', -200, 150)
	scaleObject('back', 1.48, 1.48)
	setScrollFactor('back',0.8,1.0)
	addLuaSprite('back',false)

	makeLuaSprite('front', 'BG/cold/freezebg front', -200, 150)
	scaleObject('front', 1.48, 1.48)
	addLuaSprite('front',false)

	makeLuaSprite('shade', 'shade2', 0, 0)
	scaleObject('shade', 0.5, 0.5);
	setObjectCamera('shade', 'other')
	addLuaSprite('shade',true)

    --fuck shader / high Quality

	if lowQuality then
	removeLuaSprite('1',true)
end
end

function onCreatePost()
	setProperty('defaultCamZoom', CAMyy)
	local size = 0.8
	setProperty('boyfriend.scale.x', size)
	setProperty('boyfriend.scale.y', size)
end

function onUpdatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'snow' and not getPropertyFromClass('ClientPrefs','mechanicsOn') then
            removeFromGroup('unspawnNotes', i, true)
        end
    end
end