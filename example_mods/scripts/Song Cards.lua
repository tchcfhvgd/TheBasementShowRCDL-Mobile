local notstopBro = true;
--                   name                 color     sprite (must be in images/credits)
local composerData = {'NaglazGYamiZaleD', '7B3691', 'NaglazGYamiZaleD'}
--                   name                 color     sprite (must be in images/credits)
local charterData = {'Maxplay Games', 'C1F8F3', 'Maxplay'}
--                  color   sprite (must be in images/icons) normal = 0, losing = 150
local songData = {'850000', 'mouse-p3', 0}
local bgName = 'songBG'

function onCreate()

--WEEK 1
--WEEK 1
--WEEK 1
    if songName == 'House-for-Sale' then
    composerData = {'Wind', 'ffff00', 'Wind'}
    charterData = {'Noah Gani1', '213b53', 'Noah'}
    songData = {'AA5F19', 'mouse-p1', 0}
end
    if songName == 'House for Sale OLD' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'AA5F19', 'mouse-p1', 0}
end
    if songName == 'Evaporate' then
    composerData = {'Rhodes_W', '636363', 'Rhodes_W'}
    songData = {'AA5F19', 'mouse-p1', 150}
end
    if songName == 'Sirokou' then
    composerData = {'NaglazGYamiZaleD', '7B3691', 'NaglazGYamiZaleD'}
    songData = {'850000', 'mouse-p2.5', 0}
end
    if songName == 'Sirokou OLD' then
    composerData = {'NaglazGYamiZaleD', '7B3691', 'NaglazGYamiZaleD'}
    songData = {'850000', 'mouse-p3', 0}
end

--WEEK 2
--WEEK 2
--WEEK 2

    if songName == 'Blue' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'383E57', 'blue-tom', 0}
end
    if songName == 'Tragical-Comedy' then
    composerData = {'HeroComics', '05DBFF', 'Herocomics'}
    songData = {'383E57', 'blue-tom', 150}
end
    if songName == 'Shattered' then
    composerData = {'C-air', '93A1FF', 'C-air'}
    songData = {'192141', 'blue-tom2', 150}
end

--WEEK 3
--WEEK 3
--WEEK 3

    if songName == 'Funny-Cartoon' then
    composerData = {'Gh05t49_Crrr', '4D663F', 'Crrr'}
    charterData = {'TWS, Maxplay Games', 'ffffff', 'TWSMax'}
    songData = {'7186A1', 'pibby-tom', 0}
end
    if songName == 'Funny Cartoon OLD' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'7186A1', 'pibby-tom', 0}
end
    if songName == 'Cats-Carnival' then
    composerData = {'Thunder137', 'FFFFFF', 'Thunder137'}
    charterData = {'Noah Gani1, Maxplay Games', 'ffffff', 'NoahMax'}
    songData = {'7186A1', 'pibby-tom', 0}
end

    if songName == 'Unstoppable-Block' then
    composerData = {'Thunder137', 'FFFFFF', 'Thunder137'}
    songData = {'7186A1', 'pibby-tom', 150}
end

--WEEK 4
--WEEK 4
--WEEK 4
    if songName == 'BloodNCartoon' then
    composerData = {'Breath_Sans', 'ff0000', 'BS'}
    charterData = {'Noah Gani1, Maxplay Games', 'ffffff', 'NoahMax'}
    songData = {'7b6c66', 'WB-tom', 0}
end
    if songName == 'BloodNCartoon OLD' then
    composerData = {'Breath_Sans', 'ff0000', 'BS'}
    charterData = {'Noah Gani1', '213b53', 'Noah'}
    songData = {'7b6c66', 'WB-tom old', 0}
end
    if songName == 'Splatter' then
    composerData = {'Breath_Sans', 'ff0000', 'BS'}
    charterData = {'KrashTheBot, Maxplay Games', 'ffffff', 'KrashMax'}
    songData = {'363536', 'WB45', 0}
