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

function onUpdate(elapsed)
    setShaderFloat('Shader1', 'iTime', os.clock() - 2)
    setShaderFloat('Shader2', 'iTime', os.clock())
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
	makeLuaSprite('blue2', 'BG/Sad/blue2', -500, -10);
	scaleObject('blue2', 1, 1);
	addLuaSprite('blue2',false)
--mem BG
	makeAnimatedLuaSprite('memory','BG/Sad/memorybg', -30000, 255)
	scaleObject('memory', 0.6, 0.6);
	addAnimationByPrefix('memory','memory','bg',24,true)
	addLuaSprite('memory',false)
--nogf haha
	setProperty('gfGroup.visible',false)

 
end

function onCreatePost() 
	for i=0, getProperty('unspawnNotes.length') do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') and
        not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
           setPropertyFromGroup('unspawnNotes', i, 'multSpeed', getRandomFloat(0.2, 1.2))
        end
     end

     if shadersEnabled then -- so it won't give you a black screen (same for snow thing)
        makeLuaSprite("Shader1")
        setSpriteShader("Shader1", "rain")
        setShaderFloat('Shader1', 'iTimescale', 0.7)
        setShaderFloat('Shader1', 'iIntensity', 0.06)
    
        makeLuaSprite("Shader2")
        setSpriteShader("Shader2", "shit")
        setShaderFloat('Shader2', 'blueOpac', 0)
        
        runHaxeCode([[
        trace(ShaderFilter);
        
        if(ClientPrefs.OldTVShader)
        {
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);
    
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader2").shader)]);
        }
        else
        {
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader)]);
        }
        ]])
    end
end

function onStepHit()
    if curStep == 512 then
    setShaderFloat('Shader1', 'iIntensity', 0.0000000000006)
    end
end