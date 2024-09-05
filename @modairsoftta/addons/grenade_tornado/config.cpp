#include "BIS_AddonInfo.hpp"

//    _____  _          _                  ____                _ 
//   |_   _|/ \        / \  _   _ _ __ ___|  _ \ _ __ ___   __| |
//     | | / _ \      / _ \| | | | '__/ _ \ |_) | '__/ _ \ / _` |
//     | |/ ___ \    / ___ \ |_| | | |  __/  __/| | | (_) | (_| |
//     |_/_/   \_\  /_/   \_\__,_|_|  \___|_|   |_|  \___/ \__,_|
//                                                               

class DefaultEventhandlers;
class CfgPatches
{
	class grenade_tornado
	{
		units[] = {};
		weapons[] = {"rook_Airsoft", "p07_Airsoft", "acp2_Airsoft", "4five_Airsoft", "pdw_Airsoft", "sting_Airsoft", "protector_Airsoft", "vernim_Airsoft", "p90_Airsoft", "trg21_Airsoft", "katiba_Airsoft", "mxc_Airsoft", "mx_Airsoft", "mxm_Airsoft", "mxm_black_Airsoft"};
		requiredVersion = 1.00;
		requiredAddons[] = {"A3_Weapons_F", "A3_characters_F", "A3_Data_F", "A3_Sounds_F"};
		author = "TA AureProd";
		fileName = "grenade_tornado.pbo";
	};
};

class cfgSoundShaders 
{
	class esm_grenade_0m_SoundShader
	{
		samples[]={
			
			{
				"",
				1
			}
		};
		volume=0.00001;
		range=150;
		rangeCurve[]={
			{0,1},
			{150,0}
		};
	};
	class esm_grenade_150m_SoundShader
	{
		samples[]={
			
			{
				"",
				1
			}
		};
		volume=0.00001;
		range=600;
		rangeCurve[]={
			{0,0},
			{150,1},
			{600,0}
		};
	};
	class esm_grenade_600m_SoundShader
	{
		samples[]={
			
			{
				"",
				1
			}
		};
		volume=0.00001;
		range=1700;
		rangeCurve[]={
			{0,0},
			{150,0},
			{600,1},
			{1700,0}
		};
	};
	class esm_grenade_1700m_SoundShader
	{
		samples[]={
			
			{
				"",
				1
			}
		};
		volume=0.00001;
		range=3000;
		rangeCurve[]={
			{0,0},
			{600,0},
			{1700,1},
			{3000,0}
		};
	};
};

class cfgSoundSets
{
	class esm_Grenade_SoundSet
	{
		soundShaders[]={
			"esm_grenade_0m_SoundShader",
			"esm_grenade_150m_SoundShader",
			"esm_grenade_600m_SoundShader",
			"esm_grenade_1700m_SoundShader"
		};
		volumeFactor=1.1;
		volumeCurve="esm_exploSmallSoundCurve";
		sound3DProcessingType="ExplosionLight3DProcessingType";
		spatial=1;
		doppler=0;
		loop=0;
		frequencyRandomizer=2;
		frequencyRandomizerMin=0.40000001;
		occlusionFactor=0.2;
		obstructionFactor=0;
	};
};

class CfgSoundCurves
{
	class esm_exploSmallSoundCurve
	{
		points[] = {};
	};
};

class cfgAmmo {
	class B_9x21_Ball_Tracer_Red;
	class B_9x21_Ball_Tracer_Green;
	class B_45ACP_Ball_Green;
	class B_45ACP_Ball;
	class B_570x28_Ball;
	class B_556x45_Ball_Tracer_Red;
	class B_65x39_Caseless_green;
	class B_65x39_Caseless;
	
