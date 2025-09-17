/*
    Vote_fnc_serverStopVote.sqf
    Description:
        Stop vote on server side.
*/

#define LOG_PREFIX "[Vote]"

if (!isServer) exitWith {};

diag_log format ["%1 Stop vote.", LOG_PREFIX];

gameVoteHashMap = nil;

["waiting"] call Data_fnc_setGameStatus;
