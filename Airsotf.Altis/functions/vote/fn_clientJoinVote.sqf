/*
    Vote_fnc_clientJoinVote.sqf
    Description:
        Player join vote on client side.
*/

#define LOG_PREFIX "[Vote]"

// TODO: if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Player '%2' join vote.", LOG_PREFIX, "test_player"]; // TODO: change player name by 'name player'

// TODO: add vote for test
[] spawn {
    sleep 3;

    ["uss_liberty"] remoteExecCall ["Vote_fnc_clientVoteForMap", 2];
};