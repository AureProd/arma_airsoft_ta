/*
    Vote_fnc_serverStartVote.sqf
    Description:
        Start vote on server side.
*/

#define LOG_PREFIX "[Vote]"
#define VOTE_DURATION 10 // 40  // Vote time duration in seconds

if (!isServer) exitWith {};

["in_vote"] call Data_fnc_setGameStatus;

diag_log format ["%1 Start vote.", LOG_PREFIX];

private _gameMaps = call Data_fnc_getGameMaps;

// Make vote HashMap variable to store players votes
gameVoteHashMap = createHashMap;
{
    gameVoteHashMap set [_x, 0];
} forEach (keys _gameMaps);

// Wait end of vote
[] spawn {
    sleep VOTE_DURATION;

    call Vote_fnc_serverFinishVote;
};