
valeurMenu = 1;
closeDialog 0;
disableSerialization;

createDialog "menu_admin";
waitUntil {dialog};

_listbox = (findDisplay 1556) displayCtrl 1500;

lbClear _listbox;

{
	_listbox lbAdd format ["%1", name _x];
} forEach allPlayers;

_listbox lbSetCurSel 0;

call fn_affiche_argent_allPlayer;

[] spawn
{
	while {valeurMenu == 1} do 
	{
		_listbox_bis = (findDisplay 1556) displayCtrl 1500;

		_checkbox_admin_bis = ctrlChecked ((findDisplay 1556) displayCtrl 2801);
		_checkbox_VIP_bis = ctrlChecked ((findDisplay 1556) displayCtrl 2800);

		lbClear _listbox_bis;

		{
			_listbox_bis lbAdd format ["%1", name _x];
		} forEach allPlayers;

		call fn_affiche_argent_allPlayer;

		sleep 0.1;
	};
};