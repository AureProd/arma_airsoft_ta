
addMissionEventHandler ["HandleDisconnect", 
{
	params [ "_unit" ,  "_id" ,  "_uid" ,  "_name" ];

	// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
	private _variable = missionNamespace getVariable (format ["variable_%1", _uid]);

	// UID player / name player / money / tenues [0, 0, 0, 0, 0, 0] / kills / games gagnées / games perdues / niveau vip / niveau droits
	[_uid, _name, (_variable select 0), (_variable select 1), (_variable select 2), (_variable select 3), (_variable select 4), (_variable select 5), (_variable select 6), (_variable select 7)] remoteExec ["db_fnc_sauvegardeBdd", 2];
	
	if (count allPlayers == 0) then 
	{
		endMission "END1";
	};

	{
		if ((getPlayerUID _x) == _uid) then 
		{
			if (_x getVariable "value") then 
			{
				cpAValue = 0;
                publicVariable "cpAValue";

				cpBValue = 0;
                publicVariable "cpBValue";

				cpCValue = 0;
                publicVariable "cpCValue";
			};
		};
	} forEach allPlayers;

	false;		
}];