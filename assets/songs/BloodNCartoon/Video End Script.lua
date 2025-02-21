local allowCountdown = false
function onEndSong()
    if not allowCountdown and isStoryMode then 
        startVideo('Splatter');
        allowCountdown = true;
     return Function_Stop;
     end
return Function_Continue;
end