	class 9x21_Airsoft_Red : B_9x21_Ball_Tracer_Red {};
	class 9x21_Airsoft_Green : B_9x21_Ball_Tracer_Green {};
	class 45ACP_Airsoft_Green : B_45ACP_Ball_Green {};
	class 45ACP_Airsoft : B_45ACP_Ball {};
	class 570x28_Airsoft : B_570x28_Ball {};
	class 556x45_Airsoft_Red : B_556x45_Ball_Tracer_Red {};
	class 65x39_Airsoft_green : B_65x39_Caseless_green {};
	class 65x39_Airsoft : B_65x39_Caseless {};

	//grenade
	class Default;	// External class reference
	class Grenade : Default
	{
		SoundSetExplosion[] = {"esm_Grenade_SoundSet"};
		explosionTime = 3;
		explosive = 0;
		indirectHit = 1;
		indirectHitRange = 5;
	};
	class Chemlight_green : Grenade {};
	class grenade_tornado_ammo  : Chemlight_green
	{
		model = "\grenade_tornado\grenade_tornado.p3d"; //  mettre Ã§a plus tard  \grenade_tornado\grenade_tornado.p3d
	};
};

class cfgMagazines {
	class 16Rnd_9x21_red_Mag;
	class 16Rnd_9x21_green_Mag;
	class 9Rnd_45ACP_Mag;
	class 11Rnd_45ACP_Mag;
	class 30Rnd_9x21_Red_Mag;
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Green;
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Red;
	class 30Rnd_45ACP_Mag_SMG_01_tracer_green;
	class 50Rnd_570x28_SMG_03;
	class 30Rnd_556x45_Stanag_Tracer_Red;
	class 30Rnd_65x39_caseless_green;
	class 30Rnd_65x39_caseless_mag;
	class 30Rnd_65x39_caseless_black_mag;

	class 16Rnd_9x21_red_Airsoft : 16Rnd_9x21_red_Mag {
		displayName = "16Rnd 9x21 red Airsoft";
		descriptionShort = "Airsoft";
		ammo = "9x21_Airsoft_Red";
		count = 16; // Le Nombre de balles
	};
	class 16Rnd_9x21_green_Airsoft : 16Rnd_9x21_green_Mag {
		displayName = "16Rnd 9x21 green Airsoft";
		descriptionShort = "Airsoft";
		ammo = "9x21_Airsoft_Green";
		count = 16; // Le Nombre de balles
	};
	class 9Rnd_45ACP_Airsoft : 9Rnd_45ACP_Mag {
		displayName = "9Rnd 45ACP Airsoft";
		descriptionShort = "Airsoft";
		ammo = "45ACP_Airsoft_Green";
		count = 9; // Le Nombre de balles
	};
	class 11Rnd_45ACP_Airsoft : 11Rnd_45ACP_Mag {
		displayName = "11Rnd 45ACP Airsoft";
		descriptionShort = "Airsoft";
		ammo = "45ACP_Airsoft";
		count = 11; // Le Nombre de balles
	};
	class 30Rnd_9x21_Red_Airsoft : 30Rnd_9x21_Red_Mag {
		displayName = "30Rnd 9x21 Red Airsoft";
		descriptionShort = "Airsoft";
		ammo = "9x21_Airsoft_Red";
		count = 30; // Le Nombre de balles
	};
	class 30Rnd_9x21_Tracer_Green_Airsoft : 30Rnd_9x21_Mag_SMG_02_Tracer_Green {
		displayName = "30Rnd 9x21 Tracer Green Airsoft";
		descriptionShort = "Airsoft";
		ammo = "9x21_Airsoft_Green";
		count = 30; // Le Nombre de balles
	};
	class 30Rnd_9x21_Tracer_Red_Airsoft : 30Rnd_9x21_Mag_SMG_02_Tracer_Red {
		displayName = "30Rnd 9x21 Tracer Red Airsoft";
		descriptionShort = "Airsoft";
		ammo = "9x21_Airsoft_Red";
		count = 30; // Le Nombre de balles
	};
	class 30Rnd_45ACP_tracer_green_Airsoft : 30Rnd_45ACP_Mag_SMG_01_tracer_green {
		displayName = "30Rnd 45ACP tracer green Airsoft";
		descriptionShort = "Airsoft";
		ammo = "45ACP_Airsoft_Green";
		count = 30; // Le Nombre de balles
	};
	class 50Rnd_570x28_Airsoft : 50Rnd_570x28_SMG_03 {
		displayName = "50Rnd 570x28 Airsoft";
		descriptionShort = "Airsoft";
		ammo = "570x28_Airsoft";
		count = 50; // Le Nombre de balles
	};
	class 30Rnd_556x45_Tracer_Red_Airsoft : 30Rnd_556x45_Stanag_Tracer_Red {
		displayName = "30Rnd 556x45 Tracer Red Airsoft";
		descriptionShort = "Airsoft";
		ammo = "556x45_Airsoft_Red";
		count = 30; // Le Nombre de balles
	};
	class 30Rnd_65x39_green_Airsoft : 30Rnd_65x39_caseless_green {
		displayName = "30Rnd 65x39 green Airsoft";
		descriptionShort = "Airsoft";
		ammo = "65x39_Airsoft_green";
		count = 30; // Le Nombre de balles
	};
	class 30Rnd_65x39_Airsoft : 30Rnd_65x39_caseless_mag {
		displayName = "30Rnd 65x39 Airsoft";
		descriptionShort = "Airsoft";
		ammo = "65x39_Airsoft";
		count = 30; // Le Nombre de balles
	};
	class 30Rnd_65x39_black_Airsoft : 30Rnd_65x39_caseless_black_mag {
		displayName = "30Rnd 65x39 black Airsoft";
		descriptionShort = "Airsoft";
		ammo = "65x39_Airsoft";
		count = 30; // Le Nombre de balles
	};

