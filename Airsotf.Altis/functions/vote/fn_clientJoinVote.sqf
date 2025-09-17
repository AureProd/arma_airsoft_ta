/*
    Vote_fnc_clientJoinVote.sqf
    Description:
        Player join vote on client side.
*/

#define LOG_PREFIX "[Vote]"
#define PLAYER_IN_VOTE_VAR "in_vote"

if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Join vote.", LOG_PREFIX];

player setVariable [PLAYER_IN_VOTE_VAR, true, true];

call Vote_fnc_clientOpenVoteInterface;

// TODO: To vote
// ["uss_liberty"] call Vote_fnc_clientVoteForMap;