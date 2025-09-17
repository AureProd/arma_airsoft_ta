/*
    Data_fnc_getGameMaps.sqf
    Description:
        Read game maps configs from mission namespace.
    Return:
        (HASHMAP) - Game maps config.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[GameMaps]"
#define GAME_MAPS_VAR "maps"

private _gameMaps = missionNamespace getVariable [GAME_MAPS_VAR, nil];

if (isNil "_gameMaps") exitWith {
    diag_log format ["%1 ERROR: No game maps config found. Make sure it is loaded before accessing it.", LOG_PREFIX];
};

_gameMaps