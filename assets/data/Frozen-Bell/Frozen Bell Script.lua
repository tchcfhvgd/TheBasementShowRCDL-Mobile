function onCreate()
	luaDebugMode = true
	makeLuaSprite('bl');
	makeGraphic('bl',screenWidth,screenHeight,'000000')
	setObjectCamera('bl', 'HUD')
	setProperty('bl.scale.x',2)
	setProperty('bl.scale.y',2)
	addLuaSprite('bl', false);
end

function onCreatePost()
	setProperty('camGame.alpha', 0)
end

function onSongStart()
	doTweenAlpha('blTw', 'bl', 0, 3, 'linear')
	doTweenAlpha('dead', 'camGame', 1, 3, 'linear')
end

function onCountdownStarted()
	for i = 0, getProperty('unspawnNotes.length')+2 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'snow' then
			removeFromGroup('unspawnNotes', i, true)
		end
	end
end