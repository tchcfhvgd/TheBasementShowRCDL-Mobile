-- Created by RamenDominoes, Fixed By MrSropical
start = 0
finish = 0

function onCreate()
	

	--THE TOP BAR
	makeLuaSprite('UpperBar', 'empty', 0, -120)
	makeGraphic('UpperBar', 1920, 120, '000000')
	setObjectCamera('UpperBar', 'cinem') -- don't get yourself tired this camera is only tbs exclusive -- mrsropical
	addLuaSprite('UpperBar', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', 0, 720)
	makeGraphic('LowerBar', 1920, 120, '000000')
	setObjectCamera('LowerBar', 'cinem')
	addLuaSprite('LowerBar', false)

end


function onUpdate()
	if start == 1 then
	doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 600, 0.5, 'Linear')
	--doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
	--doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
	--doTweenAlpha('AlphaTween3', 'iconP1', 0, 0.25)
	--doTweenAlpha('AlphaTween4', 'iconP2', 0, 0.25)
	--doTweenAlpha('AlphaTween5', 'timeBar', 0, 0.25)
	--doTweenAlpha('AlphaTween6', 'timeBarBG', 0, 0.25)
	--setProperty('HB.visible', false)
	--setProperty('Health.visible', false)
	end

	if finish == 2 then
	doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
	--doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	--doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	--doTweenAlpha('AlphaTween3', 'iconP1', 1, 0.25)
	--doTweenAlpha('AlphaTween4', 'iconP2', 1, 0.25)
	--doTweenAlpha('AlphaTween5', 'timeBar', 1, 0.25)
	--doTweenAlpha('AlphaTween6', 'timeBarBG', 1, 0.25)
	--setProperty('HB.visible', true)
	--setProperty('Health.visible', true)
	end	
end

function onEvent(name,value1,value2)
	if name == 'Cinematics' then
		start = tonumber(value1)
		finish = tonumber(value2)
			end
	
		end
