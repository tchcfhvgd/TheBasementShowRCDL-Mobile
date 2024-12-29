package;

#if desktop
import Discord.DiscordClient;
#end
#if !flash 
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.Lib;
import flixel.util.FlxTimer;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.3'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var xval:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

	var shader1:Shaders.MenusGlow;
	var shader2:Shaders.MenusVCRShader;

	var char1:FlxSprite;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'credits',
		'options'
	];
	var modLogo:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var menuCreditTxt:FlxText;
	var cheaterTxt:FlxText;

	var cheatKeys:Int = 0;

	var debugKeys:Array<FlxKey>;
	var xy:FlxText;
	public static var firstStart:Bool = true;
	public var alreadySelected:Bool = false;
	public static var finishedFunnyMove:Bool = false;

	override function create()
	{
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		Lib.application.window.title = "The Basement Show - Main Menu";

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;
		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;
		FlxG.mouse.visible = true;

		var yScroll:Float = Math.max(0 - (0 * (optionShit.length - 0)), 0);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		char1 = new FlxSprite();
		char1.loadGraphic(Paths.image('mainmenuchar/freeplay'));
		char1.scrollFactor.set(0, 0);
		char1.x = 689;
		char1.y = 55;
		add(char1);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 0.8;
		if(optionShit.length > 0)
		{
			scale = 2.5 / optionShit.length;
		}

		Conductor.changeBPM(100);

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(30, (i * 140)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
			xval = xval - 0;
		}

		FlxG.camera.follow(camFollowPos, null, 1);

		modLogo = new FlxSprite(950, 20).loadGraphic(Paths.image('titlescreen/TBSLogo'));
		add(modLogo);
		modLogo.scale.set(0.4, 0.4);
		modLogo.scrollFactor.set(0, yScroll);
		modLogo.antialiasing = true;
		modLogo.updateHitbox();

        var versionShit:FlxText = new FlxText(12, FlxG.height - 64, 0, "The Basement Show v" + Application.current.meta.get('version') + "\nPsych Engine v0.6.3\nFriday Night Funkin' v0.2.8");
		versionShit.scrollFactor.set();
		versionShit.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		menuCreditTxt = new FlxText(0, 0, 0, "Now Playing: Main Theme\nBy 75_7", 8);
		menuCreditTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		menuCreditTxt.alpha = 0;
		menuCreditTxt.scrollFactor.set();
		menuCreditTxt.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuCreditTxt);

		cheaterTxt = new FlxText(FlxG.height, 0, 0, "Cheat Mode Activated", 8);
		cheaterTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		cheaterTxt.alpha = 0;
		cheaterTxt.scrollFactor.set();
		cheaterTxt.screenCenter();
		cheaterTxt.antialiasing = ClientPrefs.globalAntialiasing;
		add(cheaterTxt);

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

		if (ClientPrefs.shaders) {
			FlxG.game.filtersEnabled = true;
			shader1 = new Shaders.MenusGlow();
			shader1.size.value[0] = 16;
			shader1.dim.value[0] = 2;
			shader2 = new Shaders.MenusVCRShader();
			FlxG.camera.setFilters([new ShaderFilter(shader1),new ShaderFilter(shader2)]);
		}

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		xy = new FlxText(0, 0);
		xy.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		xy.scrollFactor.set(0, yScroll);
		//add(xy);

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end


	private var sickBeats:Int = 0; //Basically curBeat but won't be skipped if you hold the tab or resize the screen
	override function beatHit()
	{
		super.beatHit();
		FlxTween.tween(char1, {y: 85}, 0.3, {ease: FlxEase.quadOut, type: FlxTweenType.BACKWARD});
		FlxTween.tween(char1.scale, {y: 0.9}, 0.3, {ease: FlxEase.quadOut, type: FlxTweenType.BACKWARD});
		FlxTween.tween(modLogo.scale, {y: 0.45, x: 0.45}, 0.3, {ease: FlxEase.quadOut, type: FlxTweenType.BACKWARD});
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		if (Conductor.bpm != 100) {
			Conductor.changeBPM(100);
		}

		xy.text = "x:" + FlxG.mouse.x + "y:" + FlxG.mouse.y;

		char1.loadGraphic(Paths.image('mainmenuchar/' + optionShit[curSelected]));

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (FlxG.keys.justPressed.FIVE && ClientPrefs.canCheat) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			cheatKeys += 1;
			ClientPrefs.cheaterOn = true;
			FlxG.save.data.cheaterOn = true;
			FlxG.sound.play(Paths.sound('cancelMenu'));
			cheaterTxt.alpha = 1;
		}

		cheaterTxt.alpha =  FlxMath.lerp(cheaterTxt.alpha, 0, lerpVal);

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT && !alreadySelected)
			{
				alreadySelected = true; // prevents spamming.
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxTween.tween(FlxG.camera, {zoom: 2}, 0.5, {ease: FlxEase.quadOut});
							FlxTween.tween(char1, {alpha: 0}, 0.5, {ease: FlxEase.circOut});
							FlxTween.tween(spr, {x: 400, y: 300}, 0.5, {ease: FlxEase.quadInOut});
							    new FlxTimer().start(0.5, function(tmr:FlxTimer) {
								Lib.application.window.title = "The Basement Show";
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new TBSFreeplayState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										ClientPrefs.fromPlaying = false;
										FlxG.save.data.fromPlaying = false;
										MusicBeatState.switchState(new options.OptionsState());
								}
							    });
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
