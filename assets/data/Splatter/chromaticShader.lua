local chromFreq = 4
local chromAmount = 0
chromatic = 0.001
local enabled = false
local activated = false
local sizeySize = 11
function onCreate()
    enabledShader = getPropertyFromClass('ClientPrefs','shaders')
end
function onCreatePost()
    --ChromaticZoom
        initLuaShader('ChromaticAbberation')

        makeLuaSprite('chromToggle')
        makeLuaSprite('chromGraphic')
        makeGraphic("chromGraphic", screenWidth, screenHeight)

        makeLuaSprite("Shader2")
        setSpriteShader("Shader2", "shit")
        setShaderFloat("Shader2", "blueOpac", 1.3)

        makeLuaSprite("Shader3")
        setSpriteShader("Shader3", "pixel")
        setShaderFloat("Shader3", "pxSize", sizeySize)
        
        setSpriteShader("chromGraphic", 'chromToggle')

        makeLuaSprite('chromX',nil,0.1,0.1)
        setProperty('chromX.y',0.1)
        chromToggle()
    end

function onUpdate()
    setShaderFloat("Shader2", "iTime", os.clock())
    if enabled then
        local chromValue = getProperty('chromX.y')
        setShaderFloat('chromToggle', "amount", chromValue)
        if chromAmount == 0 and chromValue == 0 then
            enabled = false
        end
    end
end
function onBeatHit()
    if activated and curBeat % chromFreq == 0 then
        chromBeat()
    end
    if curBeat == 4 then
        runHaxeCode([[
            var chromToggle = game.createRuntimeShader('ChromaticAbberation');
            var shaderVcr= game.createRuntimeShader('glitchChromatic');
            
            game.camGame.setFilters([new ShaderFilter(chromToggle),new ShaderFilter(game.getLuaObject("Shader2").shader)]);
            game.camHUD.setFilters([new ShaderFilter(chromToggle),new ShaderFilter(game.getLuaObject("Shader2").shader)]);
            game.getLuaObject('chromToggle').shader = chromToggle;
            game.getLuaObject("temporaryShader1").shader = shaderVcr;
                
        ]]
    )
    end
    if curBeat == 36 then
        triggerEvent('Show Strums', 'True', 'middle')
    end
end

function onEvent(name,v1,v2)
if name =='Add Camera Zoom' then
chromBeat()
end
if name == 'lyrics' then
    sizeySize = sizeySize - 2
    setShaderFloat("Shader3", "pxSize", sizeySize)
end
end

function onTweenCompleted(tag)
--zoomBeat
    if tag == 'chromLol' then
        setProperty('chromX.y',0)
    end
    
end

function chromBeat()
    setProperty('chromX.y',chromAmount)
    doTweenY('chromLol','chromX',0,(stepCrochet /1000) * 8, 'quadOut')
    enabled = true
end

function chromToggle()
    runHaxeCode([[
            var chromToggle = game.createRuntimeShader('ChromaticAbberation');
            var shaderVcr= game.createRuntimeShader('glitchChromatic');
            
            game.camGame.setFilters([new ShaderFilter(chromToggle),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
            game.camHUD.setFilters([new ShaderFilter(chromToggle),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
            game.getLuaObject('chromToggle').shader = chromToggle;
            game.getLuaObject("temporaryShader1").shader = shaderVcr;
                
        ]]
    )
    activated = true
end

function onStepHit()
    --ChromaticZoom
	if curStep == 1296 then
        chromAmount = 0.8
    end
	if curStep == 2064 then
        chromAmount = 0
    end
end