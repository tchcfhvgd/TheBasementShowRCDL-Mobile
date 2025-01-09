function onCreate()
--load the stage first
	makeLuaSprite('1', 'BG/TT/1', -500, -400);
	scaleObject('1', 1, 1);
	addLuaSprite('1',false)
	makeLuaSprite('2', 'BG/TT/2', -700, -525);
	scaleObject('2', 1.15, 1.1);
	addLuaSprite('2',false)
	makeLuaSprite('3', 'BG/TT/3', -725, -25);
	scaleObject('3', 1.1, 1.1);
	addLuaSprite('3',false)
	makeLuaSprite('4', 'BG/TT/4', -550, -400);
	scaleObject('4', 1, 1);
	addLuaSprite('4',false)
	makeLuaSprite('5', 'BG/TT/5', -550, -400);
	scaleObject('5', 1, 1);
	setLuaSpriteScrollFactor('5', 0.75, 0.75);
	addLuaSprite('5',true)
	makeLuaSprite('6', 'BG/TT/6', -550, -400);
	scaleObject('6', 1, 1);
	addLuaSprite('6',false)
	makeLuaSprite('7', 'BG/TT/7', -550, -400);
	scaleObject('7', 1, 1);
	setLuaSpriteScrollFactor('7', 0.75, 0.75);
	addLuaSprite('7',true)
--Jumpscare
	makeLuaSprite('TT 1', 'IF/TT 1', 0, 0)
	setObjectCamera('TT 1', 'camother')
	addLuaSprite('TT 1', false)
	makeLuaSprite('TT 2', 'IF/TT 2', 0, 0)
	setObjectCamera('TT 2', 'camother')
	addLuaSprite('TT 2', false)
	makeLuaSprite('TT 3', 'IF/TT 3', 0, 0)
	setObjectCamera('TT 3', 'camother')
	addLuaSprite('TT 3', false)
--shade
	makeLuaSprite('shade', 'shade2', 0, 0)
	scaleObject('shade', 0.5, 0.5);
	setObjectCamera('shade', 'other')
	addLuaSprite('shade',true)

--fuck shader / high Quality

	if lowQuality then
	removeLuaSprite('shade',true)
	removeLuaSprite('5',true)
	removeLuaSprite('7',true)
end
end