/*
	Basic configuration for rounds
	Defines possible progression lists, basic settings aswell as maps
*/

class TA 
{
	class guns 
	{
		data[] =
		{
			{//liste 0
				{ // Armes de poing
					"Rook", // nom
					1, // si peut être acheté et si le prix s'affiche
					15, // prix
					"call fn_Buyrook40", // fonction
					0, // liste des viseurs
					"rook_Airsoft", // id de l'arme // 5
					"16Rnd_9x21_red_Airsoft" // id du chargeur de l'arme // 6
				},
				{
					"P 07",
					1,
					25,
					"call fn_Buypo7",
					0,
					"p07_Airsoft",
					"16Rnd_9x21_green_Airsoft"
				},
				{
					"ACP 2",
					1,
					45,
					"call fn_Buyacpc2",
					0,
					"acp2_Airsoft",
					"9Rnd_45ACP_Airsoft"
				},
				{
					"4 Five",
					1,
					60,
					"call fn_Buy4five",
					1,
					"4five_Airsoft",
					"11Rnd_45ACP_Airsoft"
				},
				{ // SMG
					"PDW",
					1,
					200,
					"call fn_Buypdw",
					2,
					"pdw_Airsoft",
					"30Rnd_9x21_Red_Airsoft"
				},
				{
					"Sting",
					1,
					215,
					"call fn_Buysting",
					2,
					"sting_Airsoft",
					"30Rnd_9x21_Tracer_Green_Airsoft"
				},
				{
					"Protector",
					1,
					230,
					"call fn_Buyprotector",
					2,
					"protector_Airsoft",
					"30Rnd_9x21_Tracer_Red_Airsoft"
				},
				{
					"Vernim",
					1,
					235,
					"call fn_Buyvermin",
					2,
					"vernim_Airsoft",
					"30Rnd_45ACP_tracer_green_Airsoft"
				},
				{
					"P 90",
					1,
					290,
					"call fn_BuyP90",
					2,
					"p90_Airsoft",
					"50Rnd_570x28_Airsoft"
				},
				{ // Fusils assault
					"TRG 21",
					1,
					400,
					"call fn_BuyTRG21",
					3,
					"trg21_Airsoft",
					"30Rnd_556x45_Tracer_Red_Airsoft"
				},
				{
					"Katiba",
					1,
					450,
					"call fn_Buykatiba",
					3,
					"katiba_Airsoft",
					"30Rnd_65x39_green_Airsoft"
				},
				{
					"MXC",
					1,
					490,
					"call fn_Buymxc",
					3,
					"mxc_Airsoft",
					"30Rnd_65x39_Airsoft"
				},
				{
					"MX",
					1,
					500,
					"call fn_Buymx",
					3,
					"mx_Airsoft",
					"30Rnd_65x39_Airsoft"
				},
				{
					"MXM",
					1,
					650,
					"call fn_Buymxm",
					3,
					"mxm_Airsoft",
					"30Rnd_65x39_caseless_mag"
				},
				{
					"MXM black",
					1,
					650,
					"call fn_Buymxmb",
					3,
					"mxm_black_Airsoft",
					"30Rnd_65x39_black_Airsoft"
				}
			},
			{//liste 1
				{
					"ACP 2", // nom
					1, // si peut être acheté et si le prix s'affiche
					45, // prix
					"call fn_Buyacpc2", // fonction
					0, // liste des viseurs
					"acp2_Airsoft" // id de l'arme
				},
				{
					"4 Five",
					1,
					60,
					"call fn_Buy4five",
					1,
					"4five_Airsoft"
				}, // SMG
				{
					"Sting",
					1,
					215,
					"call fn_Buysting",
					2,
					"sting_Airsoft"
				},
				{
					"Protector",
					1,
					230,
					"call fn_Buyprotector",
					2,
					"protector_Airsoft"
				},
				{
					"Vernim",
					1,
					235,
					"call fn_Buyvermin",
					2,
					"vernim_Airsoft"
				},
				{
					"P 90",
					1,
					290,
					"call fn_BuyP90",
					2,
					"p90_Airsoft"
				}, // Fusils assault
				{
					"TRG 21",
					1,
					400,
					"call fn_BuyTRG21",
					3,
					"trg21_Airsoft"
				},
				{
					"Katiba",
					1,
					450,
					"call fn_Buykatiba",
					3,
					"katiba_Airsoft"
				},
				{
					"MXC",
					1,
					490,
					"call fn_Buymxc",
					3,
					"mxc_Airsoft"
				},
				{
					"MX",
					1,
					500,
					"call fn_Buymx",
					3,
					"mx_Airsoft"
				},
				{
					"MXM",
					1,
					650,
					"call fn_Buymxm",
					3,
					"mxm_Airsoft"
				},
				{
					"MXM black",
					1,
					650,
					"call fn_Buymxmb",
					3,
					"mxm_black_Airsoft"
				}
			},
			{//liste 2
				{ // Armes de poing
					"Rook", // nom
					1, // si peut être acheté et si le prix s'affiche
					15, // prix
					"call fn_Buyrook40", // fonction
					0, // liste des viseurs
					"rook_Airsoft" // id de l'arme
				},
				{
					"P 07",
					1,
					25,
					"call fn_Buypo7",
					0,
					"p07_Airsoft"
				},
				{
					"ACP 2",
					1,
					45,
					"call fn_Buyacpc2_sans_light",
					0,
					"acp2_Airsoft"
				},
				{
					"4 Five",
					1,
					60,
					"call fn_Buy4five_sans_light",
					1,
					"4five_Airsoft"
				},
				{ // SMG
					"PDW",
					1,
					200,
					"call fn_Buypdw",
					2,
					"pdw_Airsoft"
				},
				{
					"Sting",
					1,
					215,
					"call fn_Buysting_sans_light",
					2,
					"sting_Airsoft"
				},
				{
					"Protector",
					1,
					230,
					"call fn_Buyprotector_sans_light",
					2,
					"protector_Airsoft"
				},
				{
					"Vernim",
					1,
					235,
					"call fn_Buyvermin_sans_light",
					2,
					"vernim_Airsoft"
				},
				{
					"P 90",
					1,
					290,
					"call fn_BuyP90_sans_light",
					2,
					"p90_Airsoft"
				},
				{ // Fusils assault
					"TRG 21",
					1,
					400,
					"call fn_BuyTRG21_sans_light",
					3,
					"trg21_Airsoft"
				},
				{
					"Katiba",
					1,
					450,
					"call fn_Buykatiba_sans_light",
					3,
					"katiba_Airsoft"
				},
				{
					"MXC",
					1,
					490,
					"call fn_Buymxc_sans_light",
					3,
					"mxc_Airsoft"
				},
				{
					"MX",
					1,
					500,
					"call fn_Buymx_sans_light",
					3,
					"mx_Airsoft"
				},
				{
					"MXM",
					1,
					650,
					"call fn_Buymxm_sans_light",
					3,
					"mxm_Airsoft"
				},
				{
					"MXM black",
					1,
					650,
					"call fn_Buymxmb_sans_light",
					3,
					"mxm_black_Airsoft"
				}
			}
		};
	};
	class viseurs 
	{
		data[] =
		{
			{ // liste 0
				{
					"Aucun", // nom
					0, // si peut être acheté
					0, // prix
					"" // id de arme
				}
			},
			{ // liste 1
				{
					"Aucun",
					0,
					0,
					""
				},
				{
					"MRD rouge",
					1,
					20,
					"optic_MRD"
				}
			},
			{ // liste 2
				{
					"Aucun",
					0,
					0,
					""
				},
				{
					"ACO 1 rouge",
					1,
					25,
					"optic_Aco"
				},
				{
					"ACO 1 verte",
					1,
					25,
					"optic_ACO_grn"
				},
				{
					"ACO 2 rouge",
					1,
					25,
					"optic_Aco_smg"
				},
				{
					"ACO 2 verte",
					1,
					25,
					"optic_ACO_grn_smg"
				},
				{
					"Holographique 1",
					1,
					35,
					"optic_Holosight"
				},
				{
					"Holographique 2",
					1,
					35,
					"optic_Holosight_smg"
				},
				{
					"MRCO",
					1,
					70,
					"optic_MRCO"
				}
			},
			{ // liste 3
				{
					"Aucun",
					0,
					0,
					""
				},
				{
					"ACO 1 rouge",
					1,
					25,
					"optic_Aco"
				},
				{
					"ACO 1 verte",
					1,
					25,
					"optic_ACO_grn"
				},
				{
					"ACO 2 rouge",
					1,
					25,
					"optic_Aco_smg"
				},
				{
					"ACO 2 verte",
					1,
					25,
					"optic_ACO_grn_smg"
				},
				{
					"Holographique 1",
					1,
					35,
					"optic_Holosight"
				},
				{
					"Holographique 2",
					1,
					35,
					"optic_Holosight_smg"
				},
				{
					"MRCO",
					1,
					70,
					"optic_MRCO"
				},
				{
					"RCO",
					1,
					65,
					"optic_Hamr"
				},
				{
					"ARCO",
					1,
					75,
					"optic_Arco"
				}
			}
		};
	};
};
