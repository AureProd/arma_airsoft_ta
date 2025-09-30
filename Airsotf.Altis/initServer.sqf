/*
Server side init file, file read on server start.
*/

#define LOG_PREFIX "[InitServer]"

diag_log format ["%1 Executing...", LOG_PREFIX];

diag_log format ["%1 Etablish DB connection.", LOG_PREFIX];
call DB_fnc_init; // Initialize DB connection (execute only on server)

[[2025, 8, 1, 8, 0]] remoteExec ["setDate"];

// Set default game-status
["waiting"] call Data_fnc_setGameStatus;

diag_log format ["%1 Server ready.", LOG_PREFIX];