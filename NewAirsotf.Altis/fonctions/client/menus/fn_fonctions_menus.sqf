
fn_affiche_argent_allPlayer =
{
	_listbox = (findDisplay 1556) displayCtrl 1102;
	_hauteur = lbCurSel ((findDisplay 1556) displayCtrl 1500);

	_joueur = allPlayers select _hauteur;

	// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
	private _variable = missionNamespace getVariable (format ["variable_%1", getPlayerUID _joueur]);

	_joueur_argent = _variable select 0;

	_listbox ctrlSetStructuredText parseText format ["<t size='1.25' color='#000000'>%1</t>", _joueur_argent];
};

fn_change_argent_allPlayers =
{
	_argent = _this select 0;

	_hauteur = lbCurSel ((findDisplay 1556) displayCtrl 1500);

	_joueur = allPlayers select _hauteur;

	[[[0, _argent]], _joueur] call mission_fnc_modif_var_bdd;
};

fn_appui_reset =
{
	_checkbox_admin_bis = ctrlChecked ((findDisplay 1556) displayCtrl 2801);
	_checkbox_VIP_bis = ctrlChecked ((findDisplay 1556) displayCtrl 2800);

	_configbis1 = getArray(missionConfigFile >> "admin_VIP" >> "liste" >> "data");
	_liste1_bis = _configbis1 select 0;
	_liste2_bis = _configbis1 select 1;

	[0] call fn_change_argent_allPlayers;
	call fn_affiche_argent_allPlayer;
};

fn_appui_set =
{
	_checkbox_admin_bis = ctrlChecked ((findDisplay 1556) displayCtrl 2801);
	_checkbox_VIP_bis = ctrlChecked ((findDisplay 1556) displayCtrl 2800);

	_argent = ctrlText ((findDisplay 1556) displayCtrl 1400);
	_ok = 1;

	for "_i" from 0 to ((count _argent) - 1) do {
		_car = (_argent select [_i, 1]);

		if (_car == "0" || _car == "1" || _car == "2" || _car == "3" || _car == "4" || _car == "5" || _car == "6" || _car == "7" || _car == "8" || _car == "9") then 
		{}
		else
		{
			_ok = 0;
		};
	};

	if (_ok == 1) then {
		_argent_bis = [_argent] call toNumber;
		
		[_argent_bis] call fn_change_argent_allPlayers;
		call fn_affiche_argent_allPlayer;
	}
	else
	{
		hint "ERREUR : Rentrez un nombre SVP !";
	};

	((findDisplay 1556) displayCtrl 1400) ctrlSetText "";
};

fn_menu =
{
	valeurMenu = 1;
	closeDialog 0;
	disableSerialization;

	createDialog "menu";
	waitUntil {dialog};

	_listbox1 = (findDisplay 155) displayCtrl 102;
	_listbox2 = (findDisplay 155) displayCtrl 103;
	
	lbClear _listbox1;
	lbClear _listbox2;

	_configbis1 = getArray(missionConfigFile >> "TA" >> "guns" >> "data");
	config2 = getArray(missionConfigFile >> "TA" >> "viseurs" >> "data");

	config1 = _configbis1 select _this;
	menu = _this;

	_config2_1 = config2 select 0;

	{
		if ((_x select 1) == 0) then 
		{
			_listbox1 lbAdd (_x select 0);
		}
		else
		{
			_picture_arme_id = getText(configFile >>  "CfgWeapons" >> (_x select 5) >> "picture");
			_index = _listbox1 lbAdd format ["%1 (%2-c-)", (_x select 0), (_x select 2)];
			_listbox1 lbSetPicture [_index, _picture_arme_id];
		};
	} forEach config1;

	{
		if ((_x select 1) == 0) then 
		{
			_listbox2 lbAdd (_x select 0);
		}
		else
		{
			_picture_arme_id = getText(configFile >>  "CfgWeapons" >> (_x select 3) >> "picture");
			_index = _listbox2 lbAdd format ["%1 (%2-c-)", (_x select 0), (_x select 2)];
			_listbox2 lbSetPicture [_index, _picture_arme_id];
		};
	} forEach _config2_1;

	_listbox1 lbSetCurSel 0;
	_listbox2 lbSetCurSel 0;

	[] spawn
	{
		while {valeurMenu == 1} do 
		{
			_picture_arme = (findDisplay 155) displayCtrl 1201;
			_picture_viseur = (findDisplay 155) displayCtrl 1202;

			_listbis1 = lbCurSel ((findDisplay 155) displayCtrl 102);
			_configList1 = config1 select _listbis1;

			_configList2 = _configList1 select 4;
			_config2bis = config2 select _configList2;

			_listbox2 = (findDisplay 155) displayCtrl 103;

			lbClear _listbox2;

			{
				if ((_x select 1) == 0) then 
				{
					_listbox2 lbAdd (_x select 0);
				}
				else
				{
					_picture_arme_id = getText(configFile >>  "CfgWeapons" >> (_x select 3) >> "picture");
					_index = _listbox2 lbAdd format ["%1 (%2-c-)", (_x select 0), (_x select 2)];
					_listbox2 lbSetPicture [_index, _picture_arme_id];
				};
			} forEach _config2bis;

			sleep 0.1;
		};
	};
};

