function onCreate()
	addCharacterToList(mouse,'dad')
	addCharacterToList(mouse-angry,'dad')
	addCharacterToList(bf,'bf')
	addCharacterToList(gf,'gf')
end

function onStepHit()
	if curStep == 1016 then
	doTweenAlpha('GUItween', 'camHUD', 0.5, 0.5, 'linear');
end
	if curStep == 1024 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
end
end