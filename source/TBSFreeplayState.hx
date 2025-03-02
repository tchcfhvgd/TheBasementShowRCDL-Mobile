package;
// ye ik the state is kind of hard coded
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.math.FlxMath;
import flixel.tweens.FlxTween;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.Lib;
import flixel.FlxG;
import flixel.util.FlxTimer;

#if !flash 
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;
#end

class TBSFreeplayState extends MusicBeatState
{
	public static var freeplays:Array<String> = ['House-for-Sale', 'Evaporate', 'Sirokou']; // freeplay songs
	public static var songCredits:Array<String> = ['Wind', 'Rhodes_W', 'NaglazGYamiZaleD'];
	public static var curCategory:Int = 0; // current selection
	public static var curWeekThing:Float = 0; // current catagories

	public var alreadySelected:Bool = false;
	
	var curDifficulty2:Int = 0;

	var menuCreditTxt:FlxText;

	var unThing:Bool = false;

	public static var chosendifficulty:String = 'hard'; // for old versions
	public static var alterVersions:Float = 0; // current selected difficulty

    var hasVersion:Bool = false; // checks if song has the support
	var highscoreTxt:FlxText;
	var isInSubstate:Bool = false; // checks if you entered the song version screen

	// score stuff
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;

	var grpCats:FlxTypedGroup<FlxSprite>;
   public static var curSelected:Int = 0; // current song
	var limits:Int = 0; // limits in number (how much versions does a song has)
	var BG:FlxSprite;
	var shader1:Shaders.MenusGlow;
	var shader2:Shaders.MenusVCRShader;
	var selectedTxt:FlxText;
	public static var altBG:FlxSprite;
	public static var imageThing:FlxSprite;
	public static var songNameThing:FlxSprite;
	var songbox:FlxSprite;
	var songtext:FlxSprite;
	var blackScreen:FlxSprite;
	var xy:FlxText;
	var compTxt:FlxText;
	var songchar:FlxSprite;

	override function create()
	{
		//Paths.clearStoredMemory();
		//Paths.clearUnusedMemory();
		
		BG = new FlxSprite().loadGraphic(Paths.image('freeplay/backBG'));
		BG.updateHitbox();
		BG.screenCenter();
		add(BG);

		Conductor.changeBPM(160);

		FlxG.camera.zoom = 2;
		FlxG.camera.scroll.x = -250;
		FlxG.camera.scroll.y = 10;
		FlxTween.tween(FlxG.camera, {zoom: 1}, 1.5, {ease: FlxEase.circInOut});
		FlxTween.tween(FlxG.camera.scroll, {x: 0, y: 0}, 1.5, {ease: FlxEase.circInOut});
		new FlxTimer().start(1.6, function(tmr:FlxTimer) {
			unThing = true;
		});

		if (ClientPrefs.shaders) {
			FlxG.game.filtersEnabled = true;
			shader1 = new Shaders.MenusGlow();
			shader1.size.value[0] = 16;
			shader1.dim.value[0] = 2;
			shader2 = new Shaders.MenusVCRShader();
			FlxG.camera.setFilters([new ShaderFilter(shader1),new ShaderFilter(shader2)]);
		}

		PlayState.isStoryMode = false;

		FlxG.sound.playMusic(Paths.music('freeplay'), 1);

		var arrows:FlxSprite = new FlxSprite(300, 230).loadGraphic(Paths.image('freeplay/arrows'));
		add(arrows);

		grpCats = new FlxTypedGroup<FlxSprite>();
		add(grpCats);

		for (i in 0...freeplays.length)
		{
			songbox = new FlxSprite(150, (i * 0)).loadGraphic(Paths.image('freeplay/songs/' + freeplays[i]));
			songbox.ID = i;
			songbox.screenCenter(Y);
			songbox.alpha = 0;
			grpCats.add(songbox);
		}
		songtext = new FlxSprite(190, -40).loadGraphic(Paths.image('freeplay/songs/House-for-Sale'));
		songtext.screenCenter(); // i made it centered max hope u feel happy -- mrsropical
		songtext.x -= 280;
		add(songtext);

		selectedTxt = new FlxText(350, 580, FlxG.width, "", 8);
		selectedTxt.setFormat(Paths.font("vcr.ttf"), 35, 0xFFFFFFFF, CENTER, FlxTextBorderStyle.OUTLINE, 0xFF000000);
		selectedTxt.screenCenter(X);
		selectedTxt.antialiasing = true;
		add(selectedTxt);

		highscoreTxt = new FlxText(170, 150, 1200, "High Score : 100000000", 8);
		highscoreTxt.setFormat(Paths.font("vcr.ttf"), 35, 0xFFFFFFFF, LEFT, FlxTextBorderStyle.OUTLINE, 0xFF000000);
		highscoreTxt.antialiasing = true;
		add(highscoreTxt);

		compTxt = new FlxText(-250, songtext.height + 440, 1200, "Wind", 8);
		compTxt.setFormat(Paths.font("vcr.ttf"), 35, 0xFFFFFFFF, CENTER, FlxTextBorderStyle.OUTLINE, 0xFF000000);
		compTxt.antialiasing = true;
		add(compTxt);

		songchar = new FlxSprite(842, 250);
		//songchar.screenCenter(Y);
		add(songchar);

		menuCreditTxt = new FlxText(0, FlxG.height - 50, -100, "Now Playing: Forbidden Secrets (Freeplay Theme)\nBy Breath_Sans", 8);
		menuCreditTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		menuCreditTxt.alpha = 0;
		menuCreditTxt.y -= 20;
		menuCreditTxt.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuCreditTxt);

