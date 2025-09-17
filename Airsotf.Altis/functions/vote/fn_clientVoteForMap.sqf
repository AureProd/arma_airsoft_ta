/*
    Vote_fnc_clientVoteForMap.sqf
    Description:
        Player vote for map on client side.
    Params:
        _votedMap (STRING) - Voted map, map selected by player.
*/

#define LOG_PREFIX "[Vote]"

params ["_votedMap"];

// TODO: if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Vote for map '%2'.", LOG_PREFIX, _votedMap];

[_votedMap] remoteExecCall ["Vote_fnc_serverPlayerVoteForMap", 2]