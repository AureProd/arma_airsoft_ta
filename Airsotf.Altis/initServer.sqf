/*
Server side init file, file read on server start.
*/

#define LOG_PREFIX "[InitServer]"

diag_log format ["%1 Executing...", LOG_PREFIX];

diag_log format ["%1 Etablish DB connection.", LOG_PREFIX];
call DB_fnc_init; // Initialize DB connection (execute only on server)

[[1988, 5, 16, 8, 0]] remoteExec ["setDate"];

// Set default game-status
["waiting"] call Data_fnc_setGameStatus;

private _gameMaps = call Data_fnc_getGameMaps;

// TODO: just for tests
diag_log format ["%1 Start test vote system and joining game.", LOG_PREFIX];

call Vote_fnc_serverStartVote;

[keys _gameMaps] remoteExecCall ["Vote_fnc_clientJoinVote", 2];