end
    if songName == 'Splatter OLD' then
    composerData = {'Breath_Sans', 'ff0000', 'BS'}
    charterData = {'KrashTheBot', 'ff6600', 'KrashTheBot'}
    songData = {'363536', 'WB45', 0}
end
    if songName == 'Chainsaw-Maniac' then
    composerData = {'CZTV-28', 'fddd00', 'CZTV'}
    songData = {'ff0000', '45-tom2', 150}
end

--WEEK 5
--WEEK 5
--WEEK 5
    if songName == 'None of All OLD' then
    composerData = {'HeroComicS', '05DBFF', 'Herocomics'}
    songData = {'df6455', 'DOI-Jerry', 0}
end

--FREEPLAY D SIDES
--FREEPLAY D SIDES
--FREEPLAY D SIDES

    if songName == 'Come for Revenge' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'97a5b2', 'tuffy', 0}
end
    if songName == 'Reburning' then
    composerData = {'Rhodes_W', '636363', 'Rhodes_W'}
    songData = {'97a5b2', 'tuffy-2', 150}
end
    if songName == 'Paralyzed' then
    composerData = {'Gh05t49_Crrr', '4D663F', 'Crrr'}
    songData = {'ece9ec', 'dro', 150}
end

--FREEPLAY OCs
--FREEPLAY OCs
--FREEPLAY OCs

    if songName == 'Jam' then
    composerData = {'Breath_Sans', 'ff0000', 'BS'}
    charterData = {'MrSropical, Maxplay Games', 'ffffff', 'Mr_SropicalMax'}
    songData = {'9f5c16', 'james', 0}
end
    if songName == 'Jam OLD' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'9f5c16', 'james', 0}
end
    if songName == 'Desire or Despair' then
    composerData = {'Rhodes_W', '636363', 'Rhodes_W'}
    charterData = {'Noah Gani1, Maxplay Games', 'ffffff', 'NoahMax'}
    songData = {'747474', 'starved-butch', 150}
end
    if songName == 'Frozen Bell' then
    composerData = {'Oil', 'e5e8ef', 'Oil'}
    charterData = {'Noah Gani1, Maxplay Games', 'ffffff', 'NoahMax'}
    songData = {'773b22', 'unfreeze-jerry', 150}
end

--FREEPLAY EXTRAS
--FREEPLAY EXTRAS
--FREEPLAY EXTRAS

    if songName == 'Vanishing' then
    composerData = {'DOGE122', 'f2d120', 'DOGE122'}
    songData = {'AA5F19', 'mouse-p1', 150}
end
    if songName == 'Vanishing OLD' then
    composerData = {'DOGE122', 'f2d120', 'DOGE122'}
    charterData = {'HLL_H-lan', '242850', 'HLL_H-lan'}
    songData = {'AA5F19', 'mouse-p2', 0}
end
    if songName == 'Invade' then
    composerData = {'HeroComics', '05DBFF', 'Herocomics'}
    songData = {'d9ffc3', 'alien-cat', 150}
end
    if songName == 'Invade OLD' then
    composerData = {'CZTV-28', 'fddd00', 'CZTV'}
    charterData = {'fanhua', '633f42', 'fanhua'}
    songData = {'d9ffc3', 'alien-cat', 0}
end
    if songName == 'Invade OLDER' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'d9ffc3', 'alien-cat old', 150}
end
    if songName == 'Black Humor' then
    composerData = {'Gh05t49_Crrr, Breath_Sans', 'ffffff', 'CrrrBS'}
    charterData = {'KrashTheBot, Maxplay Games', 'ffffff', 'KrashMax'}
    songData = {'ca742b', 'lightning', 0}
end
    if songName == 'Black Humor OLD' then
    composerData = {'CZTV-28', 'fddd00', 'CZTV'}
    charterData = {'fanhua', '633f42', 'fanhua'}
    songData = {'c9742d', 'lightning old', 0}
