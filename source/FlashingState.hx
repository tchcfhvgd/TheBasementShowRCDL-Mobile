package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import openfl.Lib;
import CoolUtil;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var myeyes:FlxSprite;
	var warnText:FlxText;
	var warn:FlxText;
	var enjoy:FlxSprite;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		
		warn = new FlxText(0, 30, FlxG.width,
			"Hey, watch out!",
			32);
		warn.setFormat(Paths.font("vcr.ttf"), 72, FlxColor.WHITE, CENTER);
		FlxTween.color(warn, 2.6, FlxColor.WHITE, FlxColor.RED, {type: PINGPONG});
		add(warn);

		warnText = new FlxText(0, 30, FlxG.width,
			'This Project contains some flashing lights!, gore, and screen shake\nCase You Have Seisure, Press A to disable them now or go to Options Menu.\nElse, Press B to ignore this message.\n\nEnjoy The Show...',
			32);
		warnText.setFormat(Paths.font("vcr.ttf"), 34, FlxColor.WHITE, CENTER);
		warnText.applyMarkup(
			"This Project contains some $flashing lights$, *gore*, and screen shake.\nCase You Have Seizure, Press $A$ to disable them now or go to Options Menu.\nIf Not, Press *B* to ignore this message.",
			[
				new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF0000), "*"),
				new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFFF000), "$")
			]
		);
		warnText.screenCenter();
		add(warnText);

		enjoy = new FlxSprite(0, 500).loadGraphic(Paths.image('warning/enjoy'));
		enjoy.screenCenter(X);
		add(enjoy);

		myeyes = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		myeyes.alpha = 0;
		add(myeyes);

		addTouchPad("NONE", "A_B");
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT || controls.BACK) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(controls.ACCEPT) {
					FlxG.save.data.firstTime = false;
					FlxTween.tween(myeyes, {alpha: 1}, 1);
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							FlxTransitionableState.skipNextTransIn = true;
							FlxTransitionableState.skipNextTransOut = true;
							MusicBeatState.switchState(new ShadersState());
						});
					});
				} else if (controls.BACK) {
					FlxG.save.data.flashing = false;
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							FlxTransitionableState.skipNextTransIn = true;
							FlxTransitionableState.skipNextTransOut = true;
							MusicBeatState.switchState(new ShadersState());
						}
					});
				}
			}
		}
		super.update(elapsed);
	}
}
