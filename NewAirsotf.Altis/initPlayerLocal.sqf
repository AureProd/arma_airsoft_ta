

// START / DEBUT

[] spawn mission_fnc_briefing;
[] spawn mission_fnc_boules_caisses;
[] spawn mission_fnc_logos;

[] spawn mission_fnc_fonctions_menus;
[] spawn mission_fnc_add_arme;
[] spawn mission_fnc_funcs;

player setVariable ["UID", (getPlayerUID player), true];
player setVariable ["value", false, true];
player setVariable ["revive", false, true];
player setVariable ["revive_progression", [false, nil], true];
player setVariable ["hit", false, true];

if (side player == west) then 
{
	player setVariable ["tenueOn", "call randomGearBlu"];
} 
else 
{
	player setVariable ["tenueOn", "call randomGearRed"];
};

//General Global Vars
projInitSpeed = 60;
timesHit = 0;
hitsGiven = 0;
beingHit = false;
pellets = 150;
dispShots = 0; //Used for dispersion
dispCooldown = 2;
teamString = "";
urinePourcent = 0;
eau = 100;
animationOn = false;
boire = false;
uriner = false;

setShadowDistance 500;
setViewDistance 500;
setObjectViewDistance 500;
player allowDamage false;
enableEnvironment [true, false];
player enableFatigue false;
player enableStamina false;

showHUD [true, false, false, false];
showGPS false;
showCompass false;

// variable "variable_<UID player>" --> [money, tenues, kills, morts, games gagnées, games perdues, niveau vip, niveau droits]
nomVarPlayerUID = format ["variable_%1", getPlayerUID player]; // BDD player

titleCut ["", "BLACK FADED", 999];

[player] remoteExec ["db_fnc_isDejaConnecte", 2];

/* 
	TEST MISSION LOCAL :
	
	parametres pour fonction "mission_fnc_intro_airsoft" 
	|--> s'est deja connecte / money / tenues [0, 0, 0, 0, 0, 0] / kills / morts / games gagnées / games perdues
*/
//[true] call mission_fnc_intro_airsoft; // <-- test local nouveaux sur serveur
//[false, 10000, [1, 1, 1, 1, 1, 1], 0, 0, 0, 0, 0, 2] call mission_fnc_intro_airsoft; // <-- test local tauri

waitUntil { !isNil "gg_gamestatus" };

waitUntil {gg_gamestatus == 1};

private _boucle_statut_player =
{
	_pos = position player;

	waitUntil {player distance _pos > 5};

	while{gg_gamestatus == 1} do
	{
		//hintSilent format["=TACTIQUE AIRSOFT=\n\n=Tickets=\nbleue: %6\nrouge: %7\n\n=Personnelle %8=\nCredits: %1 -C-\nK/D: %5:%2\nbilles: %3\nForce de l'arme: %4", credits, timesHit, pellets, projInitSpeed, hitsGiven, ticketsBlu, ticketsRed, teamString];
		if((arena select 3) == 2) then
		{
			if(vehicle player in list RescueZone) then
			{
				if(player == VIP) then
				{
					west remoteExec ["fn_EndMission"];
				};            
			};
		};
		
		if(side player == west) then
		{
			if(vehicle player in list spawnRedValue) then
			{
				if((arena select 3) == 3) then
				{
					player setPosATL (selectRandom(arena select 4));
				}
				else 
				{
					player setposATL (arena select 4);
				};

				playSound "FD_Start_F";
				titleText["Vous ne pouvez pas entrer dans la base de l'adversaire", "PLAIN DOWN"];
			};
		}
		else
		{
			if(vehicle player in list spawnblueValue) then
			{
				player setpos (arena select 5);

				playSound "FD_Start_F";
				titleText["Vous ne pouvez pas entrer dans la base de l'adversaire", "PLAIN DOWN"];
			};
		};

		sleep 0.05;
	};
};

[] spawn _boucle_statut_player;
[] spawn mission_fnc_boucle;

//EventHandlers
player addEventHandler ["Fired", 
{
	if (player getVariable "hit") then 
	{
		player setVehicleAmmo 0;
	} 
	else 
	{
		if ((currentWeapon player) isEqualTo "hgun_Pistol_Signal_F") then 
		{
			player removeWeapon "hgun_Pistol_Signal_F";
			player removeMagazines "6Rnd_GreenSignal_F";
			player removeMagazines "6Rnd_RedSignal_F";
		} 
		else 
		{
			if (!((currentWeapon player) isEqualTo "")) then 
			{
				player addRating 100000000; //Prevents friendly fire from eliminating player

				dispFiring = true;
				pellets = pellets - 1;

				if(pellets > 0) then
				{
					player forceWeaponFire [currentWeapon player, "Single"]; //Force semi-auto
					player setAmmo [currentWeapon player, 1];
					player setWeaponReloadingTime [player, currentMuzzle player, 0.25];
					player setUnitRecoilCoefficient 0;
					addCamShake [0.25 + (dispShots / 100), 0.25, 10 + dispShots];
				}
				else
				{
					pellets = 0;
					player setVehicleAmmo 0;
				};

				[] spawn
				{
					dispShots = dispShots + 1;

					sleep dispCooldown;

					dispShots = dispShots - 1;
				};
			};
		};
	};
}];


