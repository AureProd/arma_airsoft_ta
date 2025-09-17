/*
    Init_fnc_loadConfigs.sqf
    Description:
        Loads all JSON file and store configs in missionNamespace variables.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[CONFIG]"
#define GAME_MAPS_CONFIG_FILE "configs\maps_config.json"
#define GAME_MAPS_VAR "maps"
#define GAME_MODES_CONFIG_FILE "configs\game_modes_config.json"
#define GAME_MODES_VAR "game_modes"

if (!isServer) exitWith {};  // Server side only

private _maps = [GAME_MAPS_CONFIG_FILE] call Helper_fnc_loadConfig;
missionNamespace setVariable [GAME_MAPS_VAR, _maps, true];
diag_log format ["%1 Game maps config loaded.", LOG_PREFIX];

private _gameModes = [GAME_MODES_CONFIG_FILE] call Helper_fnc_loadConfig;
missionNamespace setVariable [GAME_MODES_VAR, _gameModes, true];
diag_log format ["%1 Game-modes config loaded.", LOG_PREFIX];