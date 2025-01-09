local CAMxx = 0.9;
local CAMyy = 0.7;
local xx = 570;
local yy = 570;
local xx2 = 770;
local yy2 = 570;
local ofs = 20;
local followchars = false;
local del = 0;
local del2 = 0;
local mouseFollow = true

function onUpdate(elapsed)
    triggerEvent('Camera Follow Pos',xx,yy)

    if getProperty('boyfriend.x') >= 900 or getProperty('boyfriend.x') <= -513 or getProperty('boyfriend.y') <= -240 then
    setProperty('boyfriend.alpha', 0)
    else
    setProperty('boyfriend.alpha', 1)
    end
end

function onCreate()
    mouseFollow = true
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	makeLuaSprite('BG', 'BG/Computer/computerBG', -600, -150);
    setScrollFactor('BG',0,0)
	addLuaSprite('BG',false)

    makeLuaSprite('screen', 'BG/Computer/screen', -40, -35);
    setScrollFactor('screen',0,0)
    scaleObject('screen', 1, 1.05)
    addLuaSprite('screen',false)

	makeLuaSprite('computer', 'BG/Computer/computer', -600, -40);
    setScrollFactor('computer',0,0)
	addLuaSprite('computer',true)

	makeLuaSprite('buy', 'BG/Computer/buy', 850, 350);
    setScrollFactor('buy',0,0)
	addLuaSprite('buy',false)
end

function onUpdatePost(elapsed)
    mouseX = getMouseX('game');
    mouseY = getMouseY('game');
    if mouseFollow then
    setProperty('boyfriend.x', mouseX - 480)
    setProperty('boyfriend.y', mouseY - 220)
    end
end
    
function onDestroy()
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
    runHaxeCode('FlxG.mouse.unload();')
end

function onCreatePost()
    setScrollFactor('boyfriend',0,0)
    setScrollFactor('dad',0,0)
    setScrollFactor('gf',0,0)
    setObjectOrder('gf',10)
end

function onGameOver()
    mouseFollow = false
    setProperty('boyfriend.x', 0)
    setProperty('boyfriend.y', 140)
end
