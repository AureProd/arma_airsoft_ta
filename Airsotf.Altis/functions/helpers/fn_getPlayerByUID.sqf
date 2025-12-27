/*
    Helper_fnc_getPlayerByUID.sqf
    Description:
        Search player by UID with improved error handling and logging.
    Params:
        _playerUID (STRING) - UID of player to search
    Return:
        (OBJECT) - Found player object, or objNull if not found
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[PLAYER_SEARCH]"

params ["_playerUID"];

// Input validation
if (isNil "_playerUID" || _playerUID isEqualTo "") exitWith {
    diag_log format ["%1 ERROR: Invalid UID provided: %2", LOG_PREFIX, _playerUID];
    objNull
};

// Search for player
private _foundPlayer = objNull;

{
    private _currentUID = getPlayerUID _x;
    private _playerName = name _x;
    
    if (_currentUID == _playerUID) exitWith {
        _foundPlayer = _x;
    };
} forEach allPlayers;

// Log result if not found
if (isNull _foundPlayer && ENABLE_DEBUG_LOGS) then {
    diag_log format ["%1 ERROR: No player found with UID: '%2'", LOG_PREFIX, _playerUID];
};

_foundPlayer