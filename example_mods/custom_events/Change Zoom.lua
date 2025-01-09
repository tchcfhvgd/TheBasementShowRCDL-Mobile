local zoomValues = {1, 1}

function splitShit(stringThing, seperator)
	if seperator == nil then
	seperator = ",";
	end
	local t = {};
	for str in string.gmatch(stringThing, "([^"..seperator.."]+)") do
	table.insert(t, str);
	end
    return t;
end

function onEvent(stupid,v1,v2)
	local zoomValues = splitShit(v1,",");
	if stupid == 'Change Zoom' then
		doTweenZoom('zoomStarting', 'camGame', zoomValues[1], zoomValues[2], (v2 == "" and 'linear' or v2));
		setProperty('defaultCamZoom', zoomValues[1])
	end
end
