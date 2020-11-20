
// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
private _variable = missionNamespace getVariable nomVarPlayerUID;

// UID player / name player / money / tenues [0, 0, 0, 0, 0, 0] / kills / morts / games gagnées / games perdues / niveau vip / niveau droits
[(getPlayerUID player), (name player), (_variable select 0), (_variable select 1), (_variable select 2), (_variable select 3), (_variable select 4), (_variable select 5), (_variable select 6), (_variable select 7)] remoteExec ["db_fnc_sauvegardeBdd", 2];
