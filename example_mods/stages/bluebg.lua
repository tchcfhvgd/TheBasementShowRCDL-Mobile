local CAMxx = 0.7;
local CAMyy = 0.7;
local xx = 450;
local yy = 700;
local xx2 = 1000;
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
	makeLuaSprite('blue', 'BG/Sad/blue', -500, -10);
	scaleObject('blue', 1, 1);
	addLuaSprite('blue',false)
--nogf haha
	setProperty('gfGroup.visible',false)

	makeAnimatedLuaSprite('NewRAINLayer01','NewRAINLayer01', -50000,0)
	addAnimationByPrefix('NewRAINLayer01','RainFirstlayer instance','RainFirstlayer instance',24,true)
	scaleObject('NewRAINLayer01', 1.25, 1.25);
	setObjectOrder('CUpheqdshidA', 4)
	addLuaSprite('NewRAINLayer01',true)

 
end

function onCreatePost() 
	for i=0, getProperty('unspawnNotes.length') do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress')
        and not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
           setPropertyFromGroup('unspawnNotes', i, 'multSpeed', getRandomFloat(0.2, 1.2))
        end
     end
end

function onUpdatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Randomspeed' then
			setPropertyFromGroup("unspawnNotes", i, "multSpeed", math.random(80,120)/100)
		end
	end
end