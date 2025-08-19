package states;

import backend.QuickMemBank;
import psychlua.EpicConstants;
import bobbydx.MathUtil as BMath;

class IntroSplashState extends ScriptedState
{
    var customTrans:Bool = false;
    var iconz:FlxSprite;

    override public function create():Void
    {
        FlxTransitionableState.skipNextTransIn = true;
	    FlxTransitionableState.skipNextTransOut = true;

        iconz = new FlxSprite().loadGraphic(Paths.image('healthHeads'));
        iconz.scale.set(BMath.E, BMath.E);
        iconz.screenCenter();
        callOnScripts('onLoad', ['iconz', iconz]);

        new FlxTimer().start(0.5, (tmr) -> {
            add(iconz);
            FlxG.sound.play(Paths.sound(EpicConstants.introSound), 1, false, null, true, () -> {
                new FlxTimer().start(0.1, (tmr) -> {
                    iconz.destroy();
                    callOnScripts('onIconDestroy');
                });
                new FlxTimer().start(0.5, (tmr) -> switchStuff());
            });
        });
    }

    public function switchStuff() {
        if (!customTrans) {
            MusicBeatState.switchState(new states.TitleState());
        }
        callOnScripts('onComplete');
    }
}