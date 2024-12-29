--scripts by NTH208
speedUpGlitch0 = false
speedUpGlitch1 = false
speedUpGlitch2 = false
speedUpGlitch3 = false
function onCreatePost()
luaDebugMode = true
initLuaShader("Glitchy")

setSpriteShader('opponentStrums.members[0]', 'Glitchy')
        setSpriteShader('opponentStrums.members[1]', 'Glitchy')
        setSpriteShader('opponentStrums.members[2]', 'Glitchy')
        setSpriteShader('opponentStrums.members[3]', 'Glitchy')
    --    for i=0,3 do
  --      setProperty('opponentStrums.members['..i..'].useFramePixels', true)
  --      end
  
  for i=0,3 do
    setShaderFloat("opponentStrums.members["..i.."]", "AMT", 0.2)
    end
     end
        
        function onUpdate()
        setShaderFloat("opponentStrums.members[0]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[1]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[2]", "iTime", os.clock())
    setShaderFloat("opponentStrums.members[3]", "iTime", os.clock())
    --Speed Glitch
    if speedUpGlitch0 then
    setShaderFloat("opponentStrums.members[0]", "SPEED", 0.4)
    else
    setShaderFloat("opponentStrums.members[0]", "SPEED", 0.1)
    end
    
    if speedUpGlitch1 then
    setShaderFloat("opponentStrums.members[1]", "SPEED", 0.4)
    else
    setShaderFloat("opponentStrums.members[1]", "SPEED", 0.1)
    end
    
    if speedUpGlitch2 then
    setShaderFloat("opponentStrums.members[2]", "SPEED", 0.4)
    else
    setShaderFloat("opponentStrums.members[2]", "SPEED", 0.1)
    end
    
    if speedUpGlitch3 then
    setShaderFloat("opponentStrums.members[3]", "SPEED", 0.4)
    else
    setShaderFloat("opponentStrums.members[3]", "SPEED", 0.1)
    end
    
    end
    
    function opponentNoteHit(id,data,type,sus)
    if type == 'GF Sing But Not Visible Note' then
    else
    if data ==0 then
    speedUpGlitch0 = true
    runTimer('outSpeed0',0.15)
    end
    
    if data ==1 then
    speedUpGlitch1 = true
    runTimer('outSpeed1',0.15)
    end
    
    if data ==2 then
    speedUpGlitch2 = true
    runTimer('outSpeed2',0.15)
    end
    
    if data ==3 then
    speedUpGlitch3 = true
    runTimer('outSpeed3',0.15)
    end
    end
    end
    
    function onTimerCompleted(tag)
    if tag== 'outSpeed0' then
    speedUpGlitch0 = false
    end
    
    if tag== 'outSpeed1' then
    speedUpGlitch1 = false
    end
    
    if tag== 'outSpeed2' then
    speedUpGlitch2 = false
    end
    
    if tag== 'outSpeed3' then
    speedUpGlitch3 = false
    end
    end
    