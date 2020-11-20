
if (player == VIP) then 
{
	if(side player == west) then
	{
		(pancartes select 0) addAction ["Menu", "4 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	};
}
else 
{
	if(side player == west) then
	{
		(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Armes</t>", "0 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
		(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Général</t>", "6 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
		(pancartes select 0) addAction ["<t color='#1d24e0'>Menu Tenues</t>", "8 call fn_menu_bis_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	}
	else
	{
		(pancartes select 1) addAction ["<t color='#a62802'>Menu Armes</t>", "0 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
		(pancartes select 1) addAction ["<t color='#a62802'>Menu Général</t>", "10 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
		(pancartes select 1) addAction ["<t color='#a62802'>Menu Tenues</t>", "9 call fn_menu_bis_bis", [], 1.5, true, true, "", "player distance (pancartes select 1) <= 10"];
	};
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