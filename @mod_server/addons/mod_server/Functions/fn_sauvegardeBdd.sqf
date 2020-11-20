
// UID player / nom joueur / argent / tenues [0, 0, 0, 0, 0, 0] / kills / morts / games gagnées / games jouées / niveau vip / niveau droits

private _steamUID = param[0];
private _namePlayer = param[1];

private _money = param[2];
private _tenues = param[3]; // tableau
private _kills = param[4];
private _morts = param[5];
private _win_games = param[6];
private _played_games = param[7];
private _niveau_vip = param[8];
private _niveau_droits = param[9];

_tenues = [_tenues] call db_fnc_mresArray;

diag_log format ["ENVOIE DE REQUETE BDD deconnexion : %1 .. %2", _namePlayer, _steamUID];
if (isNil "_steamUID") exitWith
{
	diag_log format ["Erreur BDD avec %1", _namePlayer];
};

private _query = format["SELECT * FROM player WHERE p_uid = '%1'", _steamUID];
private _queryResult = [_query, 2] call db_fnc_asyncCall;

if ((count _queryResult) < 1) then
{
	private _query1 = format ["INSERT INTO player (p_id, p_uid, p_name, p_money, p_tenues, p_kills, p_morts, p_win_games, p_games_played, p_niv_vip, p_niv_droits) VALUES ('', '%1', '%2', %3, '%4', %5, %6, %7, %8, %9, %10)", _steamUID, _namePlayer, _money, _tenues, _kills, _morts, _win_games, _played_games, _niveau_vip, _niveau_droits];
	[_query1, 1] call db_fnc_asyncCall;
	diag_log format ["Le joueur %1 a ete cree en BDD (UID: %2)", _namePlayer, _steamUID];
};

if ((count _queryResult) > 0) then
{
	private _query2 = format ["UPDATE player SET p_name = '%2', p_money = %3, p_tenues = '%4', p_kills = %5, p_morts = %6, p_win_games = %7, p_games_played = %8, p_niv_vip = %9, p_niv_droits = %10 WHERE p_uid = '%1'", _steamUID, _namePlayer, _money, _tenues, _kills, _morts, _win_games, _played_games, _niveau_vip, _niveau_droits];
	[_query2, 1] call db_fnc_asyncCall;

	diag_log format ["Le joueur %1 à synchronisé la bdd (UID : %2)", _namePlayer, _steamUID];
	// nom joueur / argent / tenues / kills / morts / games gagnées / games jouées / niveau vip / niveau droits
	diag_log format ["Le joueur %1 / %2 / %3 / %4 / %5 / %6 / %7 / %8 / %9", _namePlayer, _money, _tenues, _kills, _morts, _win_games, _played_games, _niveau_vip, _niveau_droits];
};