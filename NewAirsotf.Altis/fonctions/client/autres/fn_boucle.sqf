
private _boucle_piratage =
{
	while {gg_gamestatus == 1} do 
	{
		if ((side player) == west) then 
		{
			if ((player distance PC1) < 5 || (player distance PC2) < 5 ||  (player distance PC3) < 5) then 
			{
				wifi = 3;
			}
			else 
			{
				if ((player distance PC1) < 12.5 || (player distance PC2) < 12.5 ||  (player distance PC3) < 12.5) then 
				{
					wifi = 2;
				}
				else 
				{
					if ((player distance PC1) < 20 || (player distance PC2) < 20 ||  (player distance PC3) < 20) then 
					{
						wifi = 1;
					}
					else 
					{
						wifi = 0;
					};
				};
			};

			sleep 0.1;
		}
		else 
		{
			_proche = 0;
			_tresProche = 0;

			{
				if((player distance _x) < 7.5 && (side _x) == west && !(_x getVariable "Hit") && !beingHit) then
				{
					_tresProche = 1;
				}
				else 
				{
					if((player distance _x) < 15 && (side _x) == west && !(_x getVariable "Hit") && !beingHit) then
					{
						_proche = 1;
					};
				};
			} forEach allPlayers;

			if (_tresProche == 1) then 
			{
				playSound "coeurRapide";
				sleep 0.955;
			} 
			else 
			{
				if (_proche == 1) then 
				{
					playSound "coeurLent";
					sleep 1;
				}
				else
				{
					sleep 0.5;
				};
			};
		};
	};
};

private _boucle_pisse =
{
	while {gg_gamestatus == 1} do 
	{
		if (!beingHit) then {
			switch (urinePourcent) do {
				case 100:
				{
					call fn_pisse;
				};
				case 97:
				{
					call fn_pisse;
				};
				case 95: 
				{
					call fn_pisse;
				};
				case 92:
				{
					call fn_pisse;
				};
				case 90: 
				{
					call fn_pisse;
				};
				case 86:
				{
					call fn_pisse;
				};
				case 84:
				{
					call fn_pisse;
				};
				case 80:
				{
					call fn_pisse;
				};
				case 75:
				{
					["Notif",["Douleur au ventre", "Vous n'avez pas ete au toilette depuis un moment!"]] call BIS_fnc_showNotification;
				};
				case 70:
				{
					["Notif",["Douleur au ventre", "Vous n'avez pas ete au toilette depuis un moment!"]] call BIS_fnc_showNotification;
				};
			};
		};

		if(urinePourcent < 100) then
		{
			urinePourcent = urinePourcent + 0.5;
			sleep 15;
		}
		else 
		{
			sleep 30;
		};
	};
};

private _boucle_eau = 
{
	while {gg_gamestatus == 1} do 
	{
		if (!beingHit) then {
			switch (eau) do {
				case 0:
				{
					call fn_bois;
				};
				case 2:
				{
					call fn_bois;
				};
				case 6: 
				{
					call fn_bois;
				};
				case 10:
				{
					call fn_bois;
				};
				case 14: 
				{
					call fn_bois;
				};
				case 18:
				{
					call fn_bois;
				};
				case 22:
				{
					["Notif",["Vous avez soif", "Vous n'avez pas bu depuis un moment!"]] call BIS_fnc_showNotification;
				};
				case 26:
				{
					["Notif",["Vous avez soif", "Vous n'avez pas bu depuis un moment!"]] call BIS_fnc_showNotification;
				};
				case 30:
				{
					["Notif",["Vous avez soif", "Vous n'avez pas bu depuis un moment!"]] call BIS_fnc_showNotification;
				};
			};
		};

		if(eau > 0) then
		{
			eau = eau - 1;

			sleep 15;
		}
		else 
		{
			sleep 30;
		};
	};
};

private _boucle_bombe_iem =
{
	1984 cutRsc ["bombeiem","PLAIN"];

	while {gg_gamestatus == 1} do 
	{
		waitUntil { !isNil "bombeIEM_pourcentage" };

		if (bombeIEM_pourcentage == 100) then 
		{
			_counter = 180;
			_timeSinceLastUpdate = 0;
			
			_counter = _counter - 1;
			(
				(
					uiNamespace getVariable "bombeiem"
				)
				displayCtrl 1100
			)
			ctrlSetStructuredText parseText format
			[
				"<t size='2' color='#FFFFF'>Press Win >> IEM</t>"
			];
		} 
		else 
		{
			bombeIEM_pourcentage = bombeIEM_pourcentage + 1;

			_counter = 180;
			_timeSinceLastUpdate = 0;

			_counter = _counter - 1;
			(
				(
					uiNamespace getVariable "bombeiem"
				)
				displayCtrl 1100
			)
			ctrlSetStructuredText parseText format
			[
				"<t size='2' color='#FFFFF'>%1%2</t>",
				bombeIEM_pourcentage,
				"%"
			];
		};

		sleep 0.5;
	};
};

switch (arena select 3) do 
{
	case 1: 
	{ 
		[] spawn _boucle_eau;
		[] spawn _boucle_pisse;
	};
	case 3: 
	{ 
		if ((side player) == west) then 
		{
			[] spawn _boucle_bombe_iem;
		};

		[] spawn _boucle_piratage
	};
	case 4: 
	{ 
		[] spawn _boucle_eau;
		[] spawn _boucle_pisse;
	};
};