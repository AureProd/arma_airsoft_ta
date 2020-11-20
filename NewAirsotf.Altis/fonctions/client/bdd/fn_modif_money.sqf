
// [argent, (1 pour + et 0 pour -)] call mission_fnc_modif_money;

// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

_tab_valeur = _playerBdd select 0;

_argent = _this select 0;
_signe = _this select 1;

if (_signe == 1) then 
{
	_tab_valeur = _tab_valeur + _argent;
} 
else
{
	_tab_valeur = _tab_valeur - _argent;
};

[[[0, _tab_valeur]], player] call mission_fnc_modif_var_bdd;