
if(side player == west) then
{
    (ordinateurs select 0) addAction ["Pirater le Terminal A", "call fn_pirate_A", [], 1.5, true, true, "", "cpAValue != -1 && cpBValue != -1 && cpCValue != -1 && (currentWeapon player) isEqualTo 'Laserdesignator'"];
	(ordinateurs select 1) addAction ["Pirater le Terminal B", "call fn_pirate_B", [], 1.5, true, true, "", "cpAValue != -1 && cpBValue != -1 && cpCValue != -1 && (currentWeapon player) isEqualTo 'Laserdesignator'"];
	(ordinateurs select 2) addAction ["Pirater le Terminal C", "call fn_pirate_C", [], 1.5, true, true, "", "cpAValue != -1 && cpBValue != -1 && cpCValue != -1 && (currentWeapon player) isEqualTo 'Laserdesignator'"];

	(PNJ select 0) addAction ["<t color='#1d24e0'>Menu</t>", "1 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 0) <= 10"];

	(PNJ select 1) addAction ["<t color='#1d24e0'>Menu</t>", "1 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 1) <= 10"];

	(findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1 == 219) && (bombeIEM_pourcentage == 100) && !beingHit) then {call fn_bombeIEM}"]; // P

	(findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 49) then {call fn_nvg}"]; // N
}
else
{
	(PNJ select 0) addAction ["<t color='#a62802'>Menu</t>", "2 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 0) <= 10"];
	
	(PNJ select 1) addAction ["<t color='#a62802'>Menu</t>", "2 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 1) <= 10"];
    
	(pancartes select 0) addAction ["<t color='#a62802'>Menu Armes</t>", "1 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	(pancartes select 0) addAction ["<t color='#a62802'>Menu Général</t>", "0 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
};

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