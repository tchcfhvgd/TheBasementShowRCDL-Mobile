package;
// dude, i feel so fucking UBSR right now dude.
// basically UBSR warning shader screen but repolished and for psych engine.
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import flixel.math.FlxMath;
import lime.app.Application;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import Controls;
import openfl.ui.Mouse;

class ShadersState extends MusicBeatState
{
	var curSelected:Int = -1;
	var selected_something:Bool = true;
	var canSelect:Bool = false;
	var fText:FlxText;
	
	var curgraph:Array<String> = ["bad-PC", "good-PC"];
	var ogOffset:Array<Float> = [0, 0];
	var options:FlxTypedGroup<FlxSprite>;

	override function create()
	{
		super.create();
		FlxG.mouse.visible = true;

		options = new FlxTypedGroup();
		add(options);
	
		for (i in 0...curgraph.length)
		{
			var option:FlxSprite = new FlxSprite(-50, 0);
			option.loadGraphic(Paths.image("warning/" + curgraph[i]));
			option.ID = i;
			
			option.antialiasing = true;
			option.color = 0xFF7B7B7B;
	
			option.scale.set(0.7, 0.7);
			option.updateHitbox();
	
			option.screenCenter();
			option.x = (i * 700) + 100;
			option.y -= 90;
	
			ogOffset.push(option.offset.y);
	
			option.alpha = 0; option.y + 40;
			FlxTween.tween(option, {alpha: 1, y: option.y-40}, .3, {startDelay: .4 +  0.1*i});
	
			options.add(option);
	
			fText = new FlxText(60, 600, 1100, 308);
			fText.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			fText.applyMarkup(
				"Hello Player, this mod has *shaders*\nWe recommend you *turn off* the shader if your PC is *Low-End*\n\nChoose wisely",
				[
					new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF0000), "*")
				]
			);
			add(fText);
		}
	
		FlxG.camera.alpha = 0;
		(new FlxTimer()).start(.3, (_) -> {
			FlxTween.tween(FlxG.camera, {alpha: 1}, .3);
			selected_something = false;
			FlxG.camera.zoom = 0.8;
		});
	}


	var tottalTimer:Float = -.6;
	var zoomShit:Float = 0.9;
	override function update(elapsed:Float)
	{
		var overSomething:Bool = false;
		if (!selected_something) {
			if (FlxG.mouse.justMoved)
			{
				for (i=>option in options.members) {
					if (FlxG.mouse.overlaps(option)) {
						overSomething = true;
						changeItem(option.ID, true);
					}
				}
	
				if (!overSomething)
					changeItem(-1, true);
			}

			if (curSelected == 1 || curSelected == 0) {
				canSelect = true;
			}
			else {
				canSelect = false;
			}
	
			for (i=>option in options.members)
				option.offset.y = ogOffset[i] + ((Math.sin(tottalTimer + (i*.8)) * 10));
	
			if (controls.UI_RIGHT_P)
				changeItem(1, false);
			else if (controls.UI_LEFT_P)
				changeItem(-1, false);
	
			if (canSelect && FlxG.mouse.justPressed && FlxG.mouse.overlaps(options.members[curSelected]) || controls.ACCEPT) 
			{
				selected_something = true;

				FlxG.save.data.firstTime = false;
				FlxG.save.data.shaders = (curSelected == 0 ? false : true);
				ClientPrefs.shaders = (curSelected == 0 ? false : true);
	
				FlxG.sound.play(Paths.sound('confirmMenu'));
	
				for (i=>option in options.members)
					if (i != curSelected) 
						FlxTween.tween(option, {alpha:0}, 0.15);
					else {
						FlxTween.tween(option, {x: FlxG.width/2 - option.width/2, y: (FlxG.height/2 - option.height/2)-60}, 0.4, {ease: FlxEase.circOut});
						zoomShit = 1;
						FlxFlicker.flicker(option, .6, .05, true, false);
						(new FlxTimer()).start(0.6, (_) -> {option.visible = false;});
					}
						
	
				new FlxTimer().start(.7, function (tmr:FlxTimer) {
					MusicBeatState.switchState(new TitleState());
				});
			}
		}

		FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX-(FlxG.width/2)) * 0.008, (1/30)*240*elapsed);
		FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY-6-(FlxG.height/2)) * 0.008, (1/30)*240*elapsed);
	
		FlxG.camera.zoom = FlxMath.lerp(
			FlxG.camera.zoom, zoomShit * (.98 - 
			(Math.abs(((FlxG.mouse.screenX*0.4) + 
			(FlxMath.remapToRange(FlxG.mouse.screenY, 0, FlxG.height, 0, FlxG.width)*0.6))
			-(FlxG.width/2)) * 0.00001)), 
		(1/80)*240*elapsed);

		super.update(elapsed);
	}

	function changeItem(change:Int, force:Bool)
		{
			if (force && curSelected == change)
				return;
		
			if (curSelected != -1) {
				var prevText = options.members[curSelected];
				prevText.color = 0xFF7B7B7B;
			}
		
			if (force)
				curSelected = change;
			else {
				curSelected += change;
		
				if (curSelected >= options.members.length)
					curSelected = 0;
				if (curSelected < 0)
					curSelected = options.members.length - 1;
			}
		
			if (curSelected != -1) {
				FlxG.sound.play(Paths.sound("menu/scrollMenu"));
		
				var curText:FlxSprite = options.members[curSelected];   
				curText.color = 0xFFFFFF;
			}
		}
}
