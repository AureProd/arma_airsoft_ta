/*
    Vote_fnc_clientJoinVote.sqf
    Description:
        Player join vote on client side.
*/

#define LOG_PREFIX "[Vote]"

// TODO: if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Join vote.", LOG_PREFIX];

// TODO: add vote for test
[] spawn {
    sleep 3;

    ["uss_liberty"] call Vote_fnc_clientVoteForMap;
};