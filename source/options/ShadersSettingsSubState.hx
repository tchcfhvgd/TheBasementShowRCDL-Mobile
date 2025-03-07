package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxCamera;
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
import openfl.Lib;

using StringTools;

class ShadersSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Shaders';
		rpcTitle = 'Shaders Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Menus', //Name
			'shader.', //Description
			'MenusShaders', //Save data variable name
			'bool', //Variable type
			true); //Default value
		addOption(option);
		
		var option:Option = new Option('OldTV', //Name
			'shader.', //Description
			'OldTVShader', //Save data variable name
			'bool', //Variable type
			true); //Default value
		addOption(option);
  
        var option:Option = new Option('Snowfall', //Name
			'shader.', //Description
			'snowfall', //Save data variable name
			'bool', //Variable type
			true); //Default value
		addOption(option);

		super();
	}

}
