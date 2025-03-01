local CAMxx = 0.75;
local CAMyy = 0.75;
local xx = 360;
local yy = 290;
local xx2 = 950;
local yy2 = 490;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;
local chromaticShit = 0;
local shit1 = 2.2;
local shit2 = 20.0;
local invert = 0
local curNote = 0
local glitchCall = 0

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i) return from+(to-from)*i end

function setChrome(chromeOffset)
    setShaderFloat("Shader2", "rOffset", chromeOffset);
    setShaderFloat("Shader2", "gOffset", 0.0);
    setShaderFloat("Shader2", "bOffset", chromeOffset * -1);
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if getPropertyFromClass('ClientPrefs','shaders') then
    chromaticShit = chromaticShit + 0.007;
    if glitchCall == 1 then
    invert = math.random(0, 1)
    end
    curNote = noteData
    glitchCall = math.random(0, 1)
    end
end

function onUpdate(elapsed)
if getPropertyFromClass('ClientPrefs','shaders') then
    setShaderFloat("opponentStrums.members[0]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[1]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[2]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[3]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[0]", "SPEED", 0.3)
    setShaderFloat("opponentStrums.members[1]", "SPEED", 0.3)
    setShaderFloat("opponentStrums.members[2]", "SPEED", 0.3)
    setShaderFloat("opponentStrums.members[3]", "SPEED", 0.3)
    setShaderInt("opponentStrums.members["..curNote.."]", "invert", invert)

    setShaderFloat("Shader1", "iTime", os.clock())
    setShaderFloat("Shader2", "iTime", os.clock())
    setShaderFloat("Shader4", "iTime", os.clock())

    setShaderFloat("Shader3", "dim", shit1)
    setShaderFloat("Shader3", "size", shit2)


    setShaderFloat("iconP2", "iTime", os.clock())
    if getProperty('healthBar.percent') >= 81 then
        setShaderFloat("iconP2", "AMT", 1)
    else
        setShaderFloat("iconP2", "SPEED", 0.2)
        setShaderFloat("iconP2", "AMT", 0.2)
    end

	if (shadersEnabled) then
		chromaticShit = math.lerp(chromaticShit, 0, boundTo(elapsed * 20, 0, 1));
        shit1 = math.lerp(shit1, 2.2, boundTo(elapsed * 5.5, 0, 1));
        shit2 = math.lerp(shit2, 0, boundTo(elapsed * 5.5, 0, 1));
		setChrome(chromaticShit);
	end
end

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
    luaDebugMode = true
	makeLuaSprite('place', 'BG/Pibby/place', -600, -300);
	scaleObject('place', 1, 1);
	addLuaSprite('place', false);

	makeAnimatedLuaSprite('glitch','BG/Pibby/glitch',-550,-300)
	scaleObject('glitch', 1, 1);
	addAnimationByPrefix('glitch','glitch','glitch',24,true)
	addLuaSprite('glitch',false)

	makeAnimatedLuaSprite('glitch2','BG/Pibby/glitch2',400,200)
	scaleObject('glitch2', 1, 1);
	addAnimationByPrefix('glitch2','glitch2','glitch2',24,true)
	addLuaSprite('glitch2',false)

	makeAnimatedLuaSprite('glitch3','BG/Pibby/glitch3',-550,400)
	scaleObject('glitch3', 1, 1);
	addAnimationByPrefix('glitch3','glitch3','glitch3',24,true)
	addLuaSprite('glitch3',false)

	makeAnimatedLuaSprite('glitch4','BG/Pibby/glitch4',1150,600)
	scaleObject('glitch4', 1, 1);
	addAnimationByPrefix('glitch4','glitch4','glitch4',24,true)
	addLuaSprite('glitch4',false)

--fuck shader / high Quality

	if lowQuality then
	removeLuaSprite('glitch1',true)
	removeLuaSprite('glitch2',true)
	removeLuaSprite('glitch3',true)
	removeLuaSprite('glitch4',true)
end
end

function onCreatePost()
if getPropertyFromClass('ClientPrefs','shaders') then
    initLuaShader("Glitchy")

    setSpriteShader('iconP2', 'Glitchy')
    setShaderInt("iconP2", "invert", 0)

    setSpriteShader('opponentStrums.members[0]', 'Glitchy')
    setSpriteShader('opponentStrums.members[1]', 'Glitchy')
    setSpriteShader('opponentStrums.members[2]', 'Glitchy')
    setSpriteShader('opponentStrums.members[3]', 'Glitchy')
    for i=0,3 do
    setShaderFloat("opponentStrums.members["..i.."]", "AMT", 0.25)
    setShaderInt("opponentStrums.members["..i.."]", "invert", 0)
    end

    makeLuaSprite("Shader1")
    setSpriteShader("Shader1", "glitch")
    
    makeLuaSprite("Shader2")
    setSpriteShader("Shader2", "chromaticGlitch")

    if songName == 'Funny-Cartoon' then
    makeLuaSprite("Shader3")
    setSpriteShader("Shader3", "glow")
    end

    makeLuaSprite("Shader4")
    setSpriteShader("Shader4", "shit")
    setShaderFloat("Shader4", "blueOpac", 1.3);

    if songName == 'Funny-Cartoon' then
    runHaxeCode([[
    trace(ShaderFilter);
    
    if(ClientPrefs.OldTVShader)
    {
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
    
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
    }
    else
    {
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader3").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
    
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
    }
    ]])
    else
    runHaxeCode([[
    trace(ShaderFilter);
    
    if(ClientPrefs.OldTVShader)
    {
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
            
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
    }
    else
    {
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
            
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader4").shader)]);
    }
    ]])
    end
end
end

function onStepHit()
if getPropertyFromClass('ClientPrefs','shaders') then
    if invert == 1 then
      invert = 0
      for i=0,3 do
      setShaderInt("opponentStrums.members["..i.."]", "invert", 0)
      end
    end
end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('pibby','bounce',true)
    end
end

function onEvent(name,v1,v2)
if getPropertyFromClass('ClientPrefs','shaders') then
    if name == 'Low Light' and songName == 'Funny-Cartoon' then
    shit1 = 1.4
    shit2 = 80
    end
end
end