
private _set_time = 
{
	[[1988, 5, 16, 1, 0]] remoteExec ["setDate"];

	while {gg_gamestatus == 1} do
	{
		if (daytime <= 4) then
		{
			[[1988, 5, 16, 1, 0]] remoteExec ["setDate"];
		};

		sleep 60;
	};
};

private _mode_date = (getArray(missionConfigFile >> "CfgGungame" >> "modes_jeux" >> "data")) select ((arena select 3) - 1);

switch (arena select 3) do
{
    case 1: // N° du mod de jeu
    {
		[[1988, 5, 16, 7, 0]] remoteExec ["setDate"];
		
		drapeauBleu_A = (((arena select 7) select 1) select 0);
		drapeauRouge_A = (((arena select 7) select 1) select 1);
		drapeauBlanc_A = (((arena select 7) select 1) select 2);

		drapeauBleu_B = (((arena select 8) select 1) select 0);
		drapeauRouge_B = (((arena select 8) select 1) select 1);
		drapeauBlanc_B = (((arena select 8) select 1) select 2);

		drapeauBleu_C = (((arena select 9) select 1) select 0);
		drapeauRouge_C = (((arena select 9) select 1) select 1);
		drapeauBlanc_C = (((arena select 9) select 1) select 2);

		publicVariable "drapeauBleu_A";
        publicVariable "drapeauRouge_A";
		publicVariable "drapeauBlanc_A";

		publicVariable "drapeauBleu_B";
        publicVariable "drapeauRouge_B";
		publicVariable "drapeauBlanc_B";

		publicVariable "drapeauBleu_C";
        publicVariable "drapeauRouge_C";
		publicVariable "drapeauBlanc_C";

		cpAValue = 0;
		cpBValue = 0;
		cpCValue = 0;

		publicVariable "cpAValue";
		publicVariable "cpBValue";
		publicVariable "cpCValue";

		couleurA = drapeauBlanc_A; // icon_allemand.paa / icon_americain.paa
		couleurB = drapeauBlanc_B;
		couleurC = drapeauBlanc_C;

		publicVariable "couleurA";
		publicVariable "couleurB";
		publicVariable "couleurC";

		ticketsBlu = _mode_date select 8;
		ticketsRed = _mode_date select 9;
		
		publicVariable "ticketsBlu";
		publicVariable "ticketsRed";
    };
	case 2:
	{
		[[1988, 5, 16, 7, 0]] remoteExec ["setDate"];
	};
	case 3: // N° du mod de jeu
    {
		pourcentagePiratage = 0;
		viePirates = _mode_date select 8;
							
		publicVariable "viePirates";
		publicVariable "pourcentagePiratage";

		cpAValue = 0;
		cpBValue = 0;
		cpCValue = 0;

		publicVariable "cpAValue";
		publicVariable "cpBValue";
		publicVariable "cpCValue";

		sleep 2;

		[] spawn _set_time;
    };
	case 4: 
	{
		cpAValue = 0;
		cpBValue = 0;
		cpCValue = 0;

		publicVariable "cpAValue";
		publicVariable "cpBValue";
		publicVariable "cpCValue";
		
		ticketsBlu = _mode_date select 8;
		ticketsRed = _mode_date select 9;
		
		publicVariable "ticketsBlu";
		publicVariable "ticketsRed";

		sleep 2;

		[[1988, 5, 16, 1, 0]] remoteExec ["setDate"];

		cpAValueID hideObjectGlobal true;
		cpBValueID hideObjectGlobal true;
		cpCValueID hideObjectGlobal true;

		[] spawn _set_time;
	};
};