	//grenade
	class Chemlight_green;
	class grenade_tornado : Chemlight_green
	{
	    model = "\grenade_tornado\grenade_tornado.p3d";   //  mettre Ã§a plus tard  \grenade_tornado\grenade_tornado.p3d
		displayName = "Grenade Tornado";
		picture = "\grenade_tornado\textures\tornado_logo.paa";
		ammo = "grenade_tornado_ammo";
		displayNameShort = "Grenade Tornado";
		descriptionShort = "Grenade Tornado Airsoft";
	};
};

class Semi;
class Burst;
class FullAuto;
class Mode_SemiAuto;
class Mode_FullAuto;
class Mode_Burst;

class cfgWeapons {
	class hgun_Rook40_F;
	class hgun_P07_F;
	class hgun_ACPC2_F;
	class hgun_Pistol_heavy_01_F;
	class hgun_PDW2000_F;
	class SMG_02_F;
	class SMG_05_F;
	class SMG_01_F;
	class SMG_03C_TR_black;
	class arifle_TRG21_F;
	class arifle_Katiba_F;
	class arifle_MXC_F;
	class arifle_MX_F;
	class arifle_MXM_F;
	class arifle_MXM_Black_F;

	// grenade
	class GrenadeLauncher;
	class Throw : GrenadeLauncher {
		muzzles[] = {"HandGrenade_Stone","HandGrenadeMuzzle","MiniGrenadeMuzzle","SmokeShellMuzzle","SmokeShellYellowMuzzle","SmokeShellGreenMuzzle","SmokeShellRedMuzzle","SmokeShellPurpleMuzzle","SmokeShellOrangeMuzzle","SmokeShellBlueMuzzle","ChemlightGreenMuzzle","ChemlightRedMuzzle","ChemlightYellowMuzzle","ChemlightBlueMuzzle","grenade_tornado_Muzzle"};

		class  ThrowMuzzle: GrenadeLauncher {};
		class grenade_tornado_Muzzle: ThrowMuzzle
		{
			magazines[] = {"grenade_tornado"};
		};
	};

