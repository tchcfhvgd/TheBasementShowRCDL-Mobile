function onEvent(eventName, value1, value2)
    if eventName == "playvideo" then
        startVideo(value1)
          setProperty('inCutscene', false);
    end      
     return Function_Continue
end