		FlxTween.tween(menuCreditTxt, {alpha: 1}, 1.5, {
			ease: FlxEase.quadInOut, 
			startDelay: 1,
			onComplete: 
			function (twn:FlxTween)
				{
					FlxTween.tween(menuCreditTxt, {alpha: 0}, 1.5, {
						ease: FlxEase.quadInOut, startDelay: 2});
				}
		});

		changeSelection();

		xy = new FlxText(0, 0);
		xy.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		//add(xy);

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		blackScreen.alpha = 0;
		add(blackScreen);

		var infoDifficulty:FlxSprite = new FlxSprite(-583).loadGraphic(Paths.image('freeplay/infoDifficulty'));
		infoDifficulty.screenCenter(Y);
		add(infoDifficulty);

		altBG = new FlxSprite().loadGraphic(Paths.image('freeplay/diffPanel'));
		altBG.screenCenter();
		altBG.y -= 650;
		add(altBG);

		imageThing = new FlxSprite(860, 250).loadGraphic(Paths.image('freeplay/pictures/Vanishing-OLD'));
		imageThing.y -= 650;
		add(imageThing);

		songNameThing = new FlxSprite(320, 360).loadGraphic(Paths.image('freeplay/songs/Vanishing-OLD'));
		songNameThing.y -= 650;
		add(songNameThing);
		
        super.create();

