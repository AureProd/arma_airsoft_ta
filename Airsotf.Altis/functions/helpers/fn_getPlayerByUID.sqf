/*
    Helper_fnc_getPlayerByUID.sqf
    Description:
        Search player by his UID.
    Params:
        _playerUID (STRING) - UID of player to search
    Return:
        (PLAYER) - Finded player from his UID
*/

params ["_playerUID"];

{
    diag_log format ["Search: player '%1' (UID: '%2')", name _x, getPlayerUID _x];
    
    if (getPlayerUID _x == _playerUID) exitWith { _x };
} forEach allPlayers;

// Si aucun joueur trouvé, renvoyer nil
nil