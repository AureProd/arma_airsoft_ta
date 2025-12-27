/*
    Data_fnc_setGameStatus.sqf
    Description:
        Change game-status in mission namespace.
    Params:
        _gameStatus (STRING) - Game-status, availables values: ['waiting', 'in_vote', 'in_game']
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[GameStatus]"
#define GAME_STATUS_VAR "game_status"
#define WAITING_GAME_STATUS "waiting"
#define IN_VOTE_GAME_STATUS "in_vote"
#define IN_GAME_GAME_STATUS "in_game"

params ["_gameStatus"];

if (!isServer) exitWith {};

// Input validation
if !(_gameStatus in [WAITING_GAME_STATUS, IN_VOTE_GAME_STATUS, IN_GAME_GAME_STATUS]) exitWith {
    diag_log format [
        "%1 ERROR: Invalid game-status path provided: '%2' (Available game-status: '%3', '%4', '%5').", 
        LOG_PREFIX, _gameStatus, WAITING_GAME_STATUS, IN_VOTE_GAME_STATUS, IN_GAME_GAME_STATUS
    ];
};

missionNamespace setVariable [GAME_STATUS_VAR, _gameStatus];
diag_log format ["%1 Game-status updated to '%2'.", LOG_PREFIX, _gameStatus];