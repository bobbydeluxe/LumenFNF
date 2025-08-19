package objects;

// just flxtext with the vcr shit pre-applied
// thanks maybemaru on github for the original implementation

class FunkinText extends FlxText
{
    public function new(x:Float = 0, y:Float = 0, width:Float = 0, text:String = '', size:Int = 20, outline:Bool = true, alignment:String = 'left', borderSize:Float = 1)
    {
        super(x,y,width,text,size);
        setFormat(Paths.font('vcr.ttf'), size, FlxColor.WHITE, alignment.toLowerCase().trim(), outline ? OUTLINE : NONE, FlxColor.BLACK);
        this.borderSize = borderSize;
		scrollFactor.set();
    }
}