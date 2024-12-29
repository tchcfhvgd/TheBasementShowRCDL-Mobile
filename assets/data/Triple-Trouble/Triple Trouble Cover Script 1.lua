--Fuck the Event Change BG/Character, we got LUA Script + less lag
--Script by Maxplay Games

function onCreate()
	makeLuaSprite('blackscreen', 'blackscreen', 0, -200)
	makeGraphic('blackscreen', 1920, 1280, '000000')
	setObjectCamera('blackscreen', 'HUD')
	addLuaSprite('blackscreen', false)
end

function onStepHit()
	if curStep == 1 then
	removeLuaSprite('fire',true)
	removeLuaSprite('doghouse2',true)
	removeLuaSprite('tree',true)
	removeLuaSprite('MT BG',true)
	removeLuaSprite('WBBG2',true)
	removeLuaSprite('WBFG2',true)
	removeLuaSprite('R',true)
	removeLuaSprite('basementred',true)
	triggerEvent('SonicStatic','','')
	doTweenAlpha('blackscreencum', 'blackscreen', 0, 0.5, 'linear')
end
	if curStep == 1040 then
--Bye BG1
	removeLuaSprite('Dside',true)
--Hello BG2
	makeAnimatedLuaSprite('fire','BG/DOJ/fire',-500, -270);
	scaleObject('fire', 0.9, 0.95);
	addAnimationByPrefix('fire','fire','fire',24,true)
	addLuaSprite('fire',false)
end
	if curStep == 1296 then
--Bye BG2
	removeLuaSprite('fire',true)
--Hello BG3
	makeLuaSprite('doghouse', 'BG/Spike/doghouse2', -600, -650);
	scaleObject('doghouse', 1.1, 1.1);
	addLuaSprite('doghouse',false)

	makeLuaSprite('tree', 'BG/Spike/tree', -600, -650);
	setLuaSpriteScrollFactor('tree', 1.1, 1.1);
	scaleObject('tree', 1.1, 1.1);
	addLuaSprite('tree',true)
end
	if curStep == 2320 then
--Bye BG3
	removeLuaSprite('doghouse2',true)
	removeLuaSprite('tree',true)
--Hello BG4
	makeLuaSprite('MT BG', 'BG/MT BG', -550, -255);
	scaleObject('MT BG', 0.9, 0.9);
	addLuaSprite('MT BG',false)
end
	if curStep == 2832 then
--Bye BG4
	removeLuaSprite('MT BG',true)
--Hello BG5
	makeLuaSprite('WBBG2', 'BG/WB/WBBG2', -580, -200);
	scaleObject('WBBG2', 1.3, 1.3);
	addLuaSprite('WBBG2',false)

	makeLuaSprite('WBFG2', 'BG/WB/WBBG2 thing', -580, -400);
	setLuaSpriteScrollFactor('WBFG2', 0.75, 0.75);
	scaleObject('WBFG2', 1.3, 1.3);
	addLuaSprite('WBFG2',true)

	makeLuaSprite('R', 'BG/WB/rocket', 380, 0);
	scaleObject('R', 0.7, 0.7);
	addLuaSprite('R',false)
end
	if curStep == 4112 then
--Bye BG5
	removeLuaSprite('WBBG2',true)
	removeLuaSprite('WBFG2',true)
	removeLuaSprite('R',true)
--Hello BG6
	makeLuaSprite('basementred', 'BG/Base/basementred', -800, -450);
	scaleObject('basementred', 1.1, 1.1);
	addLuaSprite('basementred',false)
end
end