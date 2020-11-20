
uiSleep 0.1;

private _client = param [0]; // <-- player
private _steamUID = getPlayerUID _client;
private _namePlayer = name _client;

diag_log format ["ENVOIE DE REQUETE BDD : %1 .. %2 .. %3", _client, _steamUID, _namePlayer];
if (isNil "_steamUID") exitWith
{
	diag_log format ["Erreur BDD avec %1 (%2)",_client, _namePlayer];
};

private _query = format["SELECT * FROM player WHERE p_uid = '%1'",_steamUID];
private _queryResult = [_query, 2] call db_fnc_asyncCall;

if ((count _queryResult) < 1) then
{
	diag_log format ["Le joueur %1 est connecte pour la premiere fois (UID: %2)", _namePlayer, _steamUID];
	[true] remoteExec ["mission_fnc_intro_airsoft", _client];
}
else
{
	private _money = _queryResult select 3;
	private _tenues = _queryResult select 4; // tableau
	private _kills = _queryResult select 5;
	private _morts = _queryResult select 6;
	private _win_games = _queryResult select 7;
	private _played_games = _queryResult select 8;
	private _niveau_vip = _queryResult select 9;
	private _niveau_droits = _queryResult select 10;

	// nom joueur / money / tenues / kills / morts / games gagnées / games perdues / niveau vip / niveau droits
	diag_log format ["Le joueur %1 / %2 / %3 / %4 / %5 / %6 / %7 / %8 / %9", _namePlayer, _money, _tenues, _kills, _morts, _win_games, _played_games, _niveau_vip, _niveau_droits];

	_tenues = [_tenues] call db_fnc_mresToArray;

	// params --> s'est deja connecte / money / tenues [0, 0, 0, 0, 0, 0] / kills / morts / games gagnées / games perdues / niveau vip / niveau droits
	[false, _money, _tenues, _kills, _morts, _win_games, _played_games, _niveau_vip, _niveau_droits] remoteExec ["mission_fnc_intro_airsoft", _client];
};
