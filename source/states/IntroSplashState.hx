package states;

import hxvlc.flixel.FlxVideoSprite;

import psychlua.Constants;
import shaders.BlueFade;

// this creates the lumen engine splash screen
// code based off of the nightmarevision engine splash screen by DuskieWhy
// video playback code by NotMrPolo from psych engine discord server
// this code assembly done by me [bobbyDX]

class IntroSplashState extends ScriptedState
{
	var videoCutscene:FlxVideoSprite;

	var introSoundNum:Int = Constants.introSoundCount;

	var spriteEvents:FlxTimer;
	var logo:FlxSprite;

	var videoPlaying:Bool = false;
	var logoPlaying:Bool = false;

	public static var doLogo:Bool = true;

	override function create()
	{
		preCreate();

		FlxG.autoPause = ClientPrefs.data.autoPause;

		if (Paths.fileExists('${Constants.introVideo}.${Paths.VIDEO_EXT}', BINARY, false, 'videos')) {
			startVideo(Constants.introVideo);
		} else {
			if (doLogo) {
				logoFunc();
			} else {
				finish();
			}
		}
	}

	public function startVideo(name:String)
    {
		videoPlaying = true;
		logoPlaying = false;
        videoCutscene = new FlxVideoSprite(0, 0);
        add(videoCutscene);
        videoCutscene.load(Paths.video(name));
        videoCutscene.play();
        videoCutscene.alpha = 1;
        videoCutscene.visible = true;
        videoCutscene.bitmap.onEndReached.add(function()
        {
            new FlxTimer().start(0.1, function(tmr:FlxTimer)
                {
					videoPlaying = false;
                	if (doLogo) {
						logoFunc();
					} else {
						finish();
					}
					videoCutscene.visible = false;
					videoCutscene.kill();
					videoCutscene = null;
                });
        });
    }

	function logoFunc()
	{
		var fadeShader = new BlueFade();

		logo = new FlxSprite().loadGraphic(Paths.image('opening/intro_${Constants.introLogo}'));
		logo.antialiasing = ClientPrefs.data.antialiasing;
		logo.screenCenter();
		logo.shader = fadeShader;
		logo.visible = false;
		add(logo);
		
		spriteEvents = new FlxTimer().start(1, (t0:FlxTimer) -> {
			new FlxTimer().start(0.25, (t1:FlxTimer) -> {
				FlxG.sound.volume = 1;
				introSoundNum = Math.floor(Math.random() * Constants.introSoundCount) + 1;
				FlxG.sound.play(Paths.sound('opening/${Constants.introSoundPrefix}${introSoundNum}'));
				logo.visible = true;
				logoPlaying = true;
				logo.scale.set(0.2, 1.25);
				new FlxTimer().start(1/16, (t2:FlxTimer) -> {
					logo.scale.set(1.25, 0.5);
					new FlxTimer().start(1/16, (t3:FlxTimer) -> {
						logo.scale.set(1.125, 1.125);
						FlxTween.tween(logo.scale, {x: 1, y: 1}, 0.25,
							{
								ease: FlxEase.elasticOut,
								onComplete: (t:FlxTween) -> {
									new FlxTimer().start(1, (t5:FlxTimer) -> {
										FlxTween.tween(logo.scale, {x: 0.2, y: 0.2}, 1.5, {ease: FlxEase.circIn});
										FlxTween.tween(fadeShader, {fadeVal: 0}, 1.5, {
											ease: FlxEase.circIn,
											onComplete: (t:FlxTween) -> {
												FlxTimer.wait(0.8, finish);
											}
										});
									});
								}
							});
					});
				});
			});
		});
	}

	var skipCooldown:Bool = false;

	override public function update(elapsed:Float):Void
	{
		preUpdate(elapsed);

		super.update(elapsed);

		if (!skipCooldown && FlxG.keys.justPressed.ANY)
		{
			skipCooldown = true;

			if (videoPlaying)
			{
				videoCutscene.stop();
				if (doLogo) {
					logoFunc();
				} else {
					finish();
				}
			}
			else if (logoPlaying)
			{
				finish();
			}
		}

		postUpdate(elapsed);
	}


	function finish()
	{
		logoPlaying = false;
		videoPlaying = false;
		if (spriteEvents != null)
		{
			spriteEvents.cancel();
			spriteEvents.destroy();
		}
		complete();
	}
	
	function complete()
	{
		FlxG.switchState(new states.TitleState());
	}
}

