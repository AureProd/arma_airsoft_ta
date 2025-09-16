/*
Server side init file, file read on server start.
*/

diag_log "Run InitServer file";

diag_log "Etablish DB connection.";
call DB_fnc_init; // Initialize DB connection (execute only on server)

[[1988, 5, 16, 8, 0]] remoteExec ["setDate"];

// Set default game-status, available game-status: "waiting", "in_vote", "in_game"
missionNamespace setVariable ["game_status", "waiting", true];
diag_log "Game-status updated to 'waiting'.";
