package psychlua;

#if HSCRIPT_ALLOWED
import flixel.util.FlxColor;

@:publicFields
class CustomFlxColor
{
    // credits to TheLeerName for the flxcolor rewrite
    static var instance:CustomFlxColor = new CustomFlxColor();
	function new() {}

    // haxeflixel stock colors
    static inline var TRANSPARENT:FlxColor = 0x00000000;
	static inline var WHITE:FlxColor = 0xFFFFFFFF;
	static inline var GRAY:FlxColor = 0xFF808080;
	static inline var BLACK:FlxColor = 0xFF000000;

	static inline var GREEN:FlxColor = 0xFF008000;
	static inline var LIME:FlxColor = 0xFF00FF00;
	static inline var YELLOW:FlxColor = 0xFFFFFF00;
	static inline var ORANGE:FlxColor = 0xFFFFA500;
	static inline var RED:FlxColor = 0xFFFF0000;
	static inline var PURPLE:FlxColor = 0xFF800080;
	static inline var BLUE:FlxColor = 0xFF0000FF;
	static inline var BROWN:FlxColor = 0xFF8B4513;
	static inline var PINK:FlxColor = 0xFFFFC0CB;
	static inline var MAGENTA:FlxColor = 0xFFFF00FF;
	static inline var CYAN:FlxColor = 0xFF00FFFF;

    // new functions which original FlxColor doesn't have
    static inline function getRGB(color:Int):Array<Int> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.red, flxcolor.green, flxcolor.blue, flxcolor.alpha];
	}
	static inline function getRGBFloat(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.redFloat, flxcolor.greenFloat, flxcolor.blueFloat, flxcolor.alphaFloat];
	}
	static inline function getCMYK(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.cyan, flxcolor.magenta, flxcolor.yellow, flxcolor.black, flxcolor.alphaFloat];
	}
	static inline function getHSB(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.hue, flxcolor.saturation, flxcolor.brightness, flxcolor.alphaFloat];
	}
	static inline function getHSL(color:Int):Array<Float> {
		var flxcolor:FlxColor = FlxColor.fromInt(color);
		return [flxcolor.hue, flxcolor.saturation, flxcolor.lightness, flxcolor.alphaFloat];
	}

    // functions from original FlxColor. for more, check https://api.haxeflixel.com/flixel/util/FlxColor.html
    static inline function fromRGB(Red:Int, Green:Int, Blue:Int, Alpha:Int = 255):Int
		return cast FlxColor.fromRGB(Red, Green, Blue, Alpha);

	static inline function fromRGBFloat(Red:Float, Green:Float, Blue:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromRGBFloat(Red, Green, Blue, Alpha);

	static inline function fromCMYK(Cyan:Float, Magenta:Float, Yellow:Float, Black:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromCMYK(Cyan, Magenta, Yellow, Black, Alpha);

	static inline function fromHSB(Hue:Float, Sat:Float, Brt:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromHSB(Hue, Sat, Brt, Alpha);

	static inline function fromHSL(Hue:Float, Sat:Float, Light:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromHSL(Hue, Sat, Light, Alpha);

	static inline function fromString(str:String):Int
		return cast FlxColor.fromString(str);

	static inline function getHSBColorWheel(Alpha:Int = 255):Array<Int>
		return cast FlxColor.getHSBColorWheel(Alpha);

	static inline function interpolate(Color1:Int, Color2:Int, Factor:Float = 0.5):Int
		return cast FlxColor.interpolate(Color1, Color2, Factor);

	static inline function gradient(Color1:Int, Color2:Int, Steps:Int, ?Ease:Float->Float):Array<Int>
		return cast FlxColor.gradient(Color1, Color2, Steps, Ease);

	static inline function multiply(lhs:Int, rhs:Int):Int
		return cast FlxColor.multiply(lhs, rhs);

	static inline function add(lhs:Int, rhs:Int):Int
		return cast FlxColor.add(lhs, rhs);

	static inline function subtract(lhs:Int, rhs:Int):Int
		return cast FlxColor.subtract(lhs, rhs);

	static inline function getComplementHarmony(color:Int):Int
		return cast FlxColor.fromInt(color).getComplementHarmony();

	static inline function getAnalogousHarmony(color:Int, Threshold:Int = 30):CustomHarmony
		return cast FlxColor.fromInt(color).getAnalogousHarmony(Threshold);

	static inline function getSplitComplementHarmony(color:Int, Threshold:Int = 30):CustomHarmony
		return cast FlxColor.fromInt(color).getSplitComplementHarmony(Threshold);

	static inline function getTriadicHarmony(color:Int):CustomTriadicHarmony
		return cast FlxColor.fromInt(color).getTriadicHarmony();

	static inline function to24Bit(color:Int):Int
		return color & 0xffffff;

	static inline function toHexString(color:Int, Alpha:Bool = true, Prefix:Bool = true):String
		return cast FlxColor.fromInt(color).toHexString(Alpha, Prefix);

	static inline function toWebString(color:Int):String
		return cast FlxColor.fromInt(color).toWebString();

	static inline function getColorInfo(color:Int):String
		return cast FlxColor.fromInt(color).getColorInfo();

	static inline function getDarkened(color:Int, Factor:Float = 0.2):Int
		return cast FlxColor.fromInt(color).getDarkened(Factor);

	static inline function getLightened(color:Int, Factor:Float = 0.2):Int
		return cast FlxColor.fromInt(color).getLightened(Factor);
    
	static inline function getInverted(color:Int):Int
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