// gradient map hscript example
// thanks falkimore for the shader

var tintShader:FlxRuntimeShader;

function onCreatePost() {
    tintShader = game.createRuntimeShader("gradientMap");
    tintShader.setSampler2D("gradient", FlxG.bitmap.add(Paths.image("gradient_test")).bitmap);
    tintShader.setFloat("mix_amount", 1.0);
    game.camGame.filters = [new ShaderFilter(tintShader)];
}