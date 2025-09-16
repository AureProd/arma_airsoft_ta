/*
    DB_fnc_flushPlayerData.sqf
    Description:
        Flush player data to database.
    Params:
        _player (PLAYER) - Player objet to flush data in database.
*/

params ["_player"];

// Safety check
if (isNull _player) exitWith { 
    diag_log "DB flush aborted: null player."; 
};

// Player identifiers
private _playerUID = getPlayerUID _player;
private _playerName = name _player;

diag_log format ["DB flush player '%1' (UID: '%2').", _playerName, _playerUID];

// Prepare player data to flush
private _money = _player getVariable "money";
private _blueOutfits = _player getVariable "blue_outfits";
private _redOutfits = _player getVariable "red_outfits";
private _kills = _player getVariable "kills";
private _deads = _player getVariable "deads";
private _wonGames = _player getVariable "won_games";
private _lostGames = _player getVariable "lost_games";
private _vipLevel = _player getVariable "vip_level";
private _rights = _player getVariable "rights";

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
diag_log format ["Player '%1' flushed (UID: '%2')", _playerName, _playerUID];