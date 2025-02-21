local loling = 0
local partyColors = {
	'FF0000',
	'3F029C',
	'FFFFFF',
	'0008FF',
	'FFF700',
	'FF7700',
	'00F2FF'
}

function onCreate()
	mechsOn = getPropertyFromClass('ClientPrefs','mechanicsOn')
	addCharacterToList(MEME-BOI,'dad')
	addCharacterToList(MEME-BOI-old,'dad')
	addCharacterToList(MEME-BOI-sans,'dad')
end


function onCreatePost()
	if getPropertyFromClass('ClientPrefs','shaders') then
    makeLuaSprite("Shader3")
    setSpriteShader("Shader3", "rainbow")
	end
    end
    
function onBeatHit()
	if curBeat > 467 and curBeat < 531 then
	loling = loling + 1
	setProperty('timeBar.color', getColorFromHex(partyColors[getRandomInt(0,6)]))
	if getPropertyFromClass('ClientPrefs','shaders') then
	setShaderFloat('Shader3','iTime', loling)
	runHaxeCode([[
	trace(ShaderFilter);
	game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader3").shader)]);
	]])
end
	end
	if curBeat == 530 then
		if getPropertyFromClass('ClientPrefs','shaders') then
		removeLuaSprite("Shader3")
		setProperty('camGame.filtersEnabled', false)
		end
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
	end
end