player addEventHandler ["HandleDamage", 
{
	_this spawn
	{
		if(!beingHit && ((side (_this select 3)) != side player) && (!isNull (_this select 3))) then
		{
			beingHit = true;
			player setVariable ["hit", true, true];
			boire = false;
			uriner = false;

			if (animationOn) then
			{
				disableUserInput false;
				[player, "normal"] remoteExec ["switchMove", 0];
				sleep 1;
				animationOn = false;
			};

			timesHit = timesHit + 1;

			switch (arena select 3) do {
				case 1: 
				{
					if(side player == west) then
					{
						ticketsBlu = ticketsBlu - 1;
						publicVariable "ticketsBlu";
					}
					else
					{
						ticketsRed = ticketsRed - 1;
						publicVariable "ticketsRed";
					};
				};
				case 2: 
				{
					if(player == VIP) then
					{
						east remoteExec ["fn_EndMission"];
					};
				};
				case 3:
				{
					if(side player == west) then
					{
						viePirates = viePirates - 1;
						publicVariable "viePirates";
					};
				};
				case 4: 
				{
					if(side player == west) then
					{
						ticketsBlu = ticketsBlu - 1;
						publicVariable "ticketsBlu";
					}
					else
					{
						ticketsRed = ticketsRed - 1;
						publicVariable "ticketsRed";
					};
				};
			};

			if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= 25) then
			{
				[25, 0] call mission_fnc_modif_money;
			}
			else 
			{
				[0] call mission_fnc_set_money;
			};

			[player, (_this select 3)] remoteExec ["fn_Elimination"];
			
			playSound selectRandom(sons_hits);

			[player, "AmovPercMstpSsurWnonDnon"] remoteExec ["switchMove", 0];

			_revive = false;
			
			if ((arena select 3) == 1 || (arena select 3) == 2 || (arena select 3) == 4) then 
			{
				[player] remoteExec ["mission_fnc_reanimation", -2];

				//sleep 20;
				_valeur_while = 0;
				_sortir = true;

				while {_valeur_while < 40 && _sortir} do {
					
					if (!(player getVariable ["hit", false])) then 
					{
						_revive = true;
						_sortir = false;
						player setVariable ["revive_progression", [false, nil], true];
						player setVariable ["revive", true, true];
					};

					if ((player getVariable "revive_progression") select 0) then 
					{	
						_medecin = (player getVariable "revive_progression") select 1;

						titleText["Un de vos équipier vous revive !", "PLAIN DOWN", 0.25];

						if (!isNil "_medecin") then 
						{
							if (_medecin getVariable "hit") then
							{
								_revive = false;
								_sortir = false;
								player setVariable ["revive_progression", [false, nil], true];
								player setVariable ["revive", false, true];
							};	
						};
					}
					else
					{
						_valeur_while = _valeur_while + 1;

						/* if (_valeur_while == 7 || _valeur_while == 13) then 
						{
							_sons_revive = [];
							player say3D (selectRandom _sons_revive);
						}; */
					};

					sleep 0.5;
				};
			} 
			else 
			{
				sleep 20;
			};
			
			if (!_revive) then 
			{
				private _mode_date = (getArray(missionConfigFile >> "CfgGungame" >> "modes_jeux" >> "data")) select ((arena select 3) - 1);

				switch (arena select 3) do 
				{
					case 1: 
					{
						kit_soin_restant = _mode_date select 4;
						kit_soin = _mode_date select 5;

						smoke = _mode_date select 2;
						grenade = _mode_date select 3;
					};
					case 2: 
					{
						kit_soin_restant = _mode_date select 4;
						kit_soin = _mode_date select 5;
						
						if (side player == west) then 
						{
							smoke = _mode_date select 2;
							grenade = _mode_date select 3;
						};
					};
					case 3:
					{
						if(side player == west) then
						{
							smoke = _mode_date select 6;
							grenade = _mode_date select 7;
							//billes = 0;
						}
						else
						{
							smoke = _mode_date select 2;
							grenade = _mode_date select 3;
							grenade = _mode_date select 7;
						};
					};
					case 4:
					{
						kit_soin_restant = _mode_date select 4;
						kit_soin = _mode_date select 5;

						smoke = _mode_date select 2;
						grenade = _mode_date select 3;
					};
				};

				titleText
				[
					format
					[
						"Vous avez été touché par %1.\nRetour à la base.", 
						name (_this select 3)
					], 
					"BLACK OUT", 
					0.1
				];

				if((arena select 3) == 3 && side player == west) then {}
				else 
				{
					if(pellets < (_mode_date select 1)) then
					{
						pellets = _mode_date select 1;
					};
				};
				
				switch (arena select 3) do 
				{
					case 1: 
					{ 
						call fn_GetOutfit_bis_bis;
					};
					case 2: 
					{ 
						waitUntil{VIPon == 1};

						if(player == VIP) then 
						{
							call fn_VIPTenue;
						}
						else
						{
							call fn_GetOutfit_bis_bis; //Outfit the player
						};
					};
					case 3:
					{
						call fn_GetOutfit_pirate;
					};
					case 4:
					{
						call fn_GetOutfit_laser_games;
					};
				};

				sleep 0.15;

				//Place player back at spawn
				
				call spawnPlayer;

				[player, "normal"] remoteExec ["switchMove", 0];

				sleep 3;

				titleFadeOut 1;

				player setVariable ["hit", false, true];
				beingHit = false;

				sleep 0.5;
			}
			else
			{
				titleText["Vous avez été revive", "PLAIN DOWN", 0.25];

				[player, "normal"] remoteExec ["switchMove", 0];

				player setVariable ["hit", false, true];
				beingHit = false;

				call remet_chargeurs;

				sleep 0.5;
			};
		};
	};
}];
