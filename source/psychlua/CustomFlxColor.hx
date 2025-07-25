package psychlua;

import flixel.util.FlxColor;

// CustomFlxColor rewrite provided by TheLeerName, thanks bro - bobbyDX

#if HSCRIPT_ALLOWED
@:publicFields
class CustomFlxColor
{
	static var instance:CustomFlxColor = new CustomFlxColor();
	function new() {}

	//color
	public static inline var TRANSPARENT:FlxColor = 0x00000000;
	public static inline var WHITE:FlxColor = 0xFFFFFFFF;
	public static inline var GRAY:FlxColor = 0xFF808080;
	public static inline var BLACK:FlxColor = 0xFF000000;

	public static inline var GREEN:FlxColor = 0xFF008000;
	public static inline var LIME:FlxColor = 0xFF00FF00;
	public static inline var YELLOW:FlxColor = 0xFFFFFF00;
	public static inline var ORANGE:FlxColor = 0xFFFFA500;
	public static inline var RED:FlxColor = 0xFFFF0000;
	public static inline var PURPLE:FlxColor = 0xFF800080;
	public static inline var BLUE:FlxColor = 0xFF0000FF;
	public static inline var BROWN:FlxColor = 0xFF8B4513;
	public static inline var PINK:FlxColor = 0xFFFFC0CB;
	public static inline var MAGENTA:FlxColor = 0xFFFF00FF;
	public static inline var CYAN:FlxColor = 0xFF00FFFF;

	// new functions which original FlxColor doesnt have
	function getRGB(color:Int):Array<Int> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.red, flxcolor.green, flxcolor.blue, flxcolor.alpha];
	}
	function getRGBFloat(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.redFloat, flxcolor.greenFloat, flxcolor.blueFloat, flxcolor.alphaFloat];
	}
	function getCMYK(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.cyan, flxcolor.magenta, flxcolor.yellow, flxcolor.black, flxcolor.alphaFloat];
	}
	function getHSB(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.hue, flxcolor.saturation, flxcolor.brightness, flxcolor.alphaFloat];
	}
	function getHSL(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.hue, flxcolor.saturation, flxcolor.lightness, flxcolor.alphaFloat];
	}

	// functions from original FlxColor, i know its unreadable, but u can find them in https://api.haxeflixel.com/flixel/util/FlxColor.html
	function fromRGB(Red:Int, Green:Int, Blue:Int, Alpha:Int = 255):Int
		return cast FlxColor.fromRGB(Red, Green, Blue, Alpha);
	function fromRGBFloat(Red:Float, Green:Float, Blue:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromRGBFloat(Red, Green, Blue, Alpha);
	function fromCMYK(Cyan:Float, Magenta:Float, Yellow:Float, Black:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromCMYK(Cyan, Magenta, Yellow, Black, Alpha);
	function fromHSB(Hue:Float, Sat:Float, Brt:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromHSB(Hue, Sat, Brt, Alpha);
	function fromHSL(Hue:Float, Sat:Float, Light:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromHSL(Hue, Sat, Light, Alpha);
	function fromString(str:String):Int
		return cast FlxColor.fromString(str);
	function getHSBColorWheel(Alpha:Int = 255):Array<Int>
		return cast FlxColor.getHSBColorWheel(Alpha);
	function interpolate(Color1:Int, Color2:Int, Factor:Float = 0.5):Int
		return cast FlxColor.interpolate(Color1, Color2, Factor);
	function gradient(Color1:Int, Color2:Int, Steps:Int, ?Ease:Float->Float):Array<Int>
		return cast FlxColor.gradient(Color1, Color2, Steps, Ease);
	function multiply(lhs:Int, rhs:Int):Int
		return cast FlxColor.multiply(lhs, rhs);
	function add(lhs:Int, rhs:Int):Int
		return cast FlxColor.add(lhs, rhs);
	function subtract(lhs:Int, rhs:Int):Int
		return cast FlxColor.subtract(lhs, rhs);
	function getComplementHarmony(color:Int):Int
		return cast FlxColor.fromInt(color).getComplementHarmony();
	function getAnalogousHarmony(color:Int, Threshold:Int = 30):CustomHarmony
		return cast FlxColor.fromInt(color).getAnalogousHarmony(Threshold);
	function getSplitComplementHarmony(color:Int, Threshold:Int = 30):CustomHarmony
		return cast FlxColor.fromInt(color).getSplitComplementHarmony(Threshold);
	function getTriadicHarmony(color:Int):CustomTriadicHarmony
		return cast FlxColor.fromInt(color).getTriadicHarmony();
	function to24Bit(color:Int):Int
		return color & 0xffffff;
	function toHexString(color:Int, Alpha:Bool = true, Prefix:Bool = true):String
		return cast FlxColor.fromInt(color).toHexString(Alpha, Prefix);
	function toWebString(color:Int):String
		return cast FlxColor.fromInt(color).toWebString();
	function getColorInfo(color:Int):String
		return cast FlxColor.fromInt(color).getColorInfo();
	function getDarkened(color:Int, Factor:Float = 0.2):Int
		return cast FlxColor.fromInt(color).getDarkened(Factor);
	function getLightened(color:Int, Factor:Float = 0.2):Int
		return cast FlxColor.fromInt(color).getLightened(Factor);
	function getInverted(color:Int):Int
		return cast FlxColor.fromInt(color).getInverted();
}
typedef CustomHarmony = {
	original:Int,
	warmer:Int,
	colder:Int
}
typedef CustomTriadicHarmony = {
	color1:Int,
	color2:Int,
	color3:Int
}
#end