function onCreate()
--only add mouse nothing else
	makeAnimatedLuaSprite('glitch-mice','BG/Pibby/glitch-mice',400,200)
	scaleObject('glitch-mice', 0.7, 0.7);
	addAnimationByPrefix('glitch-mice','idle','idle',24,true)
	addLuaSprite('glitch-mice',false)
end