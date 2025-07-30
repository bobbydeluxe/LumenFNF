package shaders;

import flixel.system.FlxAssets.FlxShader;
import flixel.tweens.FlxTween;

class BlueFade extends FlxShader
{
    public var fadeVal(default, set):Float;
    public var fadeRGB(default, set):Array<Float>; // [r,g,b]

    function set_fadeVal(val:Float):Float {
        fadeAmt.value = [val];
        fadeVal = val;
        return val;
    }

    function set_fadeRGB(val:Array<Float>):Array<Float> {
        if (val.length < 3) throw "fadeRGB must be [r,g,b]";
        fadeColor.value = [val[0], val[1], val[2]];
        fadeRGB = val;
        return val;
    }

    public function fade(startAmt:Float = 0, targetAmt:Float = 1, duration:Float, _options:TweenOptions):Void {
        fadeVal = startAmt;
        FlxTween.tween(this, {fadeVal: targetAmt}, duration, _options);
    }

    @:glFragmentSource('
        #pragma header

        uniform float fadeAmt;
        uniform vec3 fadeColor; // New RGB control

        void main()
        {
            vec4 tex = flixel_texture2D(bitmap, openfl_TextureCoordv);

            vec4 colorTarget = vec4(fadeColor.rgb, tex.a);
            vec4 finalColor = mix(colorTarget * fadeAmt, tex * fadeAmt, fadeAmt);

            gl_FragColor = finalColor;
        }
    ')
    public function new()
    {
        super();
        this.fadeVal = 1;
        this.fadeRGB = [0.0, 0.0, 1.0]; // Default to blue
    }
}
