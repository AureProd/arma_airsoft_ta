/*
    DB_fnc_fetchPlayerData.sqf
    Description:
        Fetch player data from database.
    Params:
        _player (PLAYER) - Player objet to fetch data from database.
*/

params ["_player"];

// Safety check
if (isNull _player) exitWith { 
    diag_log "DB fetch aborted: null player."; 
};

// Player identifiers
private _playerUID = getPlayerUID _player;
private _playerName = name _player;

diag_log format ["DB fetch player '%1' (UID: '%2').", _playerName, _playerUID];

// Database query
private _query = format[
    "SELECT money, blue_outfits, red_outfits, kills, deads, won_games, lost_games, vip_level, rights FROM player WHERE uid = '%1'",
    _playerUID
];
private _response = [_query] call DB_fnc_readQuery;

if ((count _response) < 1) then { 
    // player do not exist in database (first connection to server)
	diag_log format ["Player '%1' fetched, first time connection (UID: '%2')", _playerName, _playerUID];
	
    _player setVariable ["money", 0, true];
    _player setVariable ["blue_outfits", [0], true];
    _player setVariable ["red_outfits", [0], true];
    _player setVariable ["kills", 0, true];
    _player setVariable ["deads", 0, true];
    _player setVariable ["won_games", 0, true];
    _player setVariable ["lost_games", 0, true];
    _player setVariable ["vip_level", 0, true];
    _player setVariable ["rights", 0, true];
} else { 
    // Player already exist in database
	diag_log format ["Player '%1' fetched (UID: '%2')", _playerName, _playerUID];

    private _blueOutfits = [_response select 1] call DB_fnc_decodeArray;
    private _redOutfits  = [_response select 2]  call DB_fnc_decodeArray;

    _player setVariable ["money", _response select 0, true];
    _player setVariable ["blue_outfits", _blueOutfits, true];
    _player setVariable ["red_outfits", _redOutfits, true];
    _player setVariable ["kills", _response select 3, true];
    _player setVariable ["deads", _response select 4, true];
    _player setVariable ["won_games", _response select 5, true];
    _player setVariable ["lost_games", _response select 6], true;
    _player setVariable ["vip_level", _response select 7, true];
    _player setVariable ["rights", _response select 8, true];
};

_player setVariable ["is_initialized", true, true];