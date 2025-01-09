function onEvent(stupid,v1,v2)
	if stupid == 'Camera Speed' then
		setProperty('cameraSpeed', v1)
		calling = tonumber(n1)
		if calling >= 3 then 
			ofs = 0
		else
			ofs = 30
		end
	end
end