end
    if songName == 'Hydrophobia' then
    songData = {'770000', 'spike', 0}
end
    if songName == 'Recurrence' then
    composerData = {'7_57', 'ffffff', '757'}
    charterData = {'Fanhua, Maxplay Games', 'ffffff', 'fanhuaMax'}
    songData = {'676477', 'n', 0}
end

--FREEPLAY MEMES
--FREEPLAY MEMES
--FREEPLAY MEMES

    if songName == 'Meme Mania' then
    composerData = {'Breath_Sans', 'ff0000', 'BS'}
    songData = {'d38900', 'meme-boi', 0}
end
    if songName == 'Meme Mania OLD' then
    composerData = {'JerryWannaRat', '8940A6', 'JerryWannaRat'}
    songData = {'d38900', 'meme-boi-old', 0}
end
    if songName == 'Steep Slopes' then
    composerData = {'HeroComicS', '05DBFF', 'Herocomics'}
    songData = {'CBD3CC', 'wheel-tom', 0}
end

--FREEPLAY MIXS AND COVERS
--FREEPLAY MIXS AND COVERS
--FREEPLAY MIXS AND COVERS

    if songName == 'War of Whiskers' then
    composerData = {'Gh05t49_Crrr', '4D663F', 'Crrr'}
    charterData = {'Noah Gani1, KrashTheBot,          Maxplay Games', 'ffffff', '3'}
    songData = {'35beb7', 'JewelleryHXA', 0}
end
    if songName == 'War of Whiskers OLD' then
    composerData = {'MarStarBro, Uptaunt,         Punkett', 'ffffff', 'TT'}
    charterData = {'Maxplay Games (Cover)', 'C1F8F3', 'Maxplay'}
end

--NO SONG CARDS
--NO SONG CARDS
--NO SONG CARDS

    if songName == 'Mucho Mouse' or
    songName == 'Faded' or
    songName == 'Kaboom' or
    songName == 'None of All' then
    close()
    end

    makeLuaSprite('musicIcon', 'songBG/song_Icon', -1010, 205)
    setObjectCamera('musicIcon', 'other')
    scaleObject('musicIcon', 0.7, 0.7)
    addLuaSprite('musicIcon', true)
    setScrollFactor('musicIcon', 0, 0)

    makeLuaText('beforeSongText', songName, 500, -1074, 215)
    setObjectCamera("beforeSongText", 'other');
    setTextColor('beforeSongText', songData[1])
    setTextSize('beforeSongText', (string.len(songName) > 14 and 30 or 35));
    addLuaText("beforeSongText");
    setTextFont('beforeSongText', "vcr.ttf")
    setTextAlignment('beforeSongText', 'left')

    setProperty("iconSong._frame.frame.x", 0)
    
    makeLuaSprite('compIcon', 'songBG/music_Icon', -1000, 275)
    setObjectCamera('compIcon', 'other')
    scaleObject('compIcon', 0.55, 0.55)
    addLuaSprite('compIcon', true)
    setScrollFactor('compIcon', 0, 0)

    makeLuaText('compTxt', composerData[1], 500, -1174, 290)
    setObjectCamera("compTxt", 'other');
    setTextColor('compTxt', composerData[2])
    setTextSize('compTxt', 25);
    addLuaText("compTxt");
    setTextFont('compTxt', "vcr.ttf")
    setTextAlignment('compTxt', 'left')

    makeLuaSprite('charterIcon', 'songBG/charter_Icon', -1010, 380)
    setObjectCamera('charterIcon', 'other')
    scaleObject('charterIcon', 0.7, 0.7)
    addLuaSprite('charterIcon', true)
    setScrollFactor('charterIcon', 0, 0)

    makeLuaText('charterTxt', charterData[1], 500, -1000, getProperty('compTxt.y') + 90)
    setObjectCamera("charterTxt", 'other');
    setTextColor('charterTxt', charterData[2])
    setTextSize('charterTxt', 25);
    addLuaText("charterTxt");
    setTextFont('charterTxt', "vcr.ttf")
    setTextAlignment('charterTxt', 'left')

    makeLuaSprite('musicanIcon', 'credits/'..composerData[3], -1090, 240)
    setObjectCamera('musicanIcon', 'other')
    addLuaSprite('musicanIcon', true)
    setScrollFactor('musicanIcon', 0, 0)

    makeLuaSprite('chartrIcon', 'credits/'..charterData[3], -1000, 320)
    setObjectCamera('chartrIcon', 'other')
    addLuaSprite('chartrIcon', true)
    setScrollFactor('chartrIcon', 0, 0)

    makeLuaSprite('iconSong', 'icons/'..songData[2], -1380, 160)
    setObjectCamera('iconSong', 'other')
    addLuaSprite('iconSong')
    setProperty("iconSong._frame.frame.y", 0)
    setProperty("iconSong._frame.frame.x", songData[3])
    setProperty("iconSong._frame.frame.width", 150)
    setProperty("iconSong._frame.frame.height", 150)

    setObjectOrder('iconSong', getObjectOrder('charterTxt') - 2)
