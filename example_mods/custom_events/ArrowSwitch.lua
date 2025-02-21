function onEvent(name, value1, value2)
	if name == 'ArrowSwitch' then
		noteTweenX('play0', 4, 1075, 0.5, 'quartInOut')
		noteTweenX('play4', 7, 735, 0.5, 'quartInOut')
		noteTweenX('play2', 5, 960, 0.5, 'quartInOut')
		noteTweenX('play3', 6, 849, 0.5, 'quartInOut')
	end
end
