function onCreate()
	makeLuaSprite('MEME BG', 'BG/Meme/MEME BG', -400, 0);
	setLuaSpriteScrollFactor('MEME BG', 0.8, 0.8);
	scaleObject('MEME BG', 0.8, 0.8);
	setProperty('MEME BG.alpha', 0)
	addLuaSprite('MEME BG',false)

	makeLuaSprite('meme new', 'BG/Meme/meme new', -400, -580);
	scaleObject('meme new', 1.1, 1.1);
	addLuaSprite('meme new',false)

	makeAnimatedLuaSprite('watcher','BG/Meme/watcher',-100, 220)
	scaleObject('watcher', 2, 2);
	addAnimationByPrefix('watcher','watcher','watcher', 18, true)
	addLuaSprite('watcher',true)

	makeLuaSprite('chee', 'BG/Meme/chee', -400, -580);
	setLuaSpriteScrollFactor('chee', 0.85, 0.85);
	scaleObject('chee', 1.1, 1.1);
	addLuaSprite('chee',true)

	makeLuaSprite('battle', 'BG/mm/battlefield', 450, -500);
	scaleObject('battle', 0.8, 0.8);
end

function onBeatHit()
    if curBeat % 2 == 0 and curStep < 10000 then
        objectPlayAnimation('watcher','watcher',true)
    end
end

function onStepHit()
    if curStep == 624 then
	setProperty('gfGroup.visible',false)
end
    if curStep == 1232 then
	addLuaSprite('battle',false)
	setProperty('watcher.visible',false)
	removeLuaSprite('meme new',false)
	removeLuaSprite('chee',false)
    setProperty('dad.y', -300)
    setProperty('dad.x', 1000)
    setProperty('boyfriend.y', 500)
    setProperty('boyfriend.x', 800)
end
    if curStep == 1360 then
	removeLuaSprite('battle',false)

	addLuaSprite('meme new',false)
	addLuaSprite('chee',false)
	setProperty('watcher.visible',true)
    setProperty('dad.y', 160)
    setProperty('dad.x', 100)
    setProperty('boyfriend.x', 770)
    setProperty('boyfriend.y', 360)
end
end