/*
    Init_fnc_loadConfigs.sqf
    Description:
        Loads all JSON file and store configs in missionNamespace variables.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[CONFIG]"
#define GAME_MODES_CONFIG_FILE "configs\game_modes_config.json"
#define GAME_MODES_VAR "game_modes"
#define MAPS_CONFIG_FILE "configs\maps_config.json"
#define MAPS_VAR "maps"

if (!isServer) exitWith {};  // Server side only

private _gameModes = [GAME_MODES_CONFIG_FILE] call Helper_fnc_loadConfig;

missionNamespace setVariable [GAME_MODES_VAR, _gameModes, true];

private _maps = [MAPS_CONFIG_FILE] call Helper_fnc_loadConfig;

missionNamespace setVariable [MAPS_VAR, _maps, true];

diag_log format ["%1 JSON configs loaded.", LOG_PREFIX];