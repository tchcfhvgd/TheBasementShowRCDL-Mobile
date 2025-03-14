local onCoolDown = false
local dodging = false
local doingDodge = false
local doingIt = false
local time = 1.5

function checkDodge()
	if dodging and getPropertyFromClass('ClientPrefs','mechanicsOn') then
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		characterPlayAnim('dad', 'attack', true);
		runTimer('characterBack', 0.5)
		luaSpritePlayAnimation('tomWhoWantsToFuckingKillYourAss', 'attack')
		setProperty('tomWhoWantsToFuckingKillYourAss.visible', true)
		setProperty('dad.visible', false)
		setProperty('dad.specialAnim', true);
		removeLuaSprite('Warn', true)
		playSound('chainsaw', 0.7);
	elseif not dodging and getPropertyFromClass('ClientPrefs','mechanicsOn') then
        setProperty('health', getProperty('health') - 1.5)
        playSound('chainsaw', 0.7);
        characterPlayAnim('boyfriend', 'singRIGHTmiss', true);
		characterPlayAnim('dad', 'attack', true);
		runTimer('characterBack', 0.5)
		luaSpritePlayAnimation('tomWhoWantsToFuckingKillYourAss', 'attack')
		setProperty('tomWhoWantsToFuckingKillYourAss.visible', true)
		setProperty('dad.visible', false)
		setProperty('dad.specialAnim', true);
	end
end

function onUpdate(elapsed)
	if keyPressed('space') then
    doingIt = true;
	else
	doingIt = false;
	end

	if doingIt and 
	not onCoolDown and 
	not dodging and 
	not getProperty('cpuControlled') then
		dodging = true
		onCoolDown = true
		runTimer('coolBack', 0.25)
		runTimer('dodgeBackN', 0.3)
	end

	if not onCoolDown and 
	not dodging and 
    getProperty('cpuControlled') then
		dodging = true
		onCoolDown = true
		runTimer('coolBack', 0.25)
		runTimer('dodgeBackN', 0.3)
	end
end

function onCreatePost()
	if not getPropertyFromClass('ClientPrefs','mechanicsOn') then
		close(true)
	end

	precacheImage('dodge')
	precacheSound('chainsaw')

	makeAnimatedLuaSprite('tomWhoWantsToFuckingKillYourAss', 'characters/45tom chain', getProperty('dad.x') - 150, getProperty('dad.y') + 100)
	addAnimationByPrefix('tomWhoWantsToFuckingKillYourAss','attack','A',24,false)
	setProperty('tomWhoWantsToFuckingKillYourAss.visible', false)
	scaleObject('tomWhoWantsToFuckingKillYourAss', 0.65, 0.65)
	addLuaSprite('tomWhoWantsToFuckingKillYourAss', true)
end

function onEvent(name, value1, value2)
    if name == "dodge" then
		doingDodge = true
		makeAnimatedLuaSprite('Warn', 'dodge', -200, -100)
		addAnimationByPrefix('Warn','dodge','dodge',24,true)
		luaSpritePlayAnimation('Warn', 'dodge')
		setLuaSpriteScrollFactor('Warn', 0, 0)
		addLuaSprite('Warn', true)
		scaleObject('Warn', 1.3, 1.3);

		runTimer('asshoy', time)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'coolBack' then
	onCoolDown = false
	end
	if tag == 'dodgeBackN' then
	dodging = false
	end
	if tag == 'characterBack' then
		setProperty('tomWhoWantsToFuckingKillYourAss.visible', false)
		setProperty('dad.visible', true)
	end
	if tag == 'asshoy' then
        removeLuaSprite('Warn', true)
		checkDodge()
	end
end