function onCreate()
	makeLuaSprite('back', 'BG/back', 0, 0)
	scaleObject('back', 1.6, 1.6);
	addLuaSprite('back', false)

	makeLuaSprite('front', 'BG/front', 0, 0)
	scaleObject('front', 1.6, 1.6);
	addLuaSprite('front', true)
end