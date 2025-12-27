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

call IHM_fnc_openVoteIHM;
