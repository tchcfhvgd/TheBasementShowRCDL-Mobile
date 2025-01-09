function onCreatePost()
	makeLuaSprite('whitefg', '', 0, 0)
	setScrollFactor('whitefg', 0, 0)
	makeGraphic('whitefg', 3840, 2160, 'ffffff')
	addLuaSprite('whitefg', true)
	setProperty('whitefg.alpha', 0)
	screenCenter('whitefg', 'xy')
end
function onEvent(n, v1, v2)
	if n == 'badapplelol1' and string.lower(v1) == 'a' then
		doTweenAlpha('applebadxd69', 'whitefg', 1, v2, 'linear')
	end
	if n == 'badapplelol1' and string.lower(v1) == 'b' then
		doTweenAlpha('applebadxd', 'whitefg', 0, v2, 'linear')
	end
end