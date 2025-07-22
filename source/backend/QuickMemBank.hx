package backend;

// QuickMemBank – temporary runtime memory storage for scripts
// Not persistent across game launches (use save file for that)

class QuickMemBank {
    private static var _data:Map<String, Dynamic> = new Map();

    // Store a value with a key
    public static function set(key:String, value:Dynamic):Void _data.set(key, value);

    // Retrieve a value by key
    public static function get(key:String):Dynamic return _data.get(key);

    // Check if a key exists
    public static function has(key:String):Bool return _data.exists(key);

    // Remove a key and its value
    public static function remove(key:String):Void _data.remove(key);

    // Clear everything in memory
    public static function clear():Void _data.clear();

    // Get all keys as an array
    public static function keys():Array<String> return [for (k in _data.keys()) k];

    // Add a value to a list stored under a key (creates list if needed)
    public static function insert(key:String, value:Dynamic):Void {
        var list = get(key);
        if (list == null || !Std.isOfType(list, Array)) {
            list = [];
            set(key, list);
        }
        list.push(value);
    }

    // Remove a value from a list under a key (if it exists)
    public static function removeFrom(key:String, value:Dynamic):Void {
        var list = get(key);
        if (list != null && Std.isOfType(list, Array)) {
            list.remove(value);
        }
    }
}
