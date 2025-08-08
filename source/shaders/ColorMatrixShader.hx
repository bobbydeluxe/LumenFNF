package shaders;

class ColorMatrixShader extends FlxShader {
    @:glFragmentSource('
        #pragma header

        uniform vec4 m0;
        uniform vec4 m1;
        uniform vec4 m2;
        uniform vec4 m3;
        uniform vec4 offs;

        void main() {
            vec4 c = flixel_texture2D(bitmap, openfl_TextureCoordv);
            float mask = c.a; // use texture alpha as a mask
            
            vec4 outColor;
            outColor.r = dot(c, m0) + offs.r * mask;
            outColor.g = dot(c, m1) + offs.g * mask;
            outColor.b = dot(c, m2) + offs.b * mask;
            outColor.a = dot(c, m3) + offs.a * mask;

            // hard clip any tiny alpha noise:
            outColor.a = step(0.001, outColor.a) * outColor.a;
            
            gl_FragColor = outColor * openfl_Alphav;
        }
    ')

    public function new(?matrix:Array<Float>) {
        super();
        setMatrix(matrix == null ? identity() : matrix);
    }

    public function setMatrix(m:Array<Float>) {
        if (m == null || m.length != 20) throw 'Need 20 floats (row-major 4x5).';
        this.data.m0.value = [ m[0],  m[1],  m[2],  m[3]  ];
        this.data.m1.value = [ m[5],  m[6],  m[7],  m[8]  ];
        this.data.m2.value = [ m[10], m[11], m[12], m[13] ];
        this.data.m3.value = [ m[15], m[16], m[17], m[18] ];
        this.data.offs.value = [ m[4], m[9], m[14], m[19] ];
    }

    public static function identity():Array<Float> {
        return [
            1,0,0,0, 0,
            0,1,0,0, 0,
            0,0,1,0, 0,
            0,0,0,1, 0
        ];
    }
}
