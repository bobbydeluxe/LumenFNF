package psychlua;

class EpicConstants {
    // if this variable is true, it will use the FNF 0.2.7 freeplay system
    // if false, then it will use the updated FNF 0.3.0+ freeplay system
    public static var legacyFreeplay = false;

    // determines which video should be played in the intro splash state
    public static var introVideo:String = "intro";

    // determines which logo should be used in the intro splash state
    public static var introLogo:String = "default";

    // determines the sound prefix for the intro splash state
    public static var introSoundPrefix:String = "intro";

    // determines how many intro sounds are there
    public static var introSoundCount:Int = 3;

    // main menu music
    public static var mainMenuMusic:String = "freakyMenu";

    public static function resetConstants():Void {
        legacyFreeplay = false;
        introVideo = "intro";
        introLogo = "default";
        introSoundPrefix = "intro";
        introSoundCount = 3;
        mainMenuMusic = "freakyMenu";
    }
}