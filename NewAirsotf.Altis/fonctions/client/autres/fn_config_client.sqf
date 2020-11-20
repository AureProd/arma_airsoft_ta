
private _addImageToId = 
{
	private _count = param [0];

	{
		(call compile (_x select 0)) setObjectTexture [0, (_x select 1)];
	} forEach (arena select _count);
};

private _musiqueLaserGame = 
{
	while {true} do 
	{
		playMusic "ambiance";
		
		sleep 130;
	};
};

private _mode_date = (getArray(missionConfigFile >> "CfgGungame" >> "modes_jeux" >> "data")) select ((arena select 3) - 1);

switch (arena select 3) do
{
    case 1: // N° du mod de jeu
    {
        nd_bouteilles = _mode_date select 6;
		bouteilles_restantes = _mode_date select 7;

        smoke = _mode_date select 2;
        grenade = _mode_date select 3;

        kit_soin_restant = _mode_date select 4;
        kit_soin = _mode_date select 5;

		[] spawn mission_fnc_jump;

		[12] call _addImageToId;

		cp_flag = [(call compile ((arena select 7) select 0)), (call compile ((arena select 8) select 0)), (call compile ((arena select 9) select 0))]; // [id drapeau A, id drapeau B, id drapeau C]
		pancartes = [call compile ((arena select 13) select 0), call compile ((arena select 13) select 1)]; // [id pancarte bleu, id pancarte rouge]
		toilettes = [call compile ((arena select 14) select 0), call compile ((arena select 14) select 1), call compile ((arena select 14) select 2), call compile ((arena select 14) select 3)]; // [id toilette bleu 1, id toilette bleu 2, id pancarte rouge 1, id pancarte rouge 2]
		eau_bis = [call compile ((arena select 15) select 0), call compile ((arena select 15) select 1)]; // [id eau bleu, id eau rouge]

		parachute_on = arena select 17; // acces au menu parachute / 1 si oui et 0 si non

		cpAValueID = cp_flag select 0; // id drapeau A
		cpBValueID = cp_flag select 1; // id drapeau B
		cpCValueID = cp_flag select 2; // id drapeau C

		spawnRedValue = call compile ((arena select 16) select 0); // id declencheur base rouges
		spawnblueValue = call compile ((arena select 16) select 1); // id declencheur base bleues

        publicVariable "cpAValueID";
        publicVariable "cpBValueID";
        publicVariable "cpCValueID";

		publicVariable "cp_flag";
		publicVariable "pancartes";
		publicVariable "toilettes";
		publicVariable "eau_bis";

		publicVariable "parachute_on";

		[] call mission_fnc_actions_ctf;
    };
    case 2:
    {
		kit_soin_restant = _mode_date select 4;
        kit_soin = _mode_date select 5;

		waitUntil {VIPon == 1};

		if (side player == west) then
		{
          if (player == VIP) then 
          {
            smoke = _mode_date select 6;
            pellets = _mode_date select 8;
            grenade = _mode_date select 7;
          } 
          else 
          {
            smoke = _mode_date select 2;
            grenade = _mode_date select 3;
          };
		};

		pancartes = [call compile ((arena select 10) select 0), call compile ((arena select 10) select 1)]; // [pancarte bleue, pancarte rouge]

		spawnRedValue = call compile ((arena select 11) select 0);
		spawnblueValue = call compile ((arena select 11) select 1);

		RescueZone = call compile (arena select 12);

        publicVariable "RescueZone";

		publicVariable "pancartes";

		[] call mission_fnc_actions_vip;
    };
	case 3:
    {
		if (side player == west) then
		{
			pellets = _mode_date select 4;
			smoke = _mode_date select 6;
          	grenade = _mode_date select 7;

			wifi = 0; // 0 = pas de signal / 1 = signal faible / 2 = signal moyen / 3 = signal fort
          	bombeIEM_pourcentage = 100;
		}
		else
		{
			smoke = _mode_date select 2;
          	grenade = _mode_date select 3;
			pistolet = _mode_date select 5;
		};

		if (side player == west) then 
		{
			[] spawn mission_fnc_jump;
		};

		ordinateurs = [call compile ((arena select 13) select 0), call compile ((arena select 13) select 1), call compile ((arena select 13) select 2)]; // [PC 1, PC 2, PC 3]
		pancartes = [call compile (arena select 14)]; // [pancarte rouge]
		PNJ = [call compile ((arena select 15) select 0), call compile ((arena select 15) select 1)]; // [PNJ 1, PNJ 2]

		spawnRedValue = call compile ((arena select 16) select 0); // [déclencheur rouges]
		spawnblueValue = call compile ((arena select 16) select 1); // [déclencheur bleues]

		lampadaires = [];
		{
			lampadaires pushBack (call compile _x);
		} forEach (arena select 17);

		//lampadaires = [lampadaire_1, lampadaire_2, lampadaire_3, lampadaire_4, lampadaire_5];

		publicVariable "ordinateurs";
		publicVariable "pancartes";
		publicVariable "PNJ";

		[] call mission_fnc_actions_piratage;
    };
	case 4:
    {
		nd_bouteilles = _mode_date select 6;
		bouteilles_restantes = _mode_date select 7;

        smoke = _mode_date select 2;
        grenade = _mode_date select 3;

        kit_soin_restant = _mode_date select 4;
        kit_soin = _mode_date select 5;

		[] spawn mission_fnc_jump;
		[] spawn _musiqueLaserGame;

		[12] call _addImageToId;

		cp_flag = [(call compile (arena select 7)), (call compile (arena select 8)), (call compile (arena select 9))]; // [id drapeau A, id drapeau B, id drapeau C]
		pancartes = [call compile ((arena select 13) select 0), call compile ((arena select 13) select 1)]; // [id pancarte bleu, id pancarte rouge]
		toilettes = [call compile ((arena select 14) select 0), call compile ((arena select 14) select 1), call compile ((arena select 14) select 2), call compile ((arena select 14) select 3)]; // [id toilette bleu 1, id toilette bleu 2, id pancarte rouge 1, id pancarte rouge 2]
		eau_bis = [call compile ((arena select 15) select 0), call compile ((arena select 15) select 1)]; // [id eau bleu, id eau rouge]

		parachute_on = arena select 17; // acces au menu parachute / 1 si oui et 0 si non

		cpAValueID = cp_flag select 0; // id drapeau A
		cpBValueID = cp_flag select 1; // id drapeau B
		cpCValueID = cp_flag select 2; // id drapeau C

		spawnRedValue = call compile ((arena select 16) select 0); // id declencheur base rouges
		spawnblueValue = call compile ((arena select 16) select 1); // id declencheur base bleues

        publicVariable "cpAValueID";
        publicVariable "cpBValueID";
        publicVariable "cpCValueID";

		publicVariable "cp_flag";
		publicVariable "pancartes";
		publicVariable "toilettes";
		publicVariable "eau_bis";

		publicVariable "parachute_on";

		[] call mission_fnc_actions_ctf;
    };
};

publicVariable "spawnRedValue";
publicVariable "spawnblueValue";
