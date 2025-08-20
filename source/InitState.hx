package;

import mikolka.vslice.components.ScreenshotPlugin;
import flixel.input.keyboard.FlxKey;
import backend.QuickMemBank;
import states.StoryMenuState;

import psychlua.HScript;
import psychlua.GlobalScriptHandler;
import objects.video.Video4;

class InitState extends ScriptedState {
    public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];

    override public function create():Void
	{
        preCreate(); // init scripting

		Difficulty.resetList();
		Highscore.load();

		HScript.init();
		GlobalScriptHandler.init();

		ClientPrefs.loadDefaultKeys();

		#if VIDEOS_ALLOWED
		Video4.init();
		#end

        #if LUA_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();
		
		#if ACHIEVEMENTS_ALLOWED Achievements.load(); #end

		ClientPrefs.loadPrefs();

        QuickMemBank.clear();

        FlxTransitionableState.skipNextTransIn = true;
	    FlxTransitionableState.skipNextTransOut = true;

        FlxG.autoPause = ClientPrefs.data.autoPause;

		Language.reloadPhrases();

        if (FlxG.save.data != null && FlxG.save.data.fullscreen)
        {
            FlxG.fullscreen = FlxG.save.data.fullscreen;
            // trace('LOADED FULLSCREEN SETTING!!');
        }
        // persistentUpdate = true;
        // persistentDraw = true;

        if (FlxG.save.data.weekCompleted != null)
		{
			StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}

        ScreenshotPlugin.initialize();
        FlxG.switchState(new states.IntroSplashState());
	}
}