end

function onCreatePost()

--WEEK 1
--WEEK 1
--WEEK 1

	if songName == 'Sirokou' or
	songName == 'Sirokou OLD' or
	songName == 'Vanishing' or
	songName == 'Vanishing OLD' or
	songName == 'House-for-Sale OLD' or
	songName == 'Evaporate' or 
	songName == 'House-for-Sale' then
	bgName = 'songBG'
end

--WEEK 2
--WEEK 2
--WEEK 2

	if songName == 'Tragical-Comedy' or
	songName == 'Blue' or
	songName == 'Shattered' then
	bgName = 'songBG13'
end

--WEEK 3
--WEEK 3
--WEEK 3

	if songName == 'Funny-Cartoon' or
	songName == 'Cats-Carnival' or
	songName == 'Unstoppable-Block' then
	bgName = 'songBG8'
end
	if songName == 'Funny Cartoon OLD' then
	bgName = 'songBG17'
end

--WEEK 4
--WEEK 4
--WEEK 4

	if songName == 'BloodNCartoon' or
	songName == 'BloodNCartoon OLD' then
	bgName = 'songBG18'
end
	if songName == 'Splatter' then
	bgName = 'songBG19'
end
	if songName == 'Splatter OLD' then
	bgName = 'songBG19'
end
	if songName == 'Chainsaw-Maniac' then
	bgName = 'songBG20'
end

--WEEK 5
--WEEK 5
--WEEK 5

	if songName == 'None of All OLD' then
	bgName = 'songBG15'
end

--FREEPLAY D SIDE
--FREEPLAY D SIDE
--FREEPLAY D SIDE

	if songName == 'Reburning' or
	songName == 'Come for Revenge' then
	bgName = 'songBG5'
end
    if songName == 'Paralyzed' then
        bgName = 'songBG22'
end

--FREEPLAY OCs
--FREEPLAY OCs
--FREEPLAY OCs

	if songName == 'Jam' or
	songName == 'Jam OLD' then
	bgName = 'songBG10'
end
	if songName == 'Desire or Despair' then
	bgName = 'songBG9'
end
	if songName == 'Frozen Bell' then
	bgName = 'songBG21'
end

--FREEPLAY EXTRAS
--FREEPLAY EXTRAS
--FREEPLAY EXTRAS

	if songName == 'Invade' or
	songName == 'Invade OLD' or
	songName == 'Invade OLDER' then
	bgName = 'songBG3'
end
	if songName == 'Black Humor' or
	songName == 'Black Humor OLD' then
	bgName = 'songBG14'
end
	if songName == 'Hydrophobia' then
	bgName = 'songBG11'
end
	if songName == 'Recurrence' then
	bgName = 'songBG24'
end
	if songName == 'Meme Mania' or
	songName == 'Meme Mania OLD' then
	bgName = 'songBG2'
