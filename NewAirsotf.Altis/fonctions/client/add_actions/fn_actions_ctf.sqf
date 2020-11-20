
if(side player == west) then
{
	(toilettes select 0) addAction ["Urine", {[] call mission_fnc_uriner}, [], 1.5, true, true, "", "player distance (toilettes select 0) <= 10 && !boire && !uriner"];
	(toilettes select 1) addAction ["Urine", {[] call mission_fnc_uriner}, [], 1.5, true, true, "", "player distance (toilettes select 1) <= 10 && !boire && !uriner"];

	(eau_bis select 0) addAction ["Boire", {[] call mission_fnc_boire}, [], 1.5, true, true, "", "player distance (eau_bis select 0) <= 10 && !uriner && !boire"];

	//(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Armes</t>", "0 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	//(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Général</t>", "0 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	//(pancartes select 0) addAction ["<t color='#1d24e0'>Parachutage</t>", "3 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10 && parachute_on == 1"];

	// (pancartes select 0) addAction ["<t color='#1d24e0'>Menu Admin</t>", "call fn_menu_admin", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10 && (getPlayerUID player) in (liste_admin_VIP select 0)"];

	// (pancartes select 0) addAction ["<t color='#1d24e0'>Menu Piratage Bleu</t>", "1 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
    // (pancartes select 0) addAction ["<t color='#1d24e0'>Menu Piratage Rouge</t>", "2 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	// (pancartes select 0) addAction ["<t color='#1d24e0'>Menu VIP</t>", "4 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	// (pancartes select 0) addAction ["<t color='#1d24e0'>Menu Armes Piratage</t>", "1 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
}
else
{
	(toilettes select 2) addAction ["Urine", {[] call mission_fnc_uriner}, [], 1.5, true, true, "", "player distance (toilettes select 2) <= 10 && !boire && !uriner"];
	(toilettes select 3) addAction ["Urine", {[] call mission_fnc_uriner}, [], 1.5, true, true, "", "player distance (toilettes select 3) <= 10 && !boire && !uriner"];

	(eau_bis select 1) addAction ["Boire", {[] call mission_fnc_boire}, [], 1.5, true, true, "", "player distance (eau_bis select 1) <= 10 && !uriner && !boire"];

	//(pancartes select 1) addAction ["<t color='#a62802'>Menu Armes</t>", "0 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
	//(pancartes select 1) addAction ["<t color='#a62802'>Menu Général</t>", "0 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
	//(pancartes select 1) addAction ["<t color='#a62802'>Parachutage</t>", "3 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10 && parachute_on == 1"];
	
	// (pancartes select 1) addAction ["<t color='#a62802'>Menu Admin</t>", "call fn_menu_admin", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10 && (getPlayerUID player) in (liste_admin_VIP select 0)"];

	// (pancartes select 1) addAction ["<t color='#1d24e0'>Menu Piratage Bleu</t>", "1 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
    // (pancartes select 1) addAction ["<t color='#1d24e0'>Menu Piratage Rouge</t>", "2 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
	// (pancartes select 1) addAction ["<t color='#1d24e0'>Menu VIP</t>", "4 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
	// (pancartes select 1) addAction ["<t color='#1d24e0'>Menu Armes Piratage</t>", "1 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
};

waitUntil{gg_gamestatus == 1};

switch (arena select 3) do 
{
	case 1: 
	{
		if(side player == west) then
		{
			(cp_flag select 0) addAction ["<t color='#3080ff'>Capture A</t>", {["A", 1] call mission_fnc_capture_drapeau}, [], 1.5, true, true, "", "cpAValue != 1 && player distance (cp_flag select 0) <= 8 && !beingHit"];
			(cp_flag select 1) addAction ["<t color='#3080ff'>Capture B</t>", {["B", 1] call mission_fnc_capture_drapeau}, [], 1.5, true, true, "", "cpBValue != 1 && player distance (cp_flag select 1) <= 8 && !beingHit"];
			(cp_flag select 2) addAction ["<t color='#3080ff'>Capture C</t>", {["C", 1] call mission_fnc_capture_drapeau}, [], 1.5, true, true, "", "cpCValue != 1 && player distance (cp_flag select 2) <= 8 && !beingHit"];

			(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Armes</t>", "0 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
			(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Général</t>", "0 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
			(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Tenues</t>", "8 call fn_menu_bis_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
			(pancartes select 0) addAction ["<t color='#1d24e0'>Parachutage</t>", "3 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10 && parachute_on == 1"];
		}
		else
		{
			(cp_flag select 0) addAction ["<t color='#ff3030'>Capture A</t>", {["A", -1] call mission_fnc_capture_drapeau}, [], 1.5, true, true, "", "cpAValue != -1 && player distance (cp_flag select 0) <= 8 && !beingHit"];
			(cp_flag select 1) addAction ["<t color='#ff3030'>Capture B</t>", {["B", -1] call mission_fnc_capture_drapeau}, [], 1.5, true, true, "", "cpBValue != -1 && player distance (cp_flag select 1) <= 8 && !beingHit"];
			(cp_flag select 2) addAction ["<t color='#ff3030'>Capture C</t>", {["C", -1] call mission_fnc_capture_drapeau}, [], 1.5, true, true, "", "cpCValue != -1 && player distance (cp_flag select 2) <= 8 && !beingHit"];

			(pancartes select 1) addAction ["<t color='#a62802'>Menu Armes</t>", "0 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
			(pancartes select 1) addAction ["<t color='#a62802'>Menu Général</t>", "0 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
			(pancartes select 1) addAction ["<t color='#a62802'>Menu Tenues</t>", "9 call fn_menu_bis_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
			(pancartes select 1) addAction ["<t color='#a62802'>Parachutage</t>", "3 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10 && parachute_on == 1"];
		};
	};
	case 4:
	{
		if(side player == west) then
		{
			(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Armes</t>", "2 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
			(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Général</t>", "7 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
			(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Tenues</t>", "11 call fn_menu_bis_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
		}
		else
		{
			(pancartes select 1) addAction ["<t color='#a62802'>Menu Armes</t>", "2 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
			(pancartes select 1) addAction ["<t color='#a62802'>Menu Général</t>", "7 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
			(pancartes select 1) addAction ["<t color='#a62802'>Menu Tenues</t>", "12 call fn_menu_bis_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
		};
	};
};

player addAction ["Boire 1 bouteille", {[] call mission_fnc_boire_bouteille}, [], 1, true, true, "", "bouteilles_restantes != 0"];

valeurMenu = 0;

(findDisplay 46) displayAddEventHandler ["KeyDown", 
{
	// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
	private _variable = missionNamespace getVariable nomVarPlayerUID;

	if ((_this select 1) == 21 && valeurMenu == 0 && (_variable select 7) > 0) then 
	{
		[] call mission_fnc_menu_admin;
	};
}];
