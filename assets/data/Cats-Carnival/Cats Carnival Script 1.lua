function onStepHit()
	if curStep == 32 then
--double mouse refer-
	makeAnimatedLuaSprite('glitch-mice','BG/Pibby/glitch-mice',400,200)
	scaleObject('glitch-mice', 0.7, 0.7);
	addAnimationByPrefix('glitch-mice','idle','idle',24,true)
	addLuaSprite('glitch-mice',false)
end
	if curStep == 1035 then
	doTweenAlpha('GUItween', 'camHUD', 0, 0.75, 'expoOut');
end
	if curStep == 1056 then
	setProperty('glitch-mice.colorTransform.greenOffset', 255)
	setProperty('glitch-mice.colorTransform.redOffset', 255)
	setProperty('glitch-mice.colorTransform.blueOffset', 255)
end
	if curStep == 1112 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'expoOut');
end
	if curStep == 1190 then
	doTweenAlpha('GUItween', 'camHUD', 0, 0.5, 'expoOut');
end
	if curStep == 1240 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'expoOut');
end
	if curStep == 1312 then
	setProperty('glitch-mice.colorTransform.greenOffset', 0)
	setProperty('glitch-mice.colorTransform.redOffset', 0)
	setProperty('glitch-mice.colorTransform.blueOffset', 0)
end
end

function onUpdatePost()
    setProperty('otherchartrIcon.scale.y', getProperty('iconP2.scale.y') - 0.35)
    setProperty('otherchartrIcon.scale.x', getProperty('iconP2.scale.x') - 0.35)
end

function onCreate()
    makeLuaText('otherCharterTxt', 'NoahGani', 500, -1000, 470)
    setObjectCamera("otherCharterTxt", 'other');
    setTextColor('otherCharterTxt', '213B53')
    setTextSize('otherCharterTxt', 32);
    addLuaText("otherCharterTxt");
    setTextFont('otherCharterTxt', "vcr.ttf")
    setTextAlignment('otherCharterTxt', 'left')

	makeLuaSprite('otherchartrIcon', 'credits/Noah', -1000, 420)
    setObjectCamera('otherchartrIcon', 'other')
    addLuaSprite('otherchartrIcon', true)
   setScrollFactor('otherchartrIcon', 0, 0)
end

function onCreatePost()
	scaleObject('bgThing', 0.35, 0.5)
end

function onSongStart()
    doTweenX('balsas', 'otherchartrIcon', 420, 1, 'expoOut')
    doTweenX('kyas', 'otherCharterTxt', 74, 1, 'expoOut')

    runTimer('getthefuckoaut-', 5, 1)
    runTimer('murdear', 7, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'getthefuckoaut-' then
        doTweenX('egdsas', 'otherchartrIcon', -1400, 1, 'BackInOut')
        doTweenX('lyas', 'otherCharterTxt', -1174, 1, 'BackInOut')
    end
    if tag == 'murdear' then
        removeLuaSprite('bye', true)
        removeLuaSprite('otherchartrIcon', true)
        removeLuaSprite('otherCharterTxt', true)
    end
end