end
	if songName == 'Steep Slopes' then
	bgName = 'songBG16'
end

--FREEPLAY MIXS AND COVERS
--FREEPLAY MIXS AND COVERS
--FREEPLAY MIXS AND COVERS

    if songName == 'War of Whiskers' then
        bgName = 'songBG25'
end
    if songName == 'War of Whiskers OLD' then
        bgName = 'songBG7'
end

	makeLuaSprite('bgThing', 'SongBG/localBG/'..bgName, -1000, 200)
    scaleObject('bgThing', 0.35, 0.35)
	setObjectCamera('bgThing', 'other')
    addLuaSprite('bgThing', true)
    setProperty('bgThing.alpha', 0.8)
    setScrollFactor('bgThing', 0, 0)
    setObjectOrder('bgThing', getObjectOrder('musicIcon') - 1)
end

function onUpdatePost()
    setProperty('musicIcon.angle', getProperty('musicIcon.angle') - 3)
    setProperty('iconSong.scale.x', getProperty('iconP2.scale.x') - 0.35)
    setProperty('iconSong.scale.y', getProperty('iconP2.scale.y') - 0.35)
    setProperty('musicanIcon.scale.x', getProperty('iconP2.scale.x') - 0.35)
    setProperty('musicanIcon.scale.y', getProperty('iconP2.scale.y') - 0.35)
    setProperty('chartrIcon.scale.x', getProperty('iconP2.scale.x') - 0.35)
    setProperty('chartrIcon.scale.y', getProperty('iconP2.scale.y') - 0.35)
end

function onSongStart()
    doTweenX('hello', 'musicIcon', 0, 1, 'expoOut')
    doTweenX('befast', 'bgThing', 0, 1, 'expoOut')
    doTweenX('bals', 'beforeSongText', 74, 1, 'expoOut')
    doTweenX('bush', 'musicanIcon', 420, 1, 'expoOut')
    doTweenX('basls', 'iconSong', 390, 1, 'expoOut')
    doTweenX('balss', 'chartrIcon', 420, 1, 'expoOut')
    doTweenX('amogus', 'compTxt', 74, 1, 'expoOut')
    doTweenX('kys', 'charterTxt', 74, 1, 'expoOut')
    doTweenX('insertamongus', 'charterIcon', 10, 1, 'expoOut')
    doTweenX('thatsit', 'compIcon', 0, 1, 'expoOut')

    runTimer('getthefuckout-', 5, 1)
    runTimer('murder', 7, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'getthefuckout-' then
        doTweenX('bye', 'musicIcon', -1010, 1, 'BackInOut')
        doTweenX('eggs', 'beforeSongText', -1074, 1, 'BackInOut')
        doTweenX('dog', 'musicanIcon', -1400, 1, 'BackInOut')
        doTweenX('egsss', 'iconSong', -1380, 1, 'BackInOut')
        doTweenX('egdss', 'chartrIcon', -1400, 1, 'BackInOut')
        doTweenX('thatguy', 'compTxt', -1174, 1, 'BackInOut')
        doTweenX('beslow', 'bgThing', -1000, 1, 'BackInOut')
        doTweenX('lys', 'charterTxt', -1174, 1, 'BackInOut')
        doTweenX('insertstop', 'charterIcon', -1110, 1, 'BackInOut')
        doTweenX('thatsnotit', 'compIcon', -1110, 1, 'BackInOut')
    end
    if tag == 'murder' then
        removeLuaSprite('bye', true)
        removeLuaSprite('beforeSongText', true)
        removeLuaSprite('musicanIcon', true)
        removeLuaSprite('iconSong', true)
        removeLuaSprite('chartrIcon', true)
        removeLuaSprite('bgThing', true)
        removeLuaSprite('compTxt', true)
        removeLuaSprite('charterTxt', true)
        removeLuaSprite('charterIcon', true)
        removeLuaSprite('compIcon', true)
        notstopBro = false
    end
end