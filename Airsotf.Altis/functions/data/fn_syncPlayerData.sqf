/*
    Data_fnc_syncPlayerData.sqf
    Description:
       Synchronize and flush player data to database from client side.
*/

[player] call DB_fnc_flushPlayerData;