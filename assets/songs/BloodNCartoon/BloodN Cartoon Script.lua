function onCreate()
	makeLuaSprite('WB Splatter Intro', 'WB Splatter Intro', 0, 0);
	setObjectCamera('WB Splatter Intro', 'other')
	addLuaSprite('WB Splatter Intro', false)

	makeLuaSprite('blackscreen', 'blackscreen', 0, 0)
	makeGraphic('blackscreen', 1920, 1280, '000000')
	setObjectCamera('blackscreen', 'other')
	addLuaSprite('blackscreen', false)
end

function onCreatePost()
	triggerEvent('infryzoom','1.3','0.1')
	doTweenAlpha('GUItween', 'camHUD', 0, 0.0000000001, 'linear');
end

function onStepHit()
	if curStep == 1 then
	doTweenAlpha('blackscreencum', 'blackscreen', 0, 1, 'linear')
end
	if curStep == 24 then
	doTweenAlpha('wb', 'WB Splatter Intro', 0, 3, 'linear')
end
	if curStep == 986 then
	doTweenAlpha('GUItween', 'camHUD', 0.75, 0.1, 'linear');
end
	if curStep == 992 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.1, 'linear');
end
end