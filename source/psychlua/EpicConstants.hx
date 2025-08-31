package psychlua;

class EpicConstants {
    // if this variable is true, it will use the FNF 0.2.7 freeplay system
    // if false, then it will use the updated FNF 0.3.0+ freeplay system
    public static var legacyFreeplay = false;

    // main menu music i guess
    public static var mainMenuMusic:String = "freakyMenu";

    // the color the story mode menu items flash
    public static var storyMenuFlashColor = 0xFF33FFFF;

    // how many flashes per second
    public static var storyMenuFlashCount:Int = 6;

    // intro splash state sound
    public static var introSound:String = "introSplash";

    // note postfix functions to override
    public static function noteSkinPostfixFunc():String {
        return "";
    }

    public static function noteSplashPostfixFunc():String {
        return "";
    }

    // hurt note data
    public static var hurtNoteData:Array<Dynamic> = [
        0xFF101010, // note r
        0xFFFF0000, // note g
        0xFF990022,  // note b
        0xFFFF0000,  // splash r
        0xFF101010,  // splash g
        'noteSplashes/noteSplashes-electric' // splash texture
    ];

    // note splash alpha
    public static var noteSplashAlpha:Float = 1;

    public static function resetConstants():Void {
        legacyFreeplay = false;
        mainMenuMusic = "freakyMenu";
        storyMenuFlashColor = 0xFF33FFFF;
        storyMenuFlashCount = 6;
        introSound = "introSplash";
        hurtNoteData = [
            0xFF101010, // note r
            0xFFFF0000, // note g
            0xFF990022,  // note b
            0xFFFF0000,  // splash r
            0xFF101010,  // splash g
            'noteSplashes/noteSplashes-electric' // splash texture
        ];
        noteSplashAlpha = 1;
    }
}