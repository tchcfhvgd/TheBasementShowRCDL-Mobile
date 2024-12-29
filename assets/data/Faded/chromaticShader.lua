local chromFreq = 4
local chromAmount = 0.2
chromatic = 0.001
local enabled = true
local activated = false
function onCreate()
    enabledShader = getPropertyFromClass('ClientPrefs','shaders')
end
function onStepHit()
    --ChromaticZoom
	if curStep == 1152 then
        initLuaShader('ChromaticAbberationHUD')

        makeLuaSprite('chromToggle')
        setProperty('chromToggle.flipX',true)
        makeLuaSprite('chromGraphic')
        makeGraphic("chromGraphic", screenWidth+ 100, screenHeight)
        setProperty('chromGraphic.flipX',true)
        
        setSpriteShader("chromGraphic", 'chromToggle')

        makeLuaSprite('chromX',nil,0.1,0.1)
        setProperty('chromX.x',0.1)
        chromToggle()
    end
end

function onUpdate()
    if enabled then
        local chromValue = getProperty('chromX.x')
        setShaderFloat('chromToggle', "amount", chromValue)
        chromAmount = 0.4
        if chromAmount == 0 and chromValue == 0 then
            enabled = false
        end
    end
end
function onBeatHit()
    if activated and curBeat % chromFreq == 0 then
        chromBeat()
    end
end

function onEvent(name,v1,v2)
if name =='Add Camera Zoom' then
chromBeat()
end

if name == 'Change Chrom Amouth' then
chromAmount = v1
end
end

function onTweenCompleted(tag)
--zoomBeat
    if tag == 'chromLol' then
        setProperty('chromX.x',0.1)
    end
    
end

function chromBeat()
    setProperty('chromX.x',chromAmount)
    doTweenX('chromLol','chromX',0.1,0.5,'linear')
    enabled = true
end

function chromToggle()
    runHaxeCode([[
            var chromToggle = game.createRuntimeShader('ChromaticAbberationHUD');
            var shaderVcr= game.createRuntimeShader('glitchChromatic');
            
            game.camGame.setFilters([new ShaderFilter(shaderVcr),new ShaderFilter(chromToggle)]);
            game.camHUD.setFilters([new ShaderFilter(shaderVcr),new ShaderFilter(chromToggle)]);
            game.getLuaObject('chromToggle').shader = chromToggle;
            game.getLuaObject("temporaryShader1").shader = shaderVcr;
                
        ]]
    )
    activated = true
end
