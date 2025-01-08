package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = [
	'Note Colors', 
	'Controls', 
	'Graphics', 
	'Visuals and UI', 
	'Gameplay',
	'Mobile Options'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	function openSelectedSubstate(label:String) {
                        persistentUpdate = false;
			removeTouchPad();
		switch(label) {
			case 'Note Colors':
				openSubState(new options.NotesSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Mobile Options':
				openSubState(new mobile.options.MobileOptionsSubState());
		}
	}

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFea71fd;
		bg.updateHitbox();

		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter(Y);
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			optionText.x -= 1000;
			FlxTween.tween(optionText, {x: optionText.x + 1010}, 1, {ease: FlxEase.elasticInOut});
			grpOptions.add(optionText);
		}

		changeSelection();
		ClientPrefs.saveSettings();
		PlayState.qqqeb = true;

		addTouchPad("UP_DOWN", "A_B_C");
		
		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		persistentUpdate = true;
		removeTouchPad();
		addTouchPad("UP_DOWN", "A_B_C");
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			if (!ClientPrefs.fromPlaying && !FlxG.save.data.fromPlaying) {
			MusicBeatState.switchState(new MainMenuState());
			}
			else{
			LoadingState.loadAndSwitchState(new PlayState());
			}
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}

		if (touchPad != null && touchPad.buttonC.justPressed) {
			touchPad.active = touchPad.visible = persistentUpdate = false;
			openSubState(new mobile.MobileControlSelectSubState());
		}
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			item.color = 0xFFFFFFFF;
			if (item.targetY == 0) {
				item.alpha = 1;
				item.color = 0xFFFFACAC;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}
