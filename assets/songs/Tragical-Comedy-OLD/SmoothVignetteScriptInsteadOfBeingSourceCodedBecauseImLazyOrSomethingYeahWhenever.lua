--im lazy to rename it
--hi sropical

function onCreatePost()
     if shadersEnabled and OldTVShadersEnabled then -- so it won't give you a black screen (same for snow thing)
	makeLuaSprite('smoothVig', 'smoothVig', 0, 0)
	setObjectCamera('smoothVig', 'other')
    addLuaSprite('smoothVig', true)
    setScrollFactor('smoothVig', 0, 0)
    setObjectOrder('smoothVig', 0)
end
end