package;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;

class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<FlxText>;

	var menuItems:Array<String> = [];
	var menuItemsOG:Array<String> = ['Resume', 'Restart Song', 'Options', 'Exit to menu'];
	var difficultyChoices = [];
	var curSelected:Int = 0;

	var pauseMusic:FlxSound;
	var practiceText:FlxText;
	var skipTimeText:FlxText;
	var skipTimeTracker:Alphabet;
	var curTime:Float = Math.max(0, Conductor.songPosition);
	//var botplayText:FlxText;

	var arrow:FlxSprite;
	var xy:FlxText;
	var item:FlxText;

	public static var songName:String = '';

	var char1:FlxSprite;
	var char2:FlxSprite;
	var char3:FlxSprite;

	var box:FlxSprite;

	var closeing:Bool = false;
	var blueballedTxt:FlxText;
	var levelInfo:FlxText;
	var bg:FlxSprite;
	var chartingText:FlxText;

	public function new(x:Float, y:Float)
	{
		super();
		if(CoolUtil.difficulties.length < 2) menuItemsOG.remove('Change Difficulty'); //No need to change difficulty if there is only one!

		if(PlayState.chartingMode)
		{
			menuItemsOG.insert(2, 'Leave Charting Mode');
			
			var num:Int = 0;
			if(!PlayState.instance.startingSong)
			{
				num = 1;
				menuItemsOG.insert(3, 'Skip Time');
			}
			menuItemsOG.insert(3 + num, 'End Song');
			menuItemsOG.insert(4 + num, 'Toggle Practice Mode');
			menuItemsOG.insert(5 + num, 'Toggle Botplay');
		}
		menuItems = menuItemsOG;

		for (i in 0...CoolUtil.difficulties.length) {
			var diff:String = '' + CoolUtil.difficulties[i];
			difficultyChoices.push(diff);
		}
		difficultyChoices.push('BACK');


		pauseMusic = new FlxSound();
		if(songName != null) {
			pauseMusic.loadEmbedded(Paths.music(songName), true, true);
		} else if (songName != 'None') {
			pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)), true, true);
		}
		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

	    box = new FlxSprite().loadGraphic(Paths.image('pause/box'));
		box.scale.set(0.2, 0.21);
		box.screenCenter();

		arrow = new FlxSprite(219).loadGraphic(Paths.image('pause/arrow'));
		arrow.alpha = 0;
		arrow.scale.set(0.07, 0.07);

		char1 = new FlxSprite();
		char1.alpha = 0;

		char2 = new FlxSprite(519, -55).loadGraphic(Paths.image('pause/right'));
		char2.alpha = 0;
		char2.scale.set(0.5, 0.5);

		char3 = new FlxSprite(569, -245);
		char3.alpha = 0;
		char3.scale.set(0.5, 0.5);

		FlxTween.tween(char1, {alpha: 1}, 0.4, {ease: FlxEase.sineInOut});
		FlxTween.tween(char2, {alpha: 1}, 0.4, {ease: FlxEase.sineInOut});
		FlxTween.tween(char3, {alpha: 1}, 0.4, {ease: FlxEase.sineInOut});
		FlxTween.tween(arrow, {alpha: 1}, 0.4, {ease: FlxEase.sineInOut});

		switch PlayState.SONG.song.toLowerCase() 
		{
			case 'house-for-sale':
				char1.loadGraphic(Paths.image('pause/left'));
				char1.x -= 220;
				char1.y += 50;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char1, {x: -20}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
			case 'invade':
				char1.loadGraphic(Paths.image('pause/left11'));
				char1.scale.set(0.85, 0.85);
				char1.x -= 220;
				char1.y += 50;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char1, {x: -32}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
			case 'evaporate':
				char1.loadGraphic(Paths.image('pause/left'));
				char1.x -= 250;
				char1.y += 50;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char1, {x: -20}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
				if(curStep == 1023) {
				char1.loadGraphic(Paths.image('pause/left1'));
				char1.x -= 60;
				char1.y += 70;
				}
			case 'sirokou':
				char1.loadGraphic(Paths.image('pause/left1'));
				char1.x -= 280;
				char1.scale.set(0.8, 0.8);
				char1.y += 120;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char1, {x: -40}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
			case 'blue' | 'tragical-comedy' | 'shattered':
				char1.loadGraphic(Paths.image('pause/left3'));
				char1.scale.set(0.8, 0.8);
				char1.x -= 280;
				char1.y += 125;
				char3.visible = false;
				FlxTween.tween(char2, {x: 319},0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char1, {x: -80}, 0.2, {ease: FlxEase.sineInOut});
			case 'funny-cartoon' | 'cats-carnival' | 'unstoppable-block':
				char1.loadGraphic(Paths.image('pause/left2'));
				char3.loadGraphic(Paths.image('pause/right3'));
				FlxTween.tween(char1, {x: -40}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
				char1.x -= 320;
				char1.y += 70;
				char3.scale.set(0.75, 0.75);
			case 'bloodncartoon':
				char1.loadGraphic(Paths.image('pause/left5'));
				FlxTween.tween(char1, {x: -100}, 0.2, {ease: FlxEase.sineInOut});
				char1.scale.set(1.1, 1.1);
				char1.x -= 300;
				char1.y += 250;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
			case 'splatter':
			    char1.loadGraphic(Paths.image('pause/left6'));
				char1.y += 200;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
			case 'chainsaw-maniac':
				char1.loadGraphic(Paths.image('pause/left7'));
				FlxTween.tween(char1, {x: -120}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				char1.x -= 320;
				char1.y += 10;
			case 'recurrence':
				char3.visible = false;
				char1.loadGraphic(Paths.image('pause/left4'));
				char2.loadGraphic(Paths.image('pause/right4'));
				FlxTween.tween(char1, {x: -50}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 739}, 0.2, {ease: FlxEase.sineInOut});
				char1.y += 250;
				char1.x -= 250;
				char2.x += 420;
				char2.y += 100;
				char1.scale.set(0.9, 0.9);
				char2.scale.set(0.6, 0.6);
			case 'come for revenge' | 'reburning':
				char1.scale.set(0.7, 0.7);
				char1.loadGraphic(Paths.image('pause/left8'));
				char1.x -= 220;
				char1.y += 140;
				char3.loadGraphic(Paths.image('pause/right2'));
				FlxTween.tween(char1, {x: -100}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				FlxTween.tween(char3, {x: 369}, 0.2, {ease: FlxEase.sineInOut});
			case 'desire or despair':
				char1.loadGraphic(Paths.image('pause/left10'));
				char1.x -= 60;
				char2.scale.set(0.55, 0.55);
				char1.y += 50;
				char2.loadGraphic(Paths.image('pause/right5'));
				char2.y += 5;
				char2.x -= 330;
				char3.visible = false;
			case 'meme mania':
				char1.loadGraphic(Paths.image('pause/left9'));
				char1.y += 75;
				char1.x -= 50;
				char2.loadGraphic(Paths.image('pause/right'));
				FlxTween.tween(char2, {x: 319}, 0.2, {ease: FlxEase.sineInOut});
				char3.visible = false;
			default:
				char2.visible = false;
				char3.visible = false;
				char1.visible = false;
		}

		add(char1);
		add(char3);
		add(char2);
		add(box); 
		add(arrow);

		grpMenuShit = new FlxTypedGroup<FlxText>();
		add(grpMenuShit);

		levelInfo = new FlxText(20, 15, 0, "", 32);
		levelInfo.scrollFactor.set();
		levelInfo.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		levelInfo.updateHitbox();
		add(levelInfo);

		if (PlayState.SONG.song == 'House for Sale OLD' || 
			PlayState.SONG.song == 'Jam OLD' || 
		    PlayState.SONG.song == 'Meme Mania OLD' ||
			PlayState.SONG.song == 'Invade OLDER' ||
			PlayState.SONG.song == 'Funny Cartoon OLD') {
			levelInfo.text += PlayState.SONG.song + ' - JerryWannaRat';
		}
		else if (PlayState.SONG.song == 'Black Humor') {
			levelInfo.text += PlayState.SONG.song + ' - Gh05t49_Crrr, Breath_Sans';
		}
		else if (PlayState.SONG.song == 'Triple Trouble') {
			levelInfo.text += PlayState.SONG.song + ' - MarStarBro, Juno, Punkett';
		}
		else if (PlayState.SONG.song == 'Invade OLD' || PlayState.SONG.song == 'Black Humor OLD') {
			levelInfo.text += PlayState.SONG.song + ' - CZTV-28';
		}
		else {
			levelInfo.text += PlayState.SONG.song + ' - ' + TBSFreeplayState.songCredits[TBSFreeplayState.curSelected];
		}

		var blueballedTxt:FlxText = new FlxText(20, 15 + 32, 0, "", 32);
		blueballedTxt.text = "Deaths : " + PlayState.deathCounter;
		blueballedTxt.scrollFactor.set();
		blueballedTxt.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		blueballedTxt.updateHitbox();
		add(blueballedTxt);

		practiceText = new FlxText(20, 15 + 101, 0, "PRACTICE MODE", 32);
		practiceText.scrollFactor.set();
		practiceText.setFormat(Paths.font('vcr.ttf'), 32);
		practiceText.x = FlxG.width - (practiceText.width + 20);
		practiceText.updateHitbox();
		practiceText.visible = PlayState.instance.practiceMode;
		add(practiceText);

		chartingText = new FlxText(20, 15 + 101, 0, "CHARTING MODE", 32);
		chartingText.scrollFactor.set();
		chartingText.setFormat(Paths.font('vcr.ttf'), 32);
		chartingText.x = FlxG.width - (chartingText.width + 20);
		chartingText.y = FlxG.height - (chartingText.height + 20);
		chartingText.updateHitbox();
		chartingText.visible = PlayState.chartingMode;
		add(chartingText);

		blueballedTxt.alpha = 0;
		levelInfo.alpha = 0;

		levelInfo.x = FlxG.width - (levelInfo.width + 20);
		blueballedTxt.x = FlxG.width - (blueballedTxt.width + 20);

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(levelInfo, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
		FlxTween.tween(blueballedTxt, {alpha: 1, y: blueballedTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.7});

		regenMenu();
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

		xy = new FlxText(0, 0);
			xy.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			//add(xy);

                addTouchPad(PlayState.chartingMode ? "LEFT_FULL" : "UP_DOWN", "A");
		addTouchPadCamera();
	}

	var holdTime:Float = 0;
	var cantUnpause:Float = 0.1;
	override function update(elapsed:Float)
	{
		cantUnpause -= elapsed;
		if (pauseMusic.volume < 0.5)
			pauseMusic.volume += 0.01 * elapsed;

		super.update(elapsed);
		updateSkipTextStuff();

		var fakeElapsed:Float = CoolUtil.boundTo(elapsed, 0, 1);

		box.scale.x = FlxMath.lerp(box.scale.x, 0.6, fakeElapsed * 18);
		box.scale.y = FlxMath.lerp(box.scale.y, 0.62, fakeElapsed * 18 * 2);

		xy.text = "x:" + FlxG.mouse.x + "y:" + FlxG.mouse.y;

		grpMenuShit.forEach(function(spr:FlxText)
		{
			spr.screenCenter(X);

		});

		if(closeing)
		{
			FlxTween.tween(arrow, {alpha: 0}, 0.1, {ease: FlxEase.sineInOut});	
			FlxTween.tween(char1, {alpha: 0}, 0.3, {ease: FlxEase.sineInOut});
		    FlxTween.tween(char2, {alpha: 0}, 0.3, {ease: FlxEase.sineInOut});
		    FlxTween.tween(char3, {alpha: 0}, 0.3, {ease: FlxEase.sineInOut});

			FlxTween.tween(char1, {x: -400}, 0.2, {ease: FlxEase.sineInOut});
			FlxTween.tween(char2, {x: 400}, 0.2, {ease: FlxEase.sineInOut});
			FlxTween.tween(char3, {x: 400}, 0.2, {ease: FlxEase.sineInOut});

			box.scale.x = FlxMath.lerp(box.scale.x, 0, fakeElapsed * 14);
			box.scale.y = FlxMath.lerp(box.scale.y, 0, fakeElapsed * 14 * 2);

			FlxTween.tween(bg, {alpha: 0}, 0.2, {ease: FlxEase.quartInOut});

			if (box.scale.x <= 0.35)
				close();
		}


		var lerpVal:Float = CoolUtil.boundTo(elapsed * 18.6, 0, 1);

		if (curSelected == 0) {
		    arrow.y = FlxMath.lerp(arrow.y, -5, lerpVal);
		    arrow.x = FlxMath.lerp(arrow.x, 260, lerpVal);
		}
		else if (curSelected == 1) {
		    arrow.y = FlxMath.lerp(arrow.y, 62, lerpVal);
		    arrow.x = FlxMath.lerp(arrow.x, 219, lerpVal);
		}
		else if (curSelected == 2) {
		    arrow.y = FlxMath.lerp(arrow.y, 122, lerpVal);
		    arrow.x = FlxMath.lerp(arrow.x, 255, lerpVal);
		}
		else if (curSelected == 3) {
		    arrow.y = FlxMath.lerp(arrow.y, 184, lerpVal);
		    arrow.x = FlxMath.lerp(arrow.x, 219, lerpVal);
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		var daSelected:String = menuItems[curSelected];
		switch (daSelected)
		{
			case 'Skip Time':
				if (controls.UI_LEFT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime -= 1000;
					holdTime = 0;
				}
				if (controls.UI_RIGHT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime += 1000;
					holdTime = 0;
				}

				if(controls.UI_LEFT || controls.UI_RIGHT)
				{
					holdTime += elapsed;
					if(holdTime > 0.5)
					{
						curTime += 45000 * elapsed * (controls.UI_LEFT ? -1 : 1);
					}

					if(curTime >= FlxG.sound.music.length) curTime -= FlxG.sound.music.length;
					else if(curTime < 0) curTime += FlxG.sound.music.length;
					updateSkipTimeText();
				}
		}

		if (accepted && (cantUnpause <= 0 || !ClientPrefs.controllerMode))
		{
			if (menuItems == difficultyChoices)
			{
				if(menuItems.length - 1 != curSelected && difficultyChoices.contains(daSelected)) {
					var name:String = PlayState.SONG.song;
					var poop = Highscore.formatSong(name, curSelected);
					PlayState.SONG = Song.loadFromJson(poop, name);
					PlayState.storyDifficulty = curSelected;
					MusicBeatState.resetState();
					FlxG.sound.music.volume = 0;
					PlayState.changedDifficulty = true;
					PlayState.chartingMode = false;
					return;
				}

				menuItems = menuItemsOG;
				regenMenu();
			}

			switch (daSelected)
			{
				case "Resume":
					closeing = true;
				case 'Change Difficulty':
					menuItems = difficultyChoices;
					deleteSkipTimeText();
					regenMenu();
					case "Options":
						MusicBeatState.switchState(new options.OptionsState());
						FlxG.sound.playMusic(Paths.music('freakyMenu'));
						PlayState.changedDifficulty = false;
						PlayState.chartingMode = false;
						ClientPrefs.fromPlaying = true;
						FlxG.save.data.fromPlaying = true;
				case 'Toggle Practice Mode':
					PlayState.instance.practiceMode = !PlayState.instance.practiceMode;
					PlayState.changedDifficulty = true;
					practiceText.visible = PlayState.instance.practiceMode;
				case "Restart Song":
					restartSong();
				case "Leave Charting Mode":
					restartSong();
					PlayState.chartingMode = false;
				case 'Skip Time':
					if(curTime < Conductor.songPosition)
					{
						PlayState.startOnTime = curTime;
						restartSong(true);
					}
					else
					{
						if (curTime != Conductor.songPosition)
						{
							PlayState.instance.clearNotesBefore(curTime);
							PlayState.instance.setSongTime(curTime);
						}
						close();
					}
				case "End Song":
					close();
					PlayState.instance.finishSong(true);
				case 'Toggle Botplay':
					PlayState.instance.cpuControlled = !PlayState.instance.cpuControlled;
					PlayState.changedDifficulty = true;
					PlayState.instance.botplayTxt.visible = PlayState.instance.cpuControlled;
					PlayState.instance.botplayTxt.alpha = 1;
					PlayState.instance.botplaySine = 0;
				case "Exit to menu":
					FlxG.save.data.fromPlaying = false;
					PlayState.deathCounter = 0;
					PlayState.seenCutscene = false;

					WeekData.loadTheFirstEnabledMod();
					if(PlayState.isStoryMode) {
						MusicBeatState.switchState(new StoryMenuState());
					} else {
						MusicBeatState.switchState(new TBSFreeplayState());
					}
					PlayState.cancelMusicFadeTween();
					FlxG.sound.playMusic(Paths.music('freakyMenu'));
					PlayState.changedDifficulty = false;
					PlayState.chartingMode = false;
			}
		}
	}

	function deleteSkipTimeText()
	{
		if(skipTimeText != null)
		{
			skipTimeText.kill();
			remove(skipTimeText);
			skipTimeText.destroy();
		}
		skipTimeText = null;
		skipTimeTracker = null;
	}

	public static function restartSong(noTrans:Bool = false)
	{
		PlayState.instance.paused = true; // For lua
		FlxG.sound.music.volume = 0;
		PlayState.instance.vocals.volume = 0;

		if(noTrans)
		{
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.resetState();
		}
		else
		{
			MusicBeatState.resetState();
		}
	}

	override function destroy()
	{
		pauseMusic.destroy();

		super.destroy();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelected += change;

		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		if (curSelected < 0)
			curSelected = grpMenuShit.length - 1;
		if (curSelected >= grpMenuShit.length)
			curSelected = 0;

		grpMenuShit.forEach(function(spr:FlxText)
			{
				spr.alpha = 1;
	
				if (spr.ID == curSelected)
				{
					spr.alpha = 1;
				}
			});
	}

	function regenMenu():Void {
		for (i in 0...grpMenuShit.members.length) {
			var obj = grpMenuShit.members[0];
			obj.kill();
			grpMenuShit.remove(obj, true);
			obj.destroy();
		}

		for (i in 0...menuItems.length) {

				item = new FlxText(0, (i * 62), 0, menuItems[i]);
				item.y += 250;
				item.ID = i;
				item.alpha = 0;
				item.setFormat(Paths.font("vcr.ttf"), 36, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				grpMenuShit.add(item);

				FlxTween.tween(item, {alpha: 1}, (i * 0) + 0.1, {ease: FlxEase.sineInOut});

				skipTimeText = new FlxText(0, 50, 0, '', 64);
				skipTimeText.setFormat(Paths.font("vcr.ttf"), 44, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				skipTimeText.scrollFactor.set();
				skipTimeText.borderSize = 2;
				//skipTimeTracker = item;
				add(skipTimeText);

				updateSkipTextStuff();
				updateSkipTimeText();
			if(closeing)
				FlxTween.tween(item, {alpha: 0}, (i * 0) + 0.1, {ease: FlxEase.sineInOut});
		}
		curSelected = 0;
		changeSelection();
	}
	
	function updateSkipTextStuff()
	{
		if(skipTimeText == null || skipTimeTracker == null) return;

		skipTimeText.x = skipTimeTracker.x + skipTimeTracker.width + 60;
		skipTimeText.y = skipTimeTracker.y;
		skipTimeText.visible = (skipTimeTracker.alpha >= 1);
	}

	function updateSkipTimeText()
	{
		skipTimeText.text = FlxStringUtil.formatTime(Math.max(0, Math.floor(curTime / 1000)), false) + ' - ' + FlxStringUtil.formatTime(Math.max(0, Math.floor(FlxG.sound.music.length / 1000)), false);
	}

	override function stepHit() {
		if(curStep == 1023 && PlayState.SONG.song.toLowerCase() == 'evaporate') {
			char1.loadGraphic(Paths.image('pause/left1'));
			char1.x -= 60;
			char1.y += 70;
		}
	}
}