	//pistolets
	class rook_Airsoft : hgun_Rook40_F {
		displayName = "Rook Airsoft";
		baseWeapon = "";
		weaponSlots = "HandGun";
		magazines[] = {"16Rnd_9x21_red_Airsoft"};
		initSpeed = 100;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz3", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class p07_Airsoft : hgun_P07_F {
		displayName = "P 07 Airsoft";
		baseWeapon = "";
		magazines[] = {"16Rnd_9x21_green_Airsoft"};
		initSpeed = 100;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz3", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class acp2_Airsoft : hgun_ACPC2_F {
		displayName = "ACP 2 Airsoft";
		baseWeapon = "";
		magazines[] = {"9Rnd_45ACP_Airsoft"};
		initSpeed = 100;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz2", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class 4five_Airsoft : hgun_Pistol_heavy_01_F {
		displayName = "4 five Airsoft";
		baseWeapon = "";
		magazines[] = {"11Rnd_45ACP_Airsoft"};
		initSpeed = 100;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};

	// smg
	class pdw_Airsoft : hgun_PDW2000_F {
		displayName = "PDW Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_9x21_Red_Airsoft"};
		initSpeed = 200;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class Burst: Mode_Burst {
			sounds[] = {Fburst};
			class Fburst {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class sting_Airsoft : SMG_02_F {
		displayName = "Sting Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_9x21_Tracer_Green_Airsoft"};
		initSpeed = 200;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class Burst: Mode_Burst {
			sounds[] = {Fburst};
			class Fburst {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class protector_Airsoft : SMG_05_F {
		displayName = "Protector Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_9x21_Tracer_Red_Airsoft"};
		initSpeed = 200;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz2", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz2", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class vernim_Airsoft : SMG_01_F {
		displayName = "Vernim Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_45ACP_tracer_green_Airsoft"};
		initSpeed = 200;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class Burst: Mode_Burst {
			sounds[] = {Fburst};
			class Fburst {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz", 250, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class p90_Airsoft : SMG_03C_TR_black {
		displayName = "P 90 Airsoft";
		baseWeapon = "";
		magazines[] = {"50Rnd_570x28_Airsoft"};
		initSpeed = 200;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg2", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg2", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};

	// fusils assault
	class trg21_Airsoft : arifle_TRG21_F {
		displayName = "TRG 21 Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_556x45_Tracer_Red_Airsoft"};
		initSpeed = 300;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class katiba_Airsoft : arifle_Katiba_F {
		displayName = "Katiba Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_65x39_green_Airsoft"};
		initSpeed = 300;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class mxc_Airsoft : arifle_MXC_F {
		displayName = "MXC Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_65x39_Airsoft"};
		initSpeed = 300;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg2", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg2", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class mx_Airsoft : arifle_MX_F {
		displayName = "MX Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_65x39_Airsoft"};
		initSpeed = 300;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\aeg2", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\aeg2", 25, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};

	// fusils sniper
	class mxm_Airsoft : arifle_MXM_F {
		displayName = "MXM Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_65x39_Airsoft"};
		initSpeed = 300;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz_snipeur", 200, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz_snipeur", 200, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
	class mxm_black_Airsoft : arifle_MXM_Black_F {
		displayName = "MXM black Airsoft";
		baseWeapon = "";
		magazines[] = {"30Rnd_65x39_black_Airsoft"};
		initSpeed = 300;
		class Single: Mode_SemiAuto {
			sounds[] = {Semi};
			class Semi {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz_snipeur", 200, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
		class FullAuto: Mode_FullAuto {
			sounds[] = {FAuto};
			class FAuto {
				begin1[] = {"grenade_tornado\sons\airsoft_gaz_snipeur", 200, 1,500};
				soundBegin[] = {"begin1",1};
			};
		};
	};
};

class Extended_PreInit_Eventhandlers
{
    class Man
    {
        init = "[] execVM ""\grenade_tornado\script\fn_set_particules.sqf"";";
    };
};

/*
class Extended_PreInit_Eventhandlers 
{
	class throw_INIT 
	{
		init = "[] execVM '\grenade_tornado\script\fn_set_particules.sqf';";
	};
};
*/

/*
class Extended_FiredBIS_Eventhandlers {

	class Man {
		wasp_nest = "_this spawn { _this call wasp_nest_FIREDEVENT; };";
	};
}; 
*/