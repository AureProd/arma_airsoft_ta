
// params --> s'est deja connecte / money / tenues [0, 0, 0, 0, 0, 0] / kills / morts / games gagnées / games perdues / niveau vip / niveau droits

private _isDejaConnecte = param [0];

if (!_isDejaConnecte) then 
{
	private _money = param [1];
	private _tenues = param [2];
	private _kills = param [3];
	private _morts = param [4];
	private _win_games = param [5];
	private _played_games = param [6];
	private _niveau_vip = param [7];
	private _niveau_droits = param [8];

	// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
	missionNamespace setVariable 
	[
		nomVarPlayerUID, 
		[_money, _tenues, _kills, _morts, _win_games, _played_games, _niveau_vip, _niveau_droits], 
		true
	];
}
else
{
	// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
	missionNamespace setVariable [nomVarPlayerUID, [0, [[0],[0]], 0, 0, 0, 0, 0, 0], true];

	player setDamage 0;

	// supprime tt equipement de unité
	player setUnitLoadout (getUnitLoadout (configFile >> "EmptyLoadout"));
};

[] call mission_fnc_syns_data;

titleCut ["", "BLACK IN", 3];

enableEnvironment [true, true];

[] spawn gg_fnc_init_client;
