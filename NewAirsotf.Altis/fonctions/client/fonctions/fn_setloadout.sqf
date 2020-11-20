
switch (arena select 3) do
{
    case 1:
    {
		call fn_GetOutfit;
		//execVM "bin\server\fn_statusBar.sqf";

		if (side player == west) then {
			teamString = "Equipe Bleue";

			[] spawn mission_fnc_interface_bleu;
		}
		else
		{
			teamString = "Equipe Rouge";

			[] spawn mission_fnc_interface_rouge;
		};

		[] spawn mission_fnc_statusticket;
    };
	case 2:
    {
        //execVM "bin\server\fn_statusBarBis.sqf";

		if(player == VIP) then
		{
			teamString = "VIP";

			[] spawn mission_fnc_status_bar_bis;

			call fn_VIPTenue;
		}
		else
		{
			call fn_GetOutfit;

			if(side player == west) then
			{
				[] spawn mission_fnc_interface_bleu;
			}
			else
			{
				[] spawn mission_fnc_interface_rouge;
			};
		};
    };
	case 3:
    {
		call fn_GetOutfit_pirate;
		
		if (side player == west) then {
			teamString = "Equipe Bleue";

			// execVM "bin\server\interface_espion.sqf";
		}
		else {
			teamString = "Equipe Rouge";
		};

		[] spawn mission_fnc_statusticket_pirate;
		[] spawn mission_fnc_status_bar_pirate;
		[] spawn mission_fnc_interface_wifi;
    };
	case 4:
	{
		call fn_GetOutfit_laser_games;

		if (side player == west) then {
			teamString = "Equipe Bleue";

			[] spawn mission_fnc_interface_bleu;
		}
		else
		{
			teamString = "Equipe Rouge";

			[] spawn mission_fnc_interface_rouge;
		};

		[] spawn mission_fnc_statusticket;
	};
};