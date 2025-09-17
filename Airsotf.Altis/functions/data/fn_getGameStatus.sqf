/*
    Data_fnc_getGameStatus.sqf
    Description:
        Read game-status from mission namespace.
    Return:
        (STRING) - Game-status, possibles values: ['waiting', 'in_vote', 'in_game']
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[GameStatus]"
#define GAME_STATUS_VAR "game_status"
#define WAITING_GAME_STATUS "waiting"

if (!isServer) exitWith {};

private _gameStatus = missionNamespace getVariable [GAME_STATUS_VAR, WAITING_GAME_STATUS];

if !(_gameStatus in [WAITING_GAME_STATUS, IN_VOTE_GAME_STATUS, IN_GAME_GAME_STATUS]) exitWith {
    diag_log format ["%1 ERROR: Unexpected game-status: '%2'.", LOG_PREFIX, _gameStatus];
    WAITING_GAME_STATUS
};

_gameStatus