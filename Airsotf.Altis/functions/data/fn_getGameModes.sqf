/*
    Data_fnc_getGameModes.sqf
    Description:
        Read game-modes configs from mission namespace.
    Return:
        (HASHMAP) - Game-modes config.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[GameModes]"
#define GAME_MODES_VAR "game_modes"

private _gameModes = missionNamespace getVariable [GAME_MODES_VAR, nil];

if (isNil "_gameModes") exitWith {
    diag_log format ["%1 ERROR: No game-modes config found. Make sure it is loaded before accessing it.", LOG_PREFIX];
};

_gameModes