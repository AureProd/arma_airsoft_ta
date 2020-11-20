
// [argent] call mission_fnc_set_money;

_argent = _this select 0;

[[[0, _argent]], player] call mission_fnc_modif_var_bdd;