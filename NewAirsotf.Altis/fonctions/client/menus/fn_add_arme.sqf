

//viseurs
fn_viseur =
{
	if ((_this select 0) == 1) then {
		player addHandgunItem (_this select 1);
	}
	else
	{
		player addPrimaryWeaponItem (_this select 1);
	};
};

//Location de replique arme de point
fn_Buyrook40 =
{		
	player addmagazines ["16Rnd_9x21_red_Airsoft", 2];
	player addweapon "rook_Airsoft";
};

fn_Buypo7 =
{
	player addmagazines ["16Rnd_9x21_green_Airsoft", 2];
	player addweapon "p07_Airsoft";
};

fn_Buyacpc2 =
{
	player addmagazines ["9Rnd_45ACP_Airsoft", 2];
	player addweapon "acp2_Airsoft";
	player addHandgunItem "acc_flashlight_pistol";
};

fn_Buy4five =
{
	player addmagazines ["11Rnd_45ACP_Airsoft", 2];
    player addweapon "4five_Airsoft";
	player addHandgunItem "acc_flashlight_pistol";
};

//Location de replique SMG
fn_Buypdw =
{
	player addmagazines ["30Rnd_9x21_Red_Airsoft", 2];
    player addweapon "pdw_Airsoft";
};

fn_Buysting =
{
	player addmagazines ["30Rnd_9x21_Tracer_Green_Airsoft", 2];
    player addweapon "sting_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buyprotector =
{
	player addmagazines ["30Rnd_9x21_Tracer_Red_Airsoft", 2];
    player addweapon "protector_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buyvermin =
{
	player addmagazines ["30Rnd_45ACP_tracer_green_Airsoft", 2];
   	player addweapon "vernim_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_BuyP90 =
{
	player addmagazines ["50Rnd_570x28_Airsoft", 2];
    player addweapon "p90_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

//Location de replique AOG
fn_BuyTRG21 =
{
	player addmagazines ["30Rnd_556x45_Tracer_Red_Airsoft", 2];
    player addweapon "trg21_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buykatiba =
{
	player addmagazines ["30Rnd_65x39_green_Airsoft", 2];
    player addweapon "katiba_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buymxc =
{
	player addmagazines ["30Rnd_65x39_Airsoft", 2];
    player addweapon "mxc_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buymx =
{
	player addmagazines ["30Rnd_65x39_Airsoft", 2];
    player addweapon "mx_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buymxm =
{
	player addmagazines ["30Rnd_65x39_caseless_mag", 2];
    player addweapon "mxm_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";	
};

fn_Buymxmb =
{
	player addmagazines ["30Rnd_65x39_black_Airsoft", 2];
	player addweapon "mxm_black_Airsoft";
	player addPrimaryWeaponItem "acc_flashlight";
};

fn_Buyacpc2_sans_light =
{
	player addmagazines ["9Rnd_45ACP_Airsoft", 2];
	player addweapon "acp2_Airsoft";
};

fn_Buy4five_sans_light =
{
	player addmagazines ["11Rnd_45ACP_Airsoft", 2];
    player addweapon "4five_Airsoft";
};

//Location de replique SMG
fn_Buysting_sans_light =
{
	player addmagazines ["30Rnd_9x21_Tracer_Green_Airsoft", 2];
    player addweapon "sting_Airsoft";
};

fn_Buyprotector_sans_light =
{
	player addmagazines ["30Rnd_9x21_Tracer_Red_Airsoft", 2];
    player addweapon "protector_Airsoft";
};

fn_Buyvermin_sans_light =
{
	player addmagazines ["30Rnd_45ACP_tracer_green_Airsoft", 2];
   	player addweapon "vernim_Airsoft";
};

fn_BuyP90_sans_light =
{
	player addmagazines ["50Rnd_570x28_Airsoft", 2];
    player addweapon "p90_Airsoft";
};

//Location de replique AOG
fn_BuyTRG21_sans_light =
{
	player addmagazines ["30Rnd_556x45_Tracer_Red_Airsoft", 2];
    player addweapon "trg21_Airsoft";
};

fn_Buykatiba_sans_light =
{
	player addmagazines ["30Rnd_65x39_green_Airsoft", 2];
    player addweapon "katiba_Airsoft";
};

fn_Buymxc_sans_light =
{
	player addmagazines ["30Rnd_65x39_Airsoft", 2];
    player addweapon "mxc_Airsoft";
};

fn_Buymx_sans_light =
{
	player addmagazines ["30Rnd_65x39_Airsoft", 2];
    player addweapon "mx_Airsoft";
};

fn_Buymxm_sans_light =
{
	player addmagazines ["30Rnd_65x39_Airsoft", 2];
    player addweapon "mxm_Airsoft";	
};

fn_Buymxmb_sans_light =
{
	player addmagazines ["30Rnd_65x39_black_Airsoft", 2];
	player addweapon "mxm_black_Airsoft";
};

fn_grenade_billes =
{		
	if (grenade != 0) then 
	{
		if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _this) then
		{
			grenade = grenade - 1;
			[_this, 0] call mission_fnc_modif_money;

			player addmagazines ["grenade_tornado", 1];
			
			titleText["Grenade à billes achetée", "PLAIN DOWN", 0.25];

			playSound "purchase";
		}
		else
		{
			call fn_InsufficientFunds;
		};
	}
	else
	{
		titleText["Vous avez trop de grenades à billes !", "PLAIN DOWN", 0.25];
		playSound "AddItemFailed";
	};
};

fn_Smoke =
{
	_smokes = 
	[
		"SmokeShell", 
		"SmokeShellRed",
		"SmokeShellGreen",
		"SmokeShellYellow",
		"SmokeShellPurple",
		"SmokeShellBlue",
		"SmokeShellOrange"
	];

	if (smoke != 0) then 
	{
		if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _this) then
		{
			smoke = smoke - 1;
			[_this, 0] call mission_fnc_modif_money;

			player addmagazines [selectRandom(_smokes), 1];
			
			titleText["Smoke achetée", "PLAIN DOWN", 0.25];

			playSound "purchase";
		}
		else
		{
			call fn_InsufficientFunds;
		};
	}
	else
	{
		titleText["Vous avez trop de smokes !", "PLAIN DOWN", 0.25];
		playSound "AddItemFailed";
	};
};

fn_pistoleAlarme =
{
	_fusees = 
	[
		"6Rnd_GreenSignal_F", 
		"6Rnd_RedSignal_F"
	];

	if ((arena select 3) == 3) then 
	{
		if (pistolet != 0) then 
		{
			if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _this) then
			{
				pistolet = pistolet - 1;
				[_this, 0] call mission_fnc_modif_money;

				player addmagazines [selectRandom(_fusees), 1];
				player addweapon "hgun_Pistol_Signal_F";
				
				titleText["Pistolet d'alarme loué", "PLAIN DOWN", 0.25];

				playSound "purchase";
			}
			else
			{
				call fn_InsufficientFunds;
			};
		}
		else
		{
			titleText["Vous avez déjà acheté un pistolet d'alarme !", "PLAIN DOWN", 0.25];
    		playSound "AddItemFailed";
		};
	}
	else
	{
		titleText["Rien, c'est une erreur !", "PLAIN DOWN", 0.25];
    	playSound "AddItemFailed";
	};
};

fn_bouteille =
{
	if (((arena select 3) == 1) || ((arena select 3) == 4)) then 
	{
		if (nd_bouteilles != 0) then 
		{
			if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _this) then
			{
				nd_bouteilles = nd_bouteilles - 1;
				[_this, 0] call mission_fnc_modif_money;

				bouteilles_restantes = bouteilles_restantes + 1;
				
				titleText["Bouteille achetée", "PLAIN DOWN", 0.25];

				playSound "purchase";
			}
			else
			{
				call fn_InsufficientFunds;
			};
		}
		else
		{
			titleText["Vous avez trop de bouteilles !", "PLAIN DOWN", 0.25];
    		playSound "AddItemFailed";
		};
	}
	else
	{
		titleText["Rien, c'est une erreur !", "PLAIN DOWN", 0.25];
    	playSound "AddItemFailed";
	};
};

fn_bois_bouteille =
{
	if (((arena select 3) == 1) || ((arena select 3) == 4)) then 
	{
		if (bouteilles_restantes != 0) then 
		{
			bouteilles_restantes = bouteilles_restantes - 1;

			if (urinePourcent < 95) then 
			{
				urinePourcent = urinePourcent + 5;
			} 
			else 
			{
				urinePourcent = 100;
			};

			if (eau <= 70) then 
			{
				eau = eau + 30;
			} 
			else 
			{
				eau = 100;
			};

			titleText [format["Il vous reste %1 bouteilles", bouteilles_restantes], "PLAIN DOWN", 0.25];
		}
		else
		{
			titleText["Vous n'avez plus de bouteilles !", "PLAIN DOWN", 0.25];
    		playSound "AddItemFailed";
		};
	}
	else
	{
		titleText["Rien, c'est une erreur !", "PLAIN DOWN", 0.25];
    	playSound "AddItemFailed";
	};
};

fn_add_kit_soin = 
{
    if (((arena select 3) == 1) || ((arena select 3) == 4) || ((arena select 3) == 2)) then 
	{
		if (kit_soin != 0) then 
		{
			if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _this) then
			{
				[_this, 0] call mission_fnc_modif_money;

				kit_soin_restant = kit_soin_restant + 1;
                kit_soin = kit_soin - 1;
				
				titleText["Kit de soin achetée", "PLAIN DOWN", 0.25];

				playSound "purchase";
			}
			else
			{
				call fn_InsufficientFunds;
			};
		}
		else
		{
			titleText["Vous avez trop de kits de soins !", "PLAIN DOWN", 0.25];
    		playSound "AddItemFailed";
		};
	}
	else
	{
		titleText["Rien, c'est une erreur !", "PLAIN DOWN", 0.25];
    	playSound "AddItemFailed";
	};
};

fn_add_tenue_bleus =
{
	_para = _this;

	_containers = backpack player;
	_sac_doc = false;

	_inventaire_vest = vestItems player;
	_inventaire_uniform = uniformItems player;
	_inventaire_bacpack = backpackItems player;

	if (_containers == "B_UAV_01_backpack_F") then
	{
		_sac_doc = true;
	};

	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;

	if (!_sac_doc) then 
	{
		removeBackpack player;
	};

	switch (_para) do 
	{
		case 1: 
		{ 
			player forceAddUniform "U_BG_Guerilla2_1";
			player addVest "V_BandollierB_blk";
			player addHeadgear "H_Bandanna_gry";
			player addGoggles "G_Sport_BlackWhite";
		};
		case 2: 
		{ 
			player forceAddUniform "U_BG_Guerilla2_1";
			player addVest "V_PlateCarrier1_blk";
			player addHeadgear "H_Beret_blk";
			player addGoggles "G_Squares_Tinted";
		};
		case 3: 
		{ 
			player forceAddUniform "U_BG_Guerilla2_1";
			player addVest "V_PlateCarrier2_blk";
			player addHeadgear "H_Watchcap_blk";
			player addGoggles "G_Bandanna_aviator";

			if (!_sac_doc) then 
			{
				player addBackpack "B_ViperHarness_blk_F";
			};
		};
		case 4: 
		{ 
			player forceAddUniform "U_BG_Guerilla2_1";
			player addVest "V_PlateCarrierGL_blk";
			player addHeadgear "H_Watchcap_blk";
			player addGoggles "G_Bandanna_aviator";

			if (!_sac_doc) then 
			{
				player addBackpack "B_ViperHarness_blk_F";
			};
		};
		case 5: 
		{ 
			player forceAddUniform "U_O_R_Gorka_01_black_F";
			player addVest "V_LegStrapBag_black_F";
			player addBackpack "B_Messenger_Black_F";
			player addGoggles "G_Balaclava_TI_G_blk_F";
		};
		case 6: 
		{ 
			player forceAddUniform "U_O_R_Gorka_01_black_F";
			player addVest "V_PlateCarrier1_blk";
			player addHeadgear "H_HeadSet_black_F";
			player addGoggles "G_Bandanna_aviator";

			if (!_sac_doc) then 
			{
				player addBackpack "B_Messenger_Black_F";
			};
		};
		case 7: 
		{ 
			player forceAddUniform "U_O_R_Gorka_01_black_F";
			player addVest "V_PlateCarrierGL_blk";
			player addHeadgear "H_CrewHelmetHeli_B";
			player addGoggles "G_RegulatorMask_F";

			if (!_sac_doc) then 
			{
				player addBackpack "B_RadioBag_01_black_F";
			};
		};
	};

	{
		player addItemToVest _x;
	} forEach _inventaire_vest;

	{
		player addItemToUniform _x;
	} forEach _inventaire_uniform;

	{
		player addItemToBackpack _x;
	} forEach _inventaire_bacpack;
};

fn_add_tenue_rouges =
{
	_para = _this;

	_containers = backpack player;
	_sac_doc = false;

	_inventaire_vest = vestItems player;
	_inventaire_uniform = uniformItems player;
	_inventaire_bacpack = backpackItems player;

	if (_containers == "O_UAV_01_backpack_F") then
	{
		_sac_doc = true;
	};

	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;

	if (!_sac_doc) then 
	{
		removeBackpack player;
	};

	switch (_para) do 
	{
		case 1: 
		{ 
			player forceAddUniform "U_BG_Guerilla1_1";
			player addVest "V_BandollierB_cbr";
			player addHeadgear "H_Bandanna_cbr";
			player addGoggles "G_Shades_Green";
		};
		case 2: 
		{ 
			player forceAddUniform "U_BG_Guerilla1_1";
			player addVest "V_Chestrig_khk";
			player addHeadgear "H_Beret_Colonel";
			player addGoggles "G_Squares_Tinted";
		};
		case 3: 
		{ 
			player forceAddUniform "U_BG_Guerilla1_1";
			player addVest "V_PlateCarrierL_CTRG";
			player addHeadgear "H_Watchcap_khk";
			player addGoggles "G_Bandanna_oli";

			if (!_sac_doc) then 
			{
				player addBackpack "B_ViperLightHarness_khk_F";
			};
		};
		case 4: 
		{ 
			player forceAddUniform "U_BG_Guerilla1_1";
			player addVest "V_PlateCarrierGL_rgr";
			player addHeadgear "H_Watchcap_khk";
			player addGoggles "G_Bandanna_oli";

			if (!_sac_doc) then 
			{
				player addBackpack "B_ViperHarness_khk_F";
			};
		};
		case 5: 
		{ 
			player forceAddUniform "U_B_CBRN_Suit_01_Wdl_F";
			player addVest "V_BandollierB_ghex_F";
			player addHeadgear "H_EarProtectors_black_F";
			player addGoggles "G_AirPurifyingRespirator_02_olive_F";
		};
		case 6: 
		{ 
			player forceAddUniform "U_B_CBRN_Suit_01_Wdl_F";
			player addVest "V_PlateCarrier1_wdl";
			player addHeadgear "H_HelmetB_plain_wdl";
			player addGoggles "G_RegulatorMask_F";

			if (!_sac_doc) then 
			{
				player addBackpack "B_Messenger_Olive_F";
			};
		};
		case 7: 
		{ 
			player forceAddUniform "U_B_CBRN_Suit_01_Wdl_F";
			player addVest "V_PlateCarrierGL_wdl";
			player addHeadgear "H_CrewHelmetHeli_I";
			player addGoggles "G_RegulatorMask_F";

			if (!_sac_doc) then 
			{
				player addBackpack "B_ViperHarness_oli_F";
			};
		};
	};

	{
		player addItemToVest _x;
	} forEach _inventaire_vest;

	{
		player addItemToUniform _x;
	} forEach _inventaire_uniform;

	{
		player addItemToBackpack _x;
	} forEach _inventaire_bacpack;
};

fn_add_tenue_vr_bleus =
{
	_para = _this;

	_containers = backpack player;
	_sac_doc = false;

	_inventaire_vest = vestItems player;
	_inventaire_uniform = uniformItems player;
	_inventaire_bacpack = backpackItems player;

	if (_containers == "B_UAV_01_backpack_F") then
	{
		_sac_doc = true;
	};

	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;

	if (!_sac_doc) then 
	{
		removeBackpack player;
	};

	switch (_para) do 
	{
		case 1: 
		{ 
			player forceAddUniform "U_B_Protagonist_VR";
		};
		case 2: 
		{ 
			player forceAddUniform "U_I_Protagonist_VR";
		};
	};

	{
		player addItemToVest _x;
	} forEach _inventaire_vest;

	{
		player addItemToUniform _x;
	} forEach _inventaire_uniform;

	{
		player addItemToBackpack _x;
	} forEach _inventaire_bacpack;
};

fn_add_tenue_vr_rouges =
{
	_para = _this;

	_containers = backpack player;
	_sac_doc = false;

	_inventaire_vest = vestItems player;
	_inventaire_uniform = uniformItems player;
	_inventaire_bacpack = backpackItems player;

	if (_containers == "O_UAV_01_backpack_F") then
	{
		_sac_doc = true;
	};

	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;

	if (!_sac_doc) then 
	{
		removeBackpack player;
	};

	switch (_para) do 
	{
		case 1: 
		{ 
			player forceAddUniform "U_O_Protagonist_VR";
		};
		case 2: 
		{ 
			player forceAddUniform "U_C_Protagonist_VR";
		};
	};

	{
		player addItemToVest _x;
	} forEach _inventaire_vest;

	{
		player addItemToUniform _x;
	} forEach _inventaire_uniform;

	{
		player addItemToBackpack _x;
	} forEach _inventaire_bacpack;
};
