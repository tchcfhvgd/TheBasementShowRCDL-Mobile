function onCreate()
	makeLuaSprite('blackscreen', 'blackscreen', 0, -200)
	makeGraphic('blackscreen', 1920, 1280, '000000')
	setObjectCamera('blackscreen', 'HUD')
	addLuaSprite('blackscreen', false)
end

function onCreatePost()
	setProperty('camGame.alpha', 0)
end

function onStepHit()
	if curStep == 1 then
	doTweenAlpha('blackscreencum', 'blackscreen', 0, 10, 'linear')
	doTweenAlpha('dead', 'camGame', 1, 10, 'linear')
end
end