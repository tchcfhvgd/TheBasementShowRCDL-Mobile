local CAMxx = 0.75;
local CAMyy = 0.75;
local xx = 365;
local yy = 280;
local xx2 = 365;
local yy2 = 280;
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
	makeLuaSprite('sus bg', 'BG/Sus/sus bg', -1300, -550);
	scaleObject('sus bg', 1.3, 1.3);
	addLuaSprite('sus bg', false);

	makeAnimatedLuaSprite('meme','BG/Sus/meme', -1150, 50)
	scaleObject('meme', 0.8, 0.8);
	addAnimationByPrefix('meme','meme','I', 24, true)
	addLuaSprite('meme',false)

	makeAnimatedLuaSprite('light','BG/Sus/light', 1150, 0)
	scaleObject('light', 0.9, 0.9);
	addAnimationByPrefix('light','light','I', 24, true)
	addLuaSprite('light',false)

	makeAnimatedLuaSprite('DOJ','BG/Sus/DOJ', 1530, 450)
	scaleObject('DOJ', 1.4, 1.4);
	addAnimationByPrefix('DOJ','DOJ','I', 24, true)
	addLuaSprite('DOJ',true)

	makeAnimatedLuaSprite('mucho','BG/Sus/mucho', -3500, 470)
	scaleObject('mucho', 1.2, 1.2);
	addAnimationByPrefix('mucho','mucho','I', 24, true)
	addLuaSprite('mucho', true)

	makeLuaSprite('alien', 'BG/Sus/alien', -1300, -530);
	scaleObject('alien', 1.3, 1.3);
	addLuaSprite('alien', true);

--ph2

	makeLuaSprite('d', 'BG/Sus/dojded', -1300, -530);
	scaleObject('d', 1.3, 1.3);
	addLuaSprite('d', true);

	makeLuaSprite('l', 'BG/Sus/lightded', -600, -450);
	scaleObject('l', 1.1, 1.1);
	addLuaSprite('l', false);

	makeLuaSprite('a', 'BG/Sus/aliended', -1300, -530);
	scaleObject('a', 1.3, 1.3);
	addLuaSprite('a', false);

	makeLuaSprite('m', 'BG/Sus/memeded', -1750, -300);
	scaleObject('m', 1.05, 1.05);
	addLuaSprite('m', false);

	makeAnimatedLuaSprite('tom','BG/Sus/tom', -750, -100)
	scaleObject('tom', 1.1, 1.1);
	addAnimationByPrefix('tom','tom','I', 24, true)
	addLuaSprite('tom', false)

	makeAnimatedLuaSprite('tuffy','BG/Sus/tuffy', 1100, 250)
	scaleObject('tuffy', 0.9, 0.9);
	addAnimationByPrefix('tuffy','tuffy','I', 24, true)
	setProperty('tuffy.flipX', true)
	addLuaSprite('tuffy',false)

	makeLuaSprite('shade', 'shade2', 0, 0)
	scaleObject('shade', 0.5, 0.5);
	setObjectCamera('shade', 'other')
	addLuaSprite('shade',true)

	setProperty('shade.alpha', 0)
	setProperty('tuffy.alpha', 0)
	setProperty('tom.alpha', 0)
	setProperty('d.alpha', 0)
	setProperty('l.alpha', 0)
	setProperty('a.alpha', 0)
	setProperty('m.alpha', 0)
end

function onBeatHit()
    if curBeat % 2 == 0 and curStep < 896 then
        objectPlayAnimation('meme','meme',true)
        objectPlayAnimation('DOJ','DOJ',true)
        objectPlayAnimation('light','light',true)
        objectPlayAnimation('mucho','mucho',true)
    end
    if curBeat % 2 == 0 and curStep > 896 then
        objectPlayAnimation('tom','tom',true)
        objectPlayAnimation('tuffy','tuffy',true)
    end
end


function onStepHit()
if curStep == 1 then
	doTweenX('mucho','mucho', 10000, 40, 'linear')
end
if curStep == 892 then
	doTweenAlpha('shade','shade', 1, 0.25,'linear')
end
if curStep == 896 then
	removeLuaSprite('mucho',true)
	removeLuaSprite('alien',true)
	removeLuaSprite('meme',true)
	removeLuaSprite('light',true)
	removeLuaSprite('DOJ',true)
--set shit
	setProperty('tuffy.alpha', 1)
	setProperty('tom.alpha', 1)
	setProperty('d.alpha', 1)
	setProperty('l.alpha', 1)
	setProperty('a.alpha', 1)
	setProperty('m.alpha', 1)
end
end