/*
    Game_fnc_serverStartGame.sqf
    Description:
        Start game on server side.
    Params:
        _selectedMap (STRING) - Selected map, map selected by players vote.
*/

#define LOG_PREFIX "[Game]"
#define PLAYER_IN_VOTE_VAR "in_vote"

params ["_selectedMap"];

if (!isServer) exitWith {};

private _gameMaps = call Data_fnc_getGameMaps;
private _gameModes = call Data_fnc_getGameModes;

if !(_selectedMap in (keys _gameMaps)) exitWith {
    diag_log format ["%1 ERROR: No map found with name '%2'.", LOG_PREFIX, _selectedMap];
};

["in_game"] call Data_fnc_setGameStatus;

gameMap = _gameMaps get _selectedMap;

private _mapGameMode = gameMap get 'game_mode';
gameMode = _gameModes get _mapGameMode;

diag_log format ["%1 Start game on map '%2' with game-mode '%3'.", LOG_PREFIX, _selectedMap, _mapGameMode];

{
    if (_x getVariable [PLAYER_IN_VOTE_VAR, false]) then {
        diag_log format ["%1 Player '%2' quit vote.", LOG_PREFIX, (name _x)];
        [] remoteExecCall ["Vote_fnc_clientQuitVote", _x];

        diag_log format ["%1 Player '%2' join game.", LOG_PREFIX, (name _x)];
        [gameMap, gameMode, true] remoteExecCall ["Game_fnc_clientJoinGame", _x];
    };
} forEach allPlayers;
