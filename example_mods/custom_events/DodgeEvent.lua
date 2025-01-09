function onCreate()
    Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('spacebar');
    precacheSound('DODGE');
    precacheSound('Dodged');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    DodgeTime = (value1);
	characterPlayAnim('dad', 'hey', true);
	setProperty('dad.specialAnim', true); 

	makeAnimatedLuaSprite('spacebar', 'spacebar', 0, 0);
	luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 12, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
	scaleLuaSprite('spacebar', 1, 1);
	screenCenter('spacebar', 'xy');
	addLuaSprite('spacebar', true); 
	
	playSound('DODGE');
	canDodge = true;
	runTimer('Died', DodgeTime);
	end
--Idk how to code this stupid shit
	if botPlay then
   Dodged = true;        
   removeLuaSprite('spacebar');
end
	if not getPropertyFromClass('ClientPrefs','mechanicsOn') then
   Dodged = true;        
   removeLuaSprite('spacebar');
end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   Dodged = true;
   playSound('Dodged', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);          
   removeLuaSprite('spacebar');
   canDodge = false
   characterPlayAnim('dad', 'attack', true);
   setProperty('dad.specialAnim', true);   
   end
end


function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'jerryback' then
   elseif tag == 'Died' and Dodged == false then
   playSound('dead', 0.7);
   setProperty('health', getProperty('health') - 1)
   characterPlayAnim('boyfriend', 'singRIGHTmiss', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('spacebar');
   characterPlayAnim('dad', 'attack', true);
   setProperty('dad.specialAnim', true);   
   canDodge = false
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   end
end