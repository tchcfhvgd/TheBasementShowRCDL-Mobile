function onCreate()
--screen
	makeLuaSprite('warningchain', 'warningchain', 0, 0)
	addLuaSprite('warningchain')

	setObjectCamera('warningchain', 'other')

	doTweenAlpha('warningchain', 'warningchain', 0, 0.0000000000001, 'linear')

	if not getPropertyFromClass('ClientPrefs','mechanicsOn') then
	removeLuaSprite('warningchain', true)
end
end

function onStepHit()
	if curStep == 2 then
	doTweenAlpha('warningchain', 'warningchain', 1, 0.3, linear)
end
	if curStep == 64 then
	doTweenAlpha('warningchain', 'warningchain', 0, 1, linear)
end
end