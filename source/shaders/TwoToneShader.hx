package shaders;

import flixel.system.FlxAssets.FlxShader;

class TwoToneShader extends FlxShader {
    @:glFragmentSource('
        #pragma header

        uniform vec4 lightColor;
        uniform vec4 darkColor;
        uniform float threshold;

        void main() {
            vec4 pixel = flixel_texture2D(bitmap, openfl_TextureCoordv);

            // Calculate perceived brightness
            float brightness = dot(pixel.rgb, vec3(0.299, 0.587, 0.114));

            // Select between light or dark tone
            vec4 resultColor = brightness > threshold ? lightColor : darkColor;

            gl_FragColor = vec4(resultColor.rgb, pixel.a * resultColor.a);
        }
    ')

    public function new(light:FlxColor, dark:FlxColor, thresh:Float) {
        super();
        updateColors(light, dark);
        this.threshold.value = [thresh];
    }

    public function updateColors(light:FlxColor, dark:FlxColor):Void {
        this.lightColor.value = [
            light.red / 255, light.green / 255, light.blue / 255, light.alpha / 255
        ];
        this.darkColor.value = [
            dark.red / 255, dark.green / 255, dark.blue / 255, dark.alpha / 255
        ];
    }

    public function updateThreshold(thresh:Float):Void {
        this.threshold.value = [thresh];
    }
}
