/*
    Game_fnc_serverStopGame.sqf
    Description:
        Stop game on server side.
*/

#define LOG_PREFIX "[Game]"

if (!isServer) exitWith {};

["waiting"] call Data_fnc_setGameStatus;

diag_log format ["%1 Stop game.", LOG_PREFIX];

gameMap = nil;
gameMode = nil;