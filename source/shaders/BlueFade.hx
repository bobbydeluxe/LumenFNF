package shaders;

import flixel.system.FlxAssets.FlxShader;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class BlueFade extends FlxShader
{
  public var fadeVal(default, set):Float;
  public var fadeRGB(default, set):Array<Float>; // [r,g,b] multipliers

  function set_fadeVal(val:Float):Float
  {
    fadeAmt.value = [val];
    fadeVal = val;
    return val;
  }

  function set_fadeRGB(val:Array<Float>):Array<Float>
  {
    if (val.length < 3) throw "fadeRGB must be [r,g,b]";
    fadeR.value = [val[0]];
    fadeG.value = [val[1]];
    fadeB.value = [val[2]];
    fadeRGB = val;
    return val;
  }

  public function fade(startAmt:Float = 0, targetAmt:Float = 1, duration:Float, _options:TweenOptions):Void
  {
    fadeVal = startAmt;
    FlxTween.tween(this, {fadeVal: targetAmt}, duration, _options);
  }

  @:glFragmentSource('
        #pragma header

        uniform float fadeAmt;
        uniform float fadeR;
        uniform float fadeG;
        uniform float fadeB;

        void main()
        {
          vec4 tex = flixel_texture2D(bitmap, openfl_TextureCoordv);

          // use customizable RGB instead of hardcoded 0.0, 0.0, tex.b
          vec4 finalColor = mix(
            vec4(vec4(tex.r * fadeR, tex.g * fadeG, tex.b * fadeB, tex.a) * fadeAmt),
            vec4(tex * fadeAmt),
            fadeAmt
          );

          gl_FragColor = finalColor;
        }
    ')
  public function new()
  {
    super();
    this.fadeVal = 1;
    this.fadeRGB = [0.0, 0.0, 1.0]; // default blue effect
  }
}
