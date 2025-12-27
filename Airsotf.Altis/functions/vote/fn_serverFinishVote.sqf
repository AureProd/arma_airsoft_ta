/*
    Vote_fnc_serverFinishVote.sqf
    Description:
        Finish vote and select winnig map on server side and start game.
*/

#define LOG_PREFIX "[Vote]"

if (!isServer) exitWith {};

if ((call Data_fnc_getGameStatus) != "in_vote") exitWith {
    diag_log format ["%1 WARNING: Game status no equal to 'in_vote', vote result avorted.", LOG_PREFIX];
};

// Check if HashMap is empty
if (isNil "gameVoteHashMap" || (count (keys gameVoteHashMap)) == 0) exitWith {
    diag_log format ["%1 ERROR: Variable 'gameVoteHashMap' is empty or not defined.", LOG_PREFIX];
};

private _winningMap = "";
private _maxVotes = 0;

// Iterate over all keys to find the map with most votes
{
    private _votes = gameVoteHashMap get _x;

    if (_votes > _maxVotes) then {
        _maxVotes = _votes;
        _winningMap = _x;
    };
} forEach (keys gameVoteHashMap);

// If no votes were cast, select a map at random
if (_winningMap == "") then {
    _winningMap = selectRandom (keys gameVoteHashMap);
};

diag_log format ["%1 Vote finished with winning map: '%2'.", LOG_PREFIX, _winningMap];

gameVoteHashMap = nil;

[_winningMap] call Game_fnc_serverStartGame;