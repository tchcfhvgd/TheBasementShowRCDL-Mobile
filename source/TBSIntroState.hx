import flixel.input.gamepad.mappings.MayflashWiiRemoteMapping;
import flixel.FlxState;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import openfl.utils.Assets as OpenFlAssets;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import lime.app.Application;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import Controls.Control;
import options.GraphicsSettingsSubState;

#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end

#if VIDEOS_ALLOWED
import vlc.MP4Handler;
#end

#if sys
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

class TBSIntroState extends MusicBeatState
{   
    override function create()
    {
        Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
        PlayerSettings.init();
        ClientPrefs.loadPrefs();

		if(FlxG.save.data.showFPS != null) {
			ClientPrefs.showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = ClientPrefs.showFPS;
			}
		}
		if(FlxG.save.data.framerate != null) {
			ClientPrefs.framerate = FlxG.save.data.framerate;
			if(ClientPrefs.framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = ClientPrefs.framerate;
				FlxG.drawFramerate = ClientPrefs.framerate;
			} else {
				FlxG.drawFramerate = ClientPrefs.framerate;
				FlxG.updateFramerate = ClientPrefs.framerate;
			}
		}
		if(FlxG.save.data.volume != null)
            {
                FlxG.sound.volume = FlxG.save.data.volume;
            }
            if (FlxG.save.data.mute != null)
            {
                FlxG.sound.muted = FlxG.save.data.mute;
        }

        FlxG.save.data.fromPlaying = false;
        FlxG.mouse.visible = false;
        new FlxTimer().start(1, function(guh:FlxTimer)
        {
        playVideoCall('BasementIntro');
        });
    }

    function playVideoCall(name:String)
        {
            #if VIDEOS_ALLOWED
            var filepath:String = Paths.video(name);
            #if sys
            if(!FileSystem.exists(filepath))
            #else
            if(!OpenFlAssets.exists(filepath))
            #end
            {
                FlxG.log.warn('Couldnt find video file: ' + name);
                return;
            }

            if(FlxG.save.data.showFPS != null) {
                ClientPrefs.showFPS = FlxG.save.data.showFPS;
                if(Main.fpsVar != null) {
                    Main.fpsVar.visible = ClientPrefs.showFPS;
                }
            }
            if(FlxG.save.data.framerate != null) {
                ClientPrefs.framerate = FlxG.save.data.framerate;
                if(ClientPrefs.framerate > FlxG.drawFramerate) {
                    FlxG.updateFramerate = ClientPrefs.framerate;
                    FlxG.drawFramerate = ClientPrefs.framerate;
                } else {
                    FlxG.drawFramerate = ClientPrefs.framerate;
                    FlxG.updateFramerate = ClientPrefs.framerate;
                }
            }
            if(FlxG.save.data.volume != null)
                {
                    FlxG.sound.volume = FlxG.save.data.volume;
                }
                if (FlxG.save.data.mute != null)
                {
                    FlxG.sound.muted = FlxG.save.data.mute;
            }

            var video:MP4Handler = new MP4Handler();
            video.playVideo(filepath);
            video.finishCallback = function()
            {
                MusicBeatState.switchState(new TitleState()); //this will make after the video done it will switch to the intro text/ title state
                return;
            }
            #else
            FlxG.log.warn('Platform not supported!');
            return;
            #end
        }
}
