/*
Server side init file, file read on server start.
*/

#define LOG_PREFIX "[InitServer]"

diag_log format ["%1 Executing...", LOG_PREFIX];

diag_log format ["%1 Etablish DB connection.", LOG_PREFIX];
call DB_fnc_init; // Initialize DB connection (execute only on server)

[[1988, 5, 16, 8, 0]] remoteExec ["setDate"];

// Set default game-status, available game-status: "waiting", "in_vote", "in_game"
missionNamespace setVariable ["game_status", "waiting", true];
diag_log format ["%1 Game-status updated to 'waiting'.", LOG_PREFIX];