fn_valider =
{
	_list1 = lbCurSel ((findDisplay 155) displayCtrl 102);
	_list2 = lbCurSel ((findDisplay 155) displayCtrl 103);

	_configbis1_1 = getArray(missionConfigFile >> "TA" >> "guns" >> "data");
	_configbis2_1 = getArray(missionConfigFile >> "TA" >> "viseurs" >> "data");

	_configbis1_1_1 = _configbis1_1 select menu;
	_configbis1 = _configbis1_1_1 select _list1;

	_configbis2 = _configbis2_1 select (_configbis1 select 4);
	_configters2 = _configbis2 select _list2;

	_armes = weaponsItems player;
	_arme = 0;
	_viseur = 0;

	{
		if ((_x select 0) == (_configbis1 select 5)) then 
		{
			_arme = 1;

			if ((_x select 3) == (_configters2 select 4)) then 
			{
				_viseur = 1;
			};
		};
	} forEach _armes;

	_prix = (_configbis1 select 2) + (_configters2 select 2);

	if ((_configbis1 select 1) == 1 && (_configters2 select 1) == 1 && _viseur == 0 && _arme == 0) then 
	{
		if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= _prix) then 
		{
			[_prix, 0] call mission_fnc_modif_money;

			call compile(_configbis1 select 3);
			[(_configbis1 select 4), (_configters2 select 3)] call fn_viseur;
			
			titleText[format["Réplique %1 et viseur %2 loués", (_configbis1 select 0), (_configters2 select 0)], "PLAIN DOWN", 0.25];

			playSound "purchase";
		}
		else
		{
			call fn_InsufficientFunds;
		};
	}
	else
	{
		if ((_configbis1 select 1) == 1 && _arme == 0) then 
		{
			if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
			{
				[(_configbis1 select 2), 0] call mission_fnc_modif_money;
				
				call compile(_configbis1 select 3);

				titleText[format["Réplique %1 louée", (_configbis1 select 0)], "PLAIN DOWN", 0.25];
				
				playSound "purchase";
			}
			else
			{
				call fn_InsufficientFunds;
			};
		};

		if ((_configters2 select 1) == 1 && _viseur == 0) then 
		{
			if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configters2 select 2)) then
			{
				[(_configters2 select 2), 0] call mission_fnc_modif_money;
				
				[(_configbis1 select 4), (_configters2 select 3)] call fn_viseur;

				titleText[format["Viseur %1 loué", (_configters2 select 0)], "PLAIN DOWN", 0.25];
				
				playSound "purchase";
			}
			else
			{
				call fn_InsufficientFunds;
			};
		};
	};	
	valeurMenu = 0;
	closeDialog 1;
};

