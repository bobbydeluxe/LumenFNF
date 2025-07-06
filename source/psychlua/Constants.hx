package psychlua;

class Constants {
    // if this variable is true, it will use the FNF 0.2.7 freeplay system
    // if false, then it will use the updated FNF 0.3.0+ freeplay system
    public static var legacyFreeplay = false;

    public static function resetConstants():Void {
        legacyFreeplay = false;
    }
}