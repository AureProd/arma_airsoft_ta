
// [[[5, 100], [6, 100], [7, 100], [8, []]], player] call mission_fnc_modif_var_bdd;

private _tableauDonnees = param [0]; // [[id, valeur], [id, valeur]]
private _joueur = param [1, player];

private _newVarPlayer = format ["variable_%1", getPlayerUID _joueur];

// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
private _playerBdd = missionNamespace getVariable _newVarPlayer;

{
	_playerBdd set [(_x select 0), (_x select 1)];
} forEach _tableauDonnees;

missionNamespace setVariable [_newVarPlayer, _playerBdd, true];
