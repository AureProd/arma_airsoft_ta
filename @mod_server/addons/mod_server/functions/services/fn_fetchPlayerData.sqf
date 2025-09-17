/*
    DB_fnc_fetchPlayerData.sqf
    Description:
        Fetch player data from database.
    Params:
        _player (PLAYER) - Player objet to fetch data from database.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[DB]"
#define PLAYER_MONEY_VAR "money"
#define PLAYER_BLUE_OUTFITS_VAR "blue_outfits"
#define PLAYER_RED_OUTFITS_VAR "red_outfits"
#define PLAYER_KILLS_VAR "kills"
#define PLAYER_DEADS_VAR "deads"
#define PLAYER_WON_GAMES_VAR "won_games"
#define PLAYER_LOST_GAMES_VAR "lost_games"
#define PLAYER_VIP_LEVEL_VAR "vip_level"
#define PLAYER_RIGHTS_VAR "rights"
#define PLAYER_IS_INIT_VAR "is_initialized"


params ["_player"];

// Safety check
if (isNull _player) exitWith { 
    diag_log format ["%1 ERROR: DB fetch aborted: null player.", LOG_PREFIX]; 
};

// Player identifiers
private _playerUID = getPlayerUID _player;
private _playerName = name _player;

diag_log format ["%1 DB fetch player '%2' (UID: '%3').", LOG_PREFIX, _playerName, _playerUID];

// Database query
private _query = format[
    "SELECT money, blue_outfits, red_outfits, kills, deads, won_games, lost_games, vip_level, rights FROM player WHERE uid = '%1'",
    _playerUID
];
private _response = [_query] call DB_fnc_readQuery;

if ((count _response) < 1) then { 
    // player do not exist in database (first connection to server)
	diag_log format ["%1 Player '%2' fetched, first time connection (UID: '%3')", LOG_PREFIX, _playerName, _playerUID];
	
    _player setVariable [PLAYER_MONEY_VAR, 0, true];
    _player setVariable [PLAYER_BLUE_OUTFITS_VAR, [0], true];
    _player setVariable [PLAYER_RED_OUTFITS_VAR, [0], true];
    _player setVariable [PLAYER_KILLS_VAR, 0, true];
    _player setVariable [PLAYER_DEADS_VAR, 0, true];
    _player setVariable [PLAYER_WON_GAMES_VAR, 0, true];
    _player setVariable [PLAYER_LOST_GAMES_VAR, 0, true];
    _player setVariable [PLAYER_VIP_LEVEL_VAR, 0, true];
    _player setVariable [PLAYER_RIGHTS_VAR, 0, true];
} else { 
    // Player already exist in database
	diag_log format ["%1 Player '%2' fetched (UID: '%3')", LOG_PREFIX, _playerName, _playerUID];

    private _blueOutfits = [_response select 1] call DB_fnc_decodeArray;
    private _redOutfits  = [_response select 2]  call DB_fnc_decodeArray;

    _player setVariable [PLAYER_MONEY_VAR, _response select 0, true];
    _player setVariable [PLAYER_BLUE_OUTFITS_VAR, _blueOutfits, true];
    _player setVariable [PLAYER_RED_OUTFITS_VAR, _redOutfits, true];
    _player setVariable [PLAYER_KILLS_VAR, _response select 3, true];
    _player setVariable [PLAYER_DEADS_VAR, _response select 4, true];
    _player setVariable [PLAYER_WON_GAMES_VAR, _response select 5, true];
    _player setVariable [PLAYER_LOST_GAMES_VAR, _response select 6], true;
    _player setVariable [PLAYER_VIP_LEVEL_VAR, _response select 7, true];
    _player setVariable [PLAYER_RIGHTS_VAR, _response select 8, true];
};

_player setVariable [PLAYER_IS_INIT_VAR, true, true];