local allowCountdown = false
function onEndSong()
    if not allowCountdown and isStoryMode then 
        startVideo('W4 End');
        allowCountdown = true;
     return Function_Stop;
     end
return Function_Continue;
end