	addTouchPad("LEFT_FULL", "A_B_C");
	}
	
        override function closeSubState() {
		super.closeSubState();
		removeTouchPad();
		addTouchPad("LEFT_FULL", "A_B_C");
	}

        override public function update(elapsed:Float)
	{
			curDifficulty2 = Math.round(Math.max(0, 0));
		
		intendedScore = Highscore.getScore(freeplays[curSelected], curDifficulty2);
		intendedRating = Highscore.getRating(freeplays[curSelected], curDifficulty2);
		
		xy.text = "x:" + FlxG.mouse.x + "y:" + FlxG.mouse.y;
		songtext.loadGraphic(Paths.image((freeplays[curSelected] == '???' ? 'freeplay/songs/unknown' : 'freeplay/songs/' + freeplays[curSelected])));

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		var ratingSplit:Array<String> = Std.string(Highscore.floorDecimal(lerpRating * 100, 2)).split('.');
		if(ratingSplit.length < 2) { //No decimals, add an empty space
			ratingSplit.push('');
		}
		
		while(ratingSplit[1].length < 2) { //Less than 2 decimals in it, add decimals then
			ratingSplit[1] += '0';
		}

		highscoreTxt.text = 'High Score: ' + lerpScore + ' (' + ratingSplit.join('.') + '%)';

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 4.6, 0, 1);

		if (blackScreen.alpha != 0) {
		blackScreen.alpha = FlxMath.lerp(blackScreen.alpha, 0, lerpVal);
		}

		if (controls.UI_UP_P && !isInSubstate) 
		{
		changeSelection(-1);
		blackScreen.alpha = 1;
		}

		if (controls.UI_RIGHT_P && curWeekThing != 10 && !isInSubstate) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			curSelected = 0;
			curWeekThing += 1;
			blackScreen.alpha = 1;
		}

		if (controls.UI_LEFT_P && curWeekThing != 0 && !isInSubstate) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			curSelected = 0;
			curWeekThing -= 1;
			blackScreen.alpha = 1;
		}

		if(FlxG.keys.justPressed.CONTROL || touchPad.buttonC.justPressed)
			{
				persistentUpdate = false;
				touchPad.active = touchPad.visible = persistentUpdate = false;
				openSubState(new GameplayChangersSubstate());
			}

		if (controls.UI_LEFT_P && alterVersions != 0 && isInSubstate) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			alterVersions -= 1;
		}

		if (controls.UI_RIGHT_P && alterVersions != limits && isInSubstate) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			alterVersions += 1;
		}

		if (controls.UI_DOWN_P && !isInSubstate) 
		{
		changeSelection(1);
		blackScreen.alpha = 1;
		}

		compTxt.text = songCredits[curSelected];

		if (controls.BACK && !isInSubstate) {
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
			chosendifficulty = 'hard';
		}

        if (controls.ACCEPT && freeplays[curSelected] != '???' && !hasVersion && !alreadySelected) {
			alreadySelected = true; // prevents spamming.
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
			unThing = false;
			FlxTween.tween(FlxG.camera, {zoom: 2}, 1.5, {ease: FlxEase.circInOut});
			FlxTween.tween(FlxG.camera.scroll, {x: 300}, 1.5, {ease: FlxEase.circInOut});
			new FlxTimer().start(1, function(tmr:FlxTimer) {
			PlayState.SONG = Song.loadFromJson(freeplays[curSelected] + '-' + chosendifficulty, freeplays[curSelected]);
			LoadingState.loadAndSwitchState(new PlayState());	
			});
        }

		if (controls.ACCEPT && hasVersion && isInSubstate) {
			PlayState.SONG = Song.loadFromJson(freeplays[curSelected] + '-' + chosendifficulty, freeplays[curSelected]);
			LoadingState.loadAndSwitchState(new PlayState());
		}

        if (controls.ACCEPT && freeplays[curSelected] == '???') {
			FlxG.camera.shake(0.01, 0.01);
        }

        if (controls.ACCEPT && hasVersion && !isInSubstate) {
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
			alterVersions = 0;
			isInSubstate = true;
			FlxTween.tween(altBG, {y: altBG.y + 650}, 1, {ease: FlxEase.elasticInOut});
			FlxTween.tween(songNameThing, {y: songNameThing.y + 650}, 1, {ease: FlxEase.elasticInOut});
			FlxTween.tween(imageThing, {y: imageThing.y + 650}, 1, {ease: FlxEase.elasticInOut});
        }

		if (controls.BACK && isInSubstate) {
			isInSubstate = false;
			FlxTween.tween(altBG, {y: altBG.y - 650}, 1, {ease: FlxEase.circOut});
			FlxTween.tween(songNameThing, {y: songNameThing.y - 650}, 1, {ease: FlxEase.circOut});
			FlxTween.tween(imageThing, {y: imageThing.y - 650}, 1, {ease: FlxEase.circOut});
		}

		switch (alterVersions)
		{
			case 0: 
			chosendifficulty = 'hard';
			case 1: 
			chosendifficulty = 'old';
			case 2: 
			chosendifficulty = 'older';
		}

        switch (freeplays[curSelected])
        {
        case 'Invade' :
		limits = 2;
        hasVersion = true;
		case 'House-for-Sale' | 'Vanishing' | 'Sirokou' | 'Tragical-Comedy' | 'Funny-Cartoon' | 'BloodNcartoon' | 'Splatter' | 'None-of-All' |
		'Black-Humor' | 'Jam' | 'Meme-Mania' | 'War-of-Whiskers':
		limits = 1;
		hasVersion = true;
        default :
        hasVersion = false;
		chosendifficulty = 'hard';
        }

		switch(chosendifficulty)
		{
			case 'hard':
				imageThing.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
				songNameThing.loadGraphic(Paths.image('freeplay/songs/' + freeplays[curSelected]));
			case 'old':
				imageThing.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected] + '-OLD'));
				songNameThing.loadGraphic(Paths.image('freeplay/songs/' + freeplays[curSelected] + '-OLD'));
			case 'older':
				imageThing.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected] + '-OLDIR'));
				songNameThing.loadGraphic(Paths.image('freeplay/songs/' + freeplays[curSelected] + '-OLDIR'));
		}

        curCategory = curSelected;

		switch (curWeekThing)
		{
		case 0:
			Lib.application.window.title = "The Basement Show: Freeplay 1: Secret Of Nobody - " + freeplays[curSelected];
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			selectedTxt.text = 'Secret Of Nobody >';
			freeplays = ['House-for-Sale', 'Evaporate', 'Sirokou'];
			songCredits = ['Wind', 'Rhodes_W', 'NaglazGYamiZaleD'];
		case 1:
			Lib.application.window.title = "The Basement Show: Freeplay 2: Love is Hopeless - " + freeplays[curSelected];
			songchar.loadGraphic(Paths.image('freeplay/pictures/blue-tom'));
			selectedTxt.text = '< Love Is Hopeless >';
			freeplays = ['Blue', 'Tragical-Comedy', 'Shattered'];
			songCredits = ['JerryWannaRat', 'HeroComics', 'C-air'];
		case 2:
			Lib.application.window.title = "The Basement Show: Freeplay 3: Glitch House - " + freeplays[curSelected];
			songchar.loadGraphic(Paths.image('freeplay/pictures/pibby-tom'));
			selectedTxt.text = '< Glitch House >';
			freeplays = ['Funny-Cartoon', 'Cats-Carnival', 'Unstoppable-Block'];
			songCredits = ['Gh05t49_Crrr', 'Thunder137', 'Thunder137'];
		case 3:
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			selectedTxt.text = '< Bloody Waltz >';
			Lib.application.window.title = "The Basement Show: Freeplay 4: Bloody Waltz - " + freeplays[curSelected];
			freeplays = ['BloodNcartoon', 'Splatter', 'Chainsaw-Maniac'];
			songCredits = ['Breath_Sans', 'Breath_Sans', 'CZTV-28'];
		case 4:
			songchar.loadGraphic(Paths.image((freeplays[curSelected] == '???' ? 'freeplay/pictures/unknown' : 'freeplay/pictures/' + freeplays[curSelected])));
			Lib.application.window.title = "The Basement Show: Freeplay 5:  Dreamland Of Angel (Demo) - " + freeplays[curSelected];
			selectedTxt.text = '< DreamLand Of Angel >';
			freeplays = ['None-of-All', '???', '???'];
			songCredits = ['HeroComics', '', ''];
		case 5:
			songchar.loadGraphic(Paths.image('freeplay/pictures/unknown'));
			Lib.application.window.title = "The Basement Show: Freeplay 6:  VHS Tapes Rewind (Coming Soon) - " + freeplays[curSelected];
			selectedTxt.text = '< VHS Tape Rewind >';
			freeplays = ['???', '???', '???'];
			songCredits = ['', '', ''];
		case 6:
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			Lib.application.window.title = "The Basement Show: Freeplay 7: D-sides - " + freeplays[curSelected];
			selectedTxt.text = '< Dsides >';
			freeplays = ['Come-for-Revenge', 'Reburning', 'Paralyzed'];
			songCredits = ['JerryWannaRat', 'Rhodes_W', 'Gh05t49_Crrr'];
		case 7:
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			Lib.application.window.title = "The Basement Show: Freeplay 8: OCs - " + freeplays[curSelected];
			selectedTxt.text = '< OCs >';
			freeplays = ['Jam', 'Desire-or-Despair', 'Frozen-Bell'];
			songCredits = ['Breath_Sans', 'Rhodes_W', 'Oil'];
		case 8:
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			Lib.application.window.title = "The Basement Show: Freeplay 9: Extras - " + freeplays[curSelected];
			selectedTxt.text = '< Extras >';
			freeplays = ['Vanishing', 'Invade', 'Black-Humor', 'Mucho-Mouse', 'Hydrophobia', 'Recurrence'];
			songCredits = ['DOGE122', 'HeroComics', 'Gh05t49_Crrr\nBreath_Sans', 'JerryWannaRat', 'NaglazGYamiZaleD', '75_7'];
		case 9:
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			Lib.application.window.title = "The Basement Show: Freeplay 10: Memes - " + freeplays[curSelected];
			selectedTxt.text = '< Memes >';
			freeplays = ['Meme-Mania', 'Steep-Slopes', 'Faded'];
			songCredits = ['Breath_Sans', 'HeroComics', 'HeroComics'];
		case 10:
			songchar.loadGraphic(Paths.image('freeplay/pictures/' + freeplays[curSelected]));
			Lib.application.window.title = "The Basement Show: Freeplay 11: Mixes & Covers - " + freeplays[curSelected];
			selectedTxt.text = '< Mixes And Covers';
			freeplays = ['War-of-Whiskers', 'Kaboom'];
			songCredits = ['Gh05t49_Crrr', 'Bbpanzu'];
		}

        super.update(elapsed);
	}
	private var sickBeats:Int = 0; //Basically curBeat but won't be skipped if you hold the tab or resize the screen
	override function beatHit()
	{
	super.beatHit();
		FlxTween.tween(FlxG.camera, {zoom: 1.2}, 0.3, {ease: FlxEase.quadOut, type: FlxTweenType.BACKWARD});
	}
	function changeSelection(change:Int = 0)
	{
		intendedScore = Highscore.getScore(freeplays[curSelected], curDifficulty2);
		intendedRating = Highscore.getRating(freeplays[curSelected], curDifficulty2);
		
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeplays.length - 1;
		if (curSelected >= freeplays.length)
			curSelected = 0;

		grpCats.forEach(function(spr:FlxSprite)
		{
			spr.visible = false;
	
			if (spr.ID == curSelected)
			{
				spr.visible = true;
			}
		});

		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	function changeVersion(changes:Int = 0)
		{
			alterVersions += changes;
			if (alterVersions >= limits)
				alterVersions = 0;
			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
}
