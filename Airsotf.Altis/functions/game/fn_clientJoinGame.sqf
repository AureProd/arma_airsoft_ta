/*
    Game_fnc_clientJoinGame.sqf
    Description:
        Player join game on client side.
    Params:
        _gameMap (HASHMAP) - Selected map to play game.
        _gameMode (HASHMAP) - Selected game-mode of map to play game.
*/

#define LOG_PREFIX "[Game]"

params ["_gameMap", "_gameMode"];

if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Join game.", LOG_PREFIX];