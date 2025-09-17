/*
    Vote_fnc_clientVoteForMap.sqf
    Description:
        Player vote for map on server side.
    Params:
        _votedMap (STRING) - Voted map, map selected by player.
*/

#define LOG_PREFIX "[Vote]"

params ["_votedMap"]; // TODO: change params to add player => 'params ["_player", "_votedMap"];'

if (!isServer) exitWith {};

diag_log format ["%1 Player '%2' vote for map '%3'.", LOG_PREFIX, "test_player", _votedMap]; // TODO: change player name by 'name player'

private _gameMaps = call Data_fnc_getGameMaps;

if !(_votedMap in (keys _gameMaps)) exitWith {
    diag_log format ["%1 ERROR: No map found with name '%2'.", LOG_PREFIX, _votedMap];
};

if (isNil "gameVoteHashMap" || (count (keys _voteHashMap)) == 0) exitWith {
    diag_log format ["%1 ERROR: Variable 'gameVoteHashMap' is empty or not defined.", LOG_PREFIX];
};

if !(_votedMap in (keys gameVoteHashMap)) exitWith {
    diag_log format ["%1 ERROR: Missing key '%2' in variable 'gameVoteHashMap'.", LOG_PREFIX, _votedMap];
};

gameVoteHashMap set [_votedMap, (gameVoteHashMap get _votedMap) + 1];