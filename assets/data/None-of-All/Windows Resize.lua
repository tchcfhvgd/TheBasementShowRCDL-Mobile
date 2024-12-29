local shit1 = 0.71;

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i) return from+(to-from)*i end

function onCreatePost()
    if getPropertyFromClass('ClientPrefs','judjmentbool') then
    setProperty('judjTxt.x', getProperty('judjTxt.x') - 10)
    end
    setProperty('camHUD.zoom', 0.8)
    makeLuaSprite('border','lolBorder',0,0)
    makeGraphic('border',150,1270,'000000')
    addLuaSprite('border',false)
    setObjectCamera('border','other')

    makeLuaSprite('border2','lolBorderRt',1130,0)
    makeGraphic('border2',200,1280,'000000')
    addLuaSprite('border2',false)
    setObjectCamera('border2','other')

    if not downscroll then
        noteTweenY('dad',0,-40,0.01,'linear')
        noteTweenY('dad2',1,-40,0.01,'linear')
        noteTweenY('dad3',2,-40,0.01,'linear')
        noteTweenY('dad4',3,-40,0.01,'linear')
        noteTweenY('bf',4,-40,0.01,'linear')
        noteTweenY('bf2',5,-40,0.01,'linear')
        noteTweenY('bf3',6,-40,0.01,'linear')
        noteTweenY('bf4',7,-40,0.01,'linear')
    else
        noteTweenY('dad',0,660,0.01,'linear')
        noteTweenY('dad2',1,660,0.01,'linear')
        noteTweenY('dad3',2,660,0.01,'linear')
        noteTweenY('dad4',3,660,0.01,'linear')
        noteTweenY('bf',4,660,0.01,'linear')
        noteTweenY('bf2',5,660,0.01,'linear')
        noteTweenY('bf3',6,660,0.01,'linear')
        noteTweenY('bf4',7,660,0.01,'linear')
    end
    setProperty('timeBar.y',(downscroll and 780 or -70))
    setProperty('timeTxt.y',(downscroll and 770 or -76))
    setProperty('healthBar.y',(downscroll and -30 or 710))
    setProperty('iconP2.y',(downscroll and -100 or 650))
    setProperty('iconP1.y',(downscroll and -100 or 650))
    setProperty('scoreTxt.y',(downscroll and 30 or 770))
    setProperty('scoreTxt.size',20)

    

end
function onUpdatePost(elapsed)
    setProperty('camHUD.zoom', shit1)

    shit1 = math.lerp(shit1, 0.8, boundTo(elapsed * 4.5, 0, 1));
end

function onEvent(name,v1,v2)
    if name == 'Add Camera Zoom' then
    shit1 = shit1 + v1
    end
end