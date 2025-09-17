/*
    Game_fnc_serverStartGame.sqf
    Description:
        Start game on server side.
    Params:
        _selectedMap (STRING) - Selected map, map selected by players vote.
*/

#define LOG_PREFIX "[Game]"

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
    [gameMap, gameMode] remoteExecCall ["Game_fnc_clientJoinGame", _x];
} forEach allPlayers;

// TODO: for tests
[gameMap, gameMode] remoteExecCall ["Game_fnc_clientJoinGame", 2];