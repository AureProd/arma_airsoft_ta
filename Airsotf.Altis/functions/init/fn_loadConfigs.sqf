/*
    Init_fnc_loadConfigs.sqf
    Description:
        Loads all JSON file and store configs in missionNamespace variables.
*/

if (isServer) then {
    diag_log "Load JSON configs.";

    private _gameModesConfig = ["configs\game_modes_config.json"] call Helper_fnc_loadConfig;

    missionNamespace setVariable ["game_modes", _gameModesConfig, true];

    private _mapsConfig = ["configs\maps_config.json"] call Helper_fnc_loadConfig;

    missionNamespace setVariable ["maps", _mapsConfig, true];

    diag_log "JSON configs successfully loaded.";
};