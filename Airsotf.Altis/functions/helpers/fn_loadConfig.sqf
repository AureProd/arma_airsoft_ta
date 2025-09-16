/*
    Helper_fnc_loadConfig.sqf
    Description:
        Loads a JSON file and returns it as a HashMap.
    Params:
        _filePath (STRING) - relative path to the JSON file
    Return:
        (HASHMAP) - containing the parsed JSON, or an empty HashMap on failure
*/

params ["_filePath"];  // Get the file path passed to the function

// Load the file content as a string
private _jsonText = loadFile _filePath;

// Check if the file exists and is not empty
if (isNil "_jsonText" || {_jsonText isEqualTo ""}) then {
    diag_log format ["[loadConfig] Failed to load JSON file %1, using empty config.", _filePath];
    _jsonText = "{}";  // fallback to empty JSON object
};

// Parse the JSON string into a HashMap
private _config = fromJSON _jsonText;

// Ensure the function always returns a HashMap
if (isNil "_config") exitWith { createHashMap };

// Return the parsed configuration
_config