fn_menu_stop =
{
	valeurMenu = 0;
};

fn_menu_bis =
{
	menu_bis = _this;
	
	closeDialog 0;
	disableSerialization;

	createDialog "menu_bis";
	waitUntil {dialog};

	_listbox1 = (findDisplay 154) displayCtrl 1500;
	
	lbClear _listbox1;

	_configbis1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");
	
	_config1 = _configbis1 select _this;

	{
		if ((_x select 4) == 0) then 
		{
			_listbox1 lbAdd (_x select 0);
		}
		else
		{
			_listbox1 lbAdd format ["%1 (%2 -c-)", (_x select 0), (_x select 2)];
		};
	} forEach _config1;

	_listbox1 lbSetCurSel 0;
};

fn_menu_bis_bis =
{
	menu_bis = _this;
	valeurMenu = 1;
	
	closeDialog 0;
	disableSerialization;

	createDialog "menu_bis";
	waitUntil {dialog};

	_listbox1 = (findDisplay 154) displayCtrl 1500;
	_image_tenue = (findDisplay 154) displayCtrl 1201;
	
	lbClear _listbox1;

	_configbis1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");
	
	_config1 = _configbis1 select _this;

	switch (menu_bis) do 
	{
		case 8: 
		{
			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			{
				if ((_x select 5) in (_tableau_tenues select 0)) then 
				{
					_listbox1 lbAdd format ["%1 (achetée)", (_x select 0)];
				}
				else
				{
					_listbox1 lbAdd format ["%1 (perma: %2 -c-)", (_x select 0), (_x select 2)];
				};
			} forEach (_config1 select 0);

			private _playerBdd = missionNamespace getVariable nomVarPlayerUID;
			_niveau_VIP = _playerBdd select 6;

			switch (_niveau_VIP) do 
			{
				case 3: 
				{
					[1, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
					[2, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
					[3, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
				};
				case 2: 
				{
					[1, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
					[2, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
				};
				case 1: 
				{
					[1, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
				};
				case 0:
				{};
			};
		};
		case 9:
		{
			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			{
				if ((_x select 5) in (_tableau_tenues select 1)) then 
				{
					_listbox1 lbAdd format ["%1 (achetée)", (_x select 0)];
				}
				else
				{
					_listbox1 lbAdd format ["%1 (perma: %2 -c-)", (_x select 0), (_x select 2)];
				};
			} forEach (_config1 select 0);

			private _playerBdd = missionNamespace getVariable nomVarPlayerUID;
			_niveau_VIP = _playerBdd select 6;

			switch (_niveau_VIP) do 
			{
				case 3: 
				{
					[1, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
					[2, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
					[3, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
				};
				case 2: 
				{
					[1, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
					[2, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
				};
				case 1: 
				{
					[1, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
				};
				case 0:
				{};
			};
		};
		case 11: 
		{
			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			{
				if ((_x select 5) in (_tableau_tenues select 0) || (_x select 2) == 0) then 
				{
					_listbox1 lbAdd format ["%1 (achetée)", (_x select 0)];
				}
				else
				{
					_listbox1 lbAdd format ["%1 (perma: %2 -c-)", (_x select 0), (_x select 2)];
				};
			} forEach (_config1 select 0);

			private _playerBdd = missionNamespace getVariable nomVarPlayerUID;
			_niveau_VIP = _playerBdd select 6;

			switch (_niveau_VIP) do 
			{
				case 3: 
				{
					[2, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
				};
				case 2: 
				{
					[2, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
				};
				case 1: 
				{
					[2, _config1, _listbox1, (_tableau_tenues select 0)] call fn_forach_tenue;
				};
				case 0:
				{};
			};
		};
		case 12:
		{
			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			{
				if ((_x select 5) in (_tableau_tenues select 1) || (_x select 2) == 0) then 
				{
					_listbox1 lbAdd format ["%1 (achetée)", (_x select 0)];
				}
				else
				{
					_listbox1 lbAdd format ["%1 (perma: %2 -c-)", (_x select 0), (_x select 2)];
				};
			} forEach (_config1 select 0);

			private _playerBdd = missionNamespace getVariable nomVarPlayerUID;
			_niveau_VIP = _playerBdd select 6;

			switch (_niveau_VIP) do 
			{
				case 3: 
				{
					[2, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
				};
				case 2: 
				{
					[2, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
				};
				case 1: 
				{
					[2, _config1, _listbox1, (_tableau_tenues select 1)] call fn_forach_tenue;
				};
				case 0:
				{};
			};
		};
	};

	_listbox1 lbSetCurSel 0;

	[_image_tenue] spawn
	{
		_image = _this select 0;

		switch (menu_bis) do 
		{
			case 8: 
			{
				while {valeurMenu == 1} do 
				{
					_list1 = lbCurSel ((findDisplay 154) displayCtrl 1500);

					_configbis1_1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");

					_configbis1_1_1 = _configbis1_1 select menu_bis;

					_configbis1Bis = _configbis1_1_1 select 4;
					_configbis1 = _configbis1Bis select _list1;

					_image ctrlSetText (_configbis1 select 6);
				};
			};
			case 9:
			{
				while {valeurMenu == 1} do 
				{
					_list1 = lbCurSel ((findDisplay 154) displayCtrl 1500);

					_configbis1_1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");

					_configbis1_1_1 = _configbis1_1 select menu_bis;

					_configbis1Bis = _configbis1_1_1 select 4;
					_configbis1 = _configbis1Bis select _list1;

					_image ctrlSetText (_configbis1 select 6);
				};
			};
			case 11: 
			{
				while {valeurMenu == 1} do 
				{
					_list1 = lbCurSel ((findDisplay 154) displayCtrl 1500);

					_configbis1_1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");

					_configbis1_1_1 = _configbis1_1 select menu_bis;

					_configbis1Bis = _configbis1_1_1 select 1;
					_configbis1 = _configbis1Bis select _list1;

					_image ctrlSetText (_configbis1 select 6);
				};
			};
			case 12:
			{
				while {valeurMenu == 1} do 
				{
					_list1 = lbCurSel ((findDisplay 154) displayCtrl 1500);

					_configbis1_1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");

					_configbis1_1_1 = _configbis1_1 select menu_bis;

					_configbis1Bis = _configbis1_1_1 select 1;
					_configbis1 = _configbis1Bis select _list1;

					_image ctrlSetText (_configbis1 select 6);
				};
			};
		};
	};
};

// n° liste / liste / listBox
fn_forach_tenue =
{
	_para = _this;

	{
		if ((_x select 5) in (_this select 3) || (_x select 2) == 0) then 
		{
			(_this select 2) lbAdd format ["%1 (achetée)", (_x select 0)];
		}
		else
		{
			(_this select 2) lbAdd format ["%1 (perma: %2 -c-)", (_x select 0), (_x select 2)];
		};
	} forEach ((_this select 1) select (_this select 0));
};

fn_valider_bis =
{
	_list1 = lbCurSel ((findDisplay 154) displayCtrl 1500);

	_configbis1_1 = getArray(missionConfigFile >> "TA_bis" >> "autre" >> "data");

	_configbis1_1_1 = _configbis1_1 select menu_bis;

	switch (menu_bis) do {
		case 8: 
		{ 
			_configbis1Bis = _configbis1_1_1 select 4;
			_configbis1 = _configbis1Bis select _list1;

			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			if ((_configbis1 select 5) in (_tableau_tenues select 0)) then 
			{
				call compile(_configbis1 select 3);

				player setVariable ["tenueOn", _configbis1 select 3];

				titleText[format["%1 équipée", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

				playSound "purchase";
			}
			else
			{
				switch ((_configbis1 select 1)) do {
					case 1: 
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{
							[(_configbis1 select 2), 0] call mission_fnc_modif_money;
							
							call compile(_configbis1 select 3);

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 0) pushBack (_configbis1 select 5);

							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;

							player setVariable ["tenueOn", _configbis1 select 3];
							
							titleText[format["%1 acheté", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

							playSound "purchase";
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
					case 2:
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{				
							call compile(_configbis1 select 3);

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 0) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
				};
			};
		};
		case 9: 
		{ 
			_configbis1Bis = _configbis1_1_1 select 4;
			_configbis1 = _configbis1Bis select _list1;

			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			if ((_configbis1 select 5) in (_tableau_tenues select 1)) then 
			{
				call compile(_configbis1 select 3);

				titleText[format["%1 équipée", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

				player setVariable ["tenueOn", _configbis1 select 3];

				playSound "purchase";
			}
			else
			{
				switch ((_configbis1 select 1)) do {
					case 1: 
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{
							[(_configbis1 select 2), 0] call mission_fnc_modif_money;
							
							call compile(_configbis1 select 3);

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 1) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;
							
							titleText[format["%1 acheté", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

							player setVariable ["tenueOn", _configbis1 select 3];

							playSound "purchase";
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
					case 2:
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{				
							call compile(_configbis1 select 3);

							player setVariable ["tenueOn", _configbis1 select 3];

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 1) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
				};
			};
		};
		case 11: 
		{ 
			_configbis1Bis = _configbis1_1_1 select 1;
			_configbis1 = _configbis1Bis select _list1;

			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			if ((_configbis1 select 5) in (_tableau_tenues select 0) || (_configbis1 select 2) == 0) then 
			{
				call compile(_configbis1 select 3);

				player setVariable ["tenueOn", _configbis1 select 3];

				titleText[format["%1 équipée", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

				playSound "purchase";
			}
			else
			{
				switch ((_configbis1 select 1)) do {
					case 1: 
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{
							[(_configbis1 select 2), 0] call mission_fnc_modif_money;
							
							call compile(_configbis1 select 3);

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 0) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;

							player setVariable ["tenueOn", _configbis1 select 3];
							
							titleText[format["%1 acheté", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

							playSound "purchase";
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
					case 2:
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{				
							call compile(_configbis1 select 3);

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 0) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
				};
			};
		};
		case 12: 
		{ 
			_configbis1Bis = _configbis1_1_1 select 1;
			_configbis1 = _configbis1Bis select _list1;

			_tableau_tenues = ((missionNamespace getVariable nomVarPlayerUID) select 1);

			if ((_configbis1 select 5) in (_tableau_tenues select 1) || (_configbis1 select 2) == 0) then 
			{
				call compile(_configbis1 select 3);

				titleText[format["%1 équipée", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

				player setVariable ["tenueOn", _configbis1 select 3];

				playSound "purchase";
			}
			else
			{
				switch ((_configbis1 select 1)) do {
					case 1: 
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{
							[(_configbis1 select 2), 0] call mission_fnc_modif_money;
							
							call compile(_configbis1 select 3);

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 1) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;
							
							titleText[format["%1 acheté", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

							player setVariable ["tenueOn", _configbis1 select 3];

							playSound "purchase";
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
					case 2:
					{ 
						if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
						{				
							call compile(_configbis1 select 3);

							player setVariable ["tenueOn", _configbis1 select 3];

							// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
							private _playerBdd = missionNamespace getVariable nomVarPlayerUID;

							_valeur = (_playerBdd select 1);
							(_valeur select 1) pushBack (_configbis1 select 5);
							
							[[[1, _valeur]], player] call mission_fnc_modif_var_bdd;
						}
						else
						{
							call fn_InsufficientFunds;
						};
					};
				};
			};
		};
		default 
		{ 
			_configbis1 = _configbis1_1_1 select _list1;

			switch ((_configbis1 select 1)) do {
				case 1: 
				{ 
					if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
					{
						[(_configbis1 select 2), 0] call mission_fnc_modif_money;
						
						call compile(_configbis1 select 3);
						
						titleText[format["%1 acheté", (_configbis1 select 0)], "PLAIN DOWN", 0.25];

						playSound "purchase";
					}
					else
					{
						call fn_InsufficientFunds;
					};
				};
				case 2:
				{ 
					if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_configbis1 select 2)) then
					{				
						call compile(_configbis1 select 3);
					}
					else
					{
						call fn_InsufficientFunds;
					};
				};
			};
		};
	};
	
	if (menu_bis == 3 || menu_bis == 8 || menu_bis == 9) then 
	{
		valeurMenu = 0;
		closeDialog 1;
	};
};

fn_quit_bis =
{
	closeDialog 1;	
};

toNumber = 
{
	_string = _this select 0;
	_ok = 1;
	_valeur = 0;

	for "_i" from 0 to ((count _string) - 1) do {
		_car = (_string select [_i, 1]);

		if (_car == "0" || _car == "1" || _car == "2" || _car == "3" || _car == "4" || _car == "5" || _car == "6" || _car == "7" || _car == "8" || _car == "9") then 
		{}
		else
		{
			_ok = 0;
		};
	};

	if (_ok == 1) then 
	{
		for "_i" from 0 to ((count _string) - 1) do {
			_car = (_string select [_i, 1]);

			_num = (count _string) - (_i + 1);

			switch (_car) do {
				case "0": {
					_valeur = _valeur + (0 * (10^(_num)));
				};
				case "1": {
					_valeur = _valeur + (1 * (10^(_num)));
				};
				case "2": {
					_valeur = _valeur + (2 * (10^(_num)));
				};
				case "3": {
					_valeur = _valeur + (3 * (10^(_num)));
				};
				case "4": {
					_valeur = _valeur + (4 * (10^(_num)));
				};
				case "5": {
					_valeur = _valeur + (5 * (10^(_num)));
				};
				case "6": {
					_valeur = _valeur + (6 * (10^(_num)));
				};
				case "7": {
					_valeur = _valeur + (7 * (10^(_num)));
				};
				case "8": {
					_valeur = _valeur + (8 * (10^(_num)));
				};
				case "9": {
					_valeur = _valeur + (9 * (10^(_num)));
				};
			};
		};
	} 
	else 
	{
		hint "ERREUR : Le text rentré n'est pas un nombre !!!";
	};

	_valeur;
};

/* 
fn_chargement =
{
	waitUntil {!(isNull (findDisplay 46))};
	disableSerialization;

	((uiNamespace getVariable "chargement") displayCtrl 1200) ctrlShow true;
	 
	1595 cutRsc ["chargement", "PLAIN"];

	[] spawn
	{
		_counter = 20; 

		for "_i" from 1 to _counter do { 
			((uiNamespace getVariable "chargement") displayCtrl 1200) progressSetPosition (_i/_counter); 
			// hintsilent format ["%1", _i];
			sleep 0.5; 
		}; 

		((uiNamespace getVariable "chargement") displayCtrl 1200) ctrlShow false;
	};
};
*/

/* 
fn_chargement_rond =
{
	waitUntil {!(isNull (findDisplay 46))};
	disableSerialization;

	((uiNamespace getVariable "chargement_rond") displayCtrl 1200) ctrlShow true;
	 
	1596 cutRsc ["chargement_rond", "PLAIN"];

	[] spawn
	{
		_time = 0.2;

		for "_i" from 1 to 25 do {
			_image = _i - 1;
			((uiNamespace getVariable "chargement_rond") displayCtrl 1100) ctrlSetStructuredText parseText format["<img image='TA-image\progress2\progress_%1_ca.paa' size='3' />", _image]; 
			// hintsilent format ["%1", _i];
			sleep _time; 
		}; 

		((uiNamespace getVariable "chargement_rond") displayCtrl 1100) ctrlShow false;
	};
}; 
*/