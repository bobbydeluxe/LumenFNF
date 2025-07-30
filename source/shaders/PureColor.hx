package shaders;
import flixel.util.FlxColor;

class PureColor extends FlxShader
{
  public var color(default, set):FlxColor;
  public var active(default, set):Bool;
  public var antialias(default, set):Float;

  function set_active(bol:Bool):Bool
  {
    colSet.value = [bol];
    return bol;
  }

  function set_color(val:FlxColor):FlxColor
  {
    funnyColor.value = [val.red, val.green, val.blue, val.alpha];
    return val;
  }

  function set_antialias(val:Float):Float
  {
    AA_STAGES.value = [val];
    return val;
  }

  @:glFragmentSource('
        #pragma header

        uniform vec4 funnyColor;
        uniform bool colSet;
        uniform float AA_STAGES;

        vec2 hash22(vec2 p) {
          vec3 p3 = fract(vec3(p.xyx) * vec3(.1031, .1030, .0973));
          p3 += dot(p3, p3.yzx + 33.33);
          return fract((p3.xx + p3.yz) * p3.zy);
        }

        vec4 mainPass(vec2 fragCoord) {
          vec4 color = flixel_texture2D(bitmap, fragCoord);

          if (color.a > 0.0 && colSet)
              color = vec4(funnyColor.r / 255.0, funnyColor.g / 255.0, funnyColor.b / 255.0, color.a);

          return color;
        }

        vec4 antialias(vec2 fragCoord) {
          float AA_TOTAL_PASSES = AA_STAGES * AA_STAGES + 1.0;
          const float AA_JITTER = 0.5;

          vec4 color = mainPass(fragCoord);
          for (float x = 0.0; x < AA_STAGES; x++) {
              for (float y = 0.0; y < AA_STAGES; y++) {
                  vec2 offset = AA_JITTER * (2.0 * hash22(vec2(x, y)) - 1.0) / openfl_TextureSize.xy;
                  color += mainPass(fragCoord + offset);
              }
          }
          return color / AA_TOTAL_PASSES;
        }

        void main()
        {
            vec4 col = antialias(openfl_TextureCoordv);
            gl_FragColor = col;
        }
    ')
  public function new(colorThingy:FlxColor)
  {
    super();

    this.color = colorThingy;
    this.active = false;
    this.antialias = 2.0;
  }
}
