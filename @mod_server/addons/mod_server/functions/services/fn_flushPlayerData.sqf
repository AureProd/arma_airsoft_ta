/*
    DB_fnc_flushPlayerData.sqf
    Description:
        Flush player data to database.
    Params:
        _player (PLAYER) - Player objet to flush data in database.
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

params ["_player"];

// Safety check
if (isNull _player) exitWith { 
    diag_log format ["%1 ERROR: DB flush aborted: null player.", LOG_PREFIX]; 
};

// Player identifiers
private _playerUID = getPlayerUID _player;
private _playerName = name _player;

diag_log format ["%1 DB flush player '%2' (UID: '%3').", LOG_PREFIX, _playerName, _playerUID];

// Prepare player data to flush
private _money = _player getVariable PLAYER_MONEY_VAR;
private _blueOutfits = _player getVariable PLAYER_BLUE_OUTFITS_VAR;
private _redOutfits = _player getVariable PLAYER_RED_OUTFITS_VAR;
private _kills = _player getVariable PLAYER_KILLS_VAR;
private _deads = _player getVariable PLAYER_DEADS_VAR;
private _wonGames = _player getVariable PLAYER_WON_GAMES_VAR;
private _lostGames = _player getVariable PLAYER_LOST_GAMES_VAR;
private _vipLevel = _player getVariable PLAYER_VIP_LEVEL_VAR;
private _rights = _player getVariable PLAYER_RIGHTS_VAR;

// Encode arrays
private _encodedBlueOutfits = [_blueOutfits] call DB_fnc_encodeArray;
private _encodedRedOutfits = [_redOutfits] call DB_fnc_encodeArray;

// Make query
private _query = format [
    "INSERT INTO player (uid, name, money, blue_outfits, red_outfits, kills, deads, won_games, lost_games, vip_level, rights) " +
    "VALUES ('%1', '%2', %3, '%4', '%5', %6, %7, %8, %9, %10, %11) " +
    "ON DUPLICATE KEY UPDATE " +
    "name='%2', money=%3, blue_outfits='%4', red_outfits='%5', kills=%6, deads=%7, won_games=%8, lost_games=%9, vip_level=%10, rights=%11",
    _playerUID, _playerName, _money, _encodedBlueOutfits, _encodedRedOutfits, _kills, _deads, _wonGames, _lostGames, _vipLevel, _rights
];

// Send query to database
[_query] call DB_fnc_writeQuery;

// Log for flush confirmation
diag_log format ["%1 Player '%2' flushed (UID: '%3')", LOG_PREFIX, _playerName, _playerUID];