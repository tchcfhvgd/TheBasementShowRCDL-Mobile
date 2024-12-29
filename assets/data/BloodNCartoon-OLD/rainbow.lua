local loling = 0

function onCreatePost()
    makeLuaSprite("Shader3")
    setSpriteShader("Shader3", "rainbow")
    
    runHaxeCode([[
    trace(ShaderFilter);
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader3").shader)]);
    ]])
    end
    
function onBeatHit()
    loling = loling + 1
    setShaderFloat('Shader3','iTime', loling)
end