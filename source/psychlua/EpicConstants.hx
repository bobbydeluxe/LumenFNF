package psychlua;

class EpicConstants {
    // if this variable is true, it will use the FNF 0.2.7 freeplay system
    // if false, then it will use the updated FNF 0.3.0+ freeplay system
    public static var legacyFreeplay = false;

    // main menu music i guess
    public static var mainMenuMusic:String = "freakyMenu";

    // determines the speed at which the icons bop in the song playstate
    public static var iconBopSpeed:Float = 9;

    // the color the story mode menu items flash
    public static var storyMenuFlashColor = 0xFF33FFFF;

    // how many flashes per second
    public static var storyMenuFlashCount:Int = 6;

    // intro splash state sound
    public static var introSound:String = "introSplash";

    public static function resetConstants():Void {
        legacyFreeplay = false;
        mainMenuMusic = "freakyMenu";
        iconBopSpeed = 9;
        storyMenuFlashColor = 0xFF33FFFF;
        storyMenuFlashCount = 6;
        introSound = "introSplash";
    }
}