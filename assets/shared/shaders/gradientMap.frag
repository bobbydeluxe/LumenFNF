#pragma header

uniform sampler2D gradient;
uniform float mix_amount;

void main() 
{
    vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
    float grayscale = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
    gl_FragColor = mix(color, texture2D(gradient, vec2(grayscale, 0.0)) * color.a, mix_amount);
}