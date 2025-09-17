/*
    Helper_fnc_loadConfig.sqf
    Description:
        Loads a JSON file and returns it as a HashMap with enhanced error handling.
    Params:
        _filePath (STRING) - Relative path to the JSON file
    Return:
        (HASHMAP) - Parsed JSON configuration, or empty HashMap on failure
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[CONFIG_LOADER]"

params ["_filePath"];

// Input validation
if (isNil "_filePath" || _filePath isEqualTo "") exitWith {
    diag_log format ["%1 ERROR: Invalid file path provided: %2", LOG_PREFIX, _filePath];
    createHashMap
};

// Load file content
private _jsonText = loadFile _filePath;
private _config = createHashMap;

// Validate file content
if (isNil "_jsonText" || _jsonText isEqualTo "") then {
    diag_log format ["%1 ERROR: File not found or empty (%2), using default empty config", LOG_PREFIX, _filePath];
    _jsonText = {};
};

// Parse JSON with error handling
try {
    _config = fromJSON _jsonText;
    
    // Validate parsing result
    if (isNil "_config") then {
        diag_log format ["%1 ERROR: JSON parsing failed for file: %2", LOG_PREFIX, _filePath];
        _config = createHashMap;
    };
} catch {
    diag_log format ["%1 ERROR: JSON parsing error for file %2 - %3", LOG_PREFIX, _filePath, _exception];
    _config = createHashMap;
};

// Return validated configuration
_config