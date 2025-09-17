/*
    Vote_fnc_clientQuitVote.sqf
    Description:
        Player quit vote on client side.
*/

#define LOG_PREFIX "[Vote]"
#define PLAYER_IN_VOTE_VAR "in_vote"

if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Quit vote.", LOG_PREFIX];

player setVariable [PLAYER_IN_VOTE_VAR, false, true];

call Vote_fnc_clientCloseVoteInterface;