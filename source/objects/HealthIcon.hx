package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.FlxG;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isPlayer:Bool = false;
	private var char:String = '';
	public var frameCount:Int = 2;
	public var autoAdjustOffset:Bool = true;
	private var iconOffsets:Array<Float> = [0, 0];

	public function new(char:String = 'face', isPlayer:Bool = false, ?allowGPU:Bool = true)
	{
		super();
		this.isPlayer = isPlayer;
		changeIcon(char, allowGPU);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 12, sprTracker.y - 30);
	}

	public function changeIcon(char:String, ?allowGPU:Bool = true)
	{
		if (this.char != char)
		{
			var name:String = 'icons/' + char;
			if (!Paths.fileExists('images/' + name + '.png', IMAGE))
				name = 'icons/icon-' + char;
			if (!Paths.fileExists('images/' + name + '.png', IMAGE))
				name = 'icons/icon-face';

			var graphic = Paths.image(name, allowGPU);
			var frameWidth:Int = Math.floor(graphic.width / frameCount);
			var frameHeight:Int = Math.floor(graphic.height);

			loadGraphic(graphic, true, frameWidth, frameHeight);

			// Adjust offsets based on frame size
			iconOffsets[0] = (width - 150) / frameCount;
			iconOffsets[1] = (height - 150) / frameCount;
			updateHitbox();

			// Add animation with all frames
			var animFrames = [for (i in 0...frames.frames.length) i];
			animation.add(char, animFrames, 0, false, isPlayer);
			animation.play(char);

			this.char = char;

			// Set antialiasing based on pixel icon
			if (char.endsWith('-pixel'))
				antialiasing = false;
			else
				antialiasing = ClientPrefs.data.antialiasing;
		}
	}

	public function setFrameCount(count:Int):Void
	{
		if (frameCount != count && graphic != null)
		{
			frameCount = count;

			var frameWidth:Int = Std.int(graphic.width / frameCount);
			var frameHeight:Int = Std.int(graphic.height);

			// Reload frames only
			loadGraphic(graphic, true, frameWidth, frameHeight);

			// Rebuild animation frames
			var animFrames = [for (i in 0...frames.frames.length) i];
			animation.add(char, animFrames, 0, false, isPlayer);
			animation.play(char);

			// Update offsets
			iconOffsets[0] = (width - 150) / frameCount;
			iconOffsets[1] = (height - 150) / frameCount;
			updateHitbox();
		}
	}


	override function updateHitbox()
	{
		super.updateHitbox();
		if (autoAdjustOffset)
		{
			offset.x = iconOffsets[0];
			offset.y = iconOffsets[1];
		}
	}

	public function getCharacter():String
		return char;
}
