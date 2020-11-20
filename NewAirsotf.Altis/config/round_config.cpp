
/*
	Modes jeux :
	> 1 = CTF
	> 2 = VIP
	> 3 = piratage
	> 4 = laser game
	> 5 = death match
*/

class CfgGungame 
{
	class Basic 
	{
		voteTime = 40;
		forceWeaponListAtIndex = -1;
	};

	class Arenas 
	{
		data[] =
		{
			{
				{15220.322, 10977.522, 16.2068}, // Vue vote map
				"Ville de RatSuperios (Course aux tickets)", // Nom de map
				400, // Pas toucher
				1, // N° mod jeu (1=CTF / 2=VIP)
				{15290.297, 11084.83, 3.795}, // Spawn bleue
				{15199.871, 11041.137, 3.308}, // Spawn rouge
				1, // N° map (en function du mod de jeu)
				{"cpA_flag", {
						"TA-image\icon_drapeau\icobleu-eglise.paa", 
						"TA-image\icon_drapeau\icorouge-eglise.paa", 
						"TA-image\icon_drapeau\icoblanc-eglise.paa"
				}}, // Drapeau A
				{"cpB_flag", {
						"TA-image\icon_drapeau\icobleu-moulin.paa", 
						"TA-image\icon_drapeau\icorouge-moulin.paa", 
						"TA-image\icon_drapeau\icoblanc-moulin.paa"
				}}, // Drapeau B
				{"cpC_flag", {
						"TA-image\icon_drapeau\icobleu-camion.paa", 
						"TA-image\icon_drapeau\icorouge-camion.paa", 
						"TA-image\icon_drapeau\icoblanc-camion.paa"
				}}, // Drapeau C
				1, // 10 -> si photo vote map ok en 11
				"TA-image\photos_map\ratsuperios.jpg", // 11 -> chemin relatif de la photo pour le vote map
				{
					{"rat", "TA-image\ratsuper.paa"}, 
					{"easteregg", "TA-image\eastereggblacklist.paa"}
				}, // [[id, image], [id, image]] / 12
				{"shopBlu", "shopRed"}, // [id shop bleu, id shop rouge]
				{"toilet1_map", "toilet2_map", "toilet3_map", "toilet4_map"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu", "eauRouge"}, // [id eau bleu, id eau rouge]
				{"redBaseArea", "bluBaseArea"}, // [id spawn bleu, id spawn rouge]
				1 // parachute (1 si oui et 0 si non) / 17
			},
			{
				{6237.84, 16246.4, 16.2068},
				"Usine (Course aux tickets)",
				400,
				1,
				{6120.538, 16219.35, 0},
				{6361.876, 16267.610, 0.221 },
				2,
				{"cpA_flag_1", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau A
				{"cpB_flag_1", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau B
				{"cpC_flag_1", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau C
				0, // 10
				"", // 11
				{}, // [[id, image], [id, image]] / 12
				{"shopBlu_1", "shopRed_1"}, // [id shop bleu, id shop rouge]
				{"toilet1_map_1", "toilet2_map_1", "toilet3_map_1", "toilet4_map_1"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu_1", "eauRouge_1"}, // [id eau bleu, id eau rouge]
				{"redBaseArea_1", "bluBaseArea_1"}, // [id spawn bleu, id spawn rouge]
				1 // parachute (1 si oui et 0 si non) / 17
			},
			{
				{16120.472, 18313.598, 74.0090},
				"Caverne (Course au tickets)",
				400,
				1,
				{16192.162, 18666.688, 0},
				{16059.37, 18135.027, 0 },
				3,
				{"cpA_flag_2", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau A
				{"cpB_flag_2", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau B
				{"cpC_flag_2", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau C
				0, // 10
				"", // 11
				{}, // [[id, image], [id, image]] / 12
				{"shopBlu_2", "shopRed_2"}, // [id shop bleu, id shop rouge]
				{"toilet1_map_2", "toilet2_map_2", "toilet3_map_2", "toilet4_map_2"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu_2", "eauRouge_2"}, // [id eau bleu, id eau rouge]
				{"redBaseArea_2", "bluBaseArea_2"}, // [id spawn bleu, id spawn rouge]
				0 // parachute (1 si oui et 0 si non) / 17
			},
			{
				{24032.19, 18573.08, 16.2068},
				"Orange Box (Course au tickets)",
				400,
				1,
				{24223.96, 18674.713, 7.883}, // Spawn bleue
				{24023.137, 18720.176, 7.881}, // Spawn rouge
				4,
				{"cpA_flag_3", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau A
				{"cpB_flag_3", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau B
				{"cpC_flag_3", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau C
				0, // 10
				"", // 11
				{
					{"TAlogo1", "TA-image\TAlogo.paa"},
					{"TAlogo2", "TA-image\TAlogo.paa"}
				}, // [[id, image], [id, image]] / 12
				{"shopBlu_3", "shopRed_3"}, // [id shop bleu, id shop rouge]
				{"toilet1_map_3", "toilet2_map_3", "toilet3_map_3", "toilet4_map_3"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu_3", "eauRouge_3"}, // [id eau bleu, id eau rouge]
				{"redBaseArea_3", "bluBaseArea_3"}, // [id spawn bleu, id spawn rouge]
				0 // parachute (1 si oui et 0 si non) / 17
			},
			{
				{3752.487, 11033.677, 16.2068},
				"Camp de Vacance (Course au tickets)",
				400,
				1,
				{3909.481, 11163.36, 0},
				{3860.588, 11049.886, 0},
				5,
				{"cpA_flag_4", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau A
				{"cpB_flag_4", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau B
				{"cpC_flag_4", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau C
				1, // 10
				"TA-image\photos_map\vacance.jpg", // 11
				{}, // [[id, image], [id, image]] / 12
				{"shopBlu_5", "shopRed_5"}, // [id shop bleu, id shop rouge]
				{"toilet1_map_4", "toilet2_map_4", "toilet3_map_4", "toilet4_map_4"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu_4", "eauRouge_4"}, // [id eau bleu, id eau rouge]
				{"redBaseArea_5", "bluBaseArea_5"}, // [id spawn bleu, id spawn rouge]
				1 // parachute (1 si oui et 0 si non) / 17
			},
			{
				{14198.608, 13118.765, 16.2068},
				"USS Liberty (Course au tickets)",
				400,
				1,
				{14257.032, 13200.929, 34.814},
				{14329.881, 13210.872, 32.524},
				6,
				{"cpA_flag_5", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau A
				{"cpB_flag_5", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau B
				{"cpC_flag_5", {
						"TA-image\icon_drapeau\icon_americain.paa", 
						"TA-image\icon_drapeau\icon_allemand.paa", 
						"TA-image\icon_drapeau\icon_blanc.paa"
				}}, // Drapeau C
				1, // 10
				"TA-image\photos_map\ussliberty.jpg", // 11
				{}, // [[id, image], [id, image]] / 12
				{"shopBlu_7", "shopRed_7"}, // [id shop bleu, id shop rouge]
				{"toilet1_map_5", "toilet2_map_5", "toilet3_map_5", "toilet4_map_5"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu_5", "eauRouge_5"}, // [id eau bleu, id eau rouge]
				{"redBaseArea_7", "bluBaseArea_7"}, // [id spawn bleu, id spawn rouge]
				0 // parachute (1 si oui et 0 si non) / 17
			},
			{
				// Position, Name, Radius, mode de jeux VIP (2), Spawnsbleu, SpawnRouge, n°map
				{7156.61, 16453.2, 16.2068},
				"Ruée vers Kore (Escorte de VIP)",
				400,
			 	2,
			 	{7136.154, 16621.08, 1.042},
			 	{7077.774, 16380.89, 1.087 },
			 	1,
				1, // 7 -> si photo vote map ok en 8
				"TA-image\photos_map\ruee_vers_kore.jpg", // 8 -> chemin relatif de la photo pour le vote map
				{}, // [[id, image], [id, image]] / 9
				{"shopBlu_4", "shopRed_4"}, // [id shop bleu, id shop rouge] / 10
				{"redBaseArea_4", "bluBaseArea_4"}, // [id spawn bleu, id spawn rouge] / 11
				"rescueZone_4" // id rescue zone / 12
			},
			{
				// Position, Name, Radius, mode de jeux piratage (3), Spawnsbleus, SpawnRouge, n°map, PC1, PC2, PC3
				{8993.445, 12063.395, 16.2068},
				"Sanctuaire de Mercenaires (Piratage)",
				400,
			 	3,
			 	{ // Tous les spawns bleues
					{9012.935, 11918.454, 0}, 
					{9101.731, 12002.296, 0}, 
					{9119.702, 12104.588, 0}, 
					{8958.985, 12135.638, 0}, 
					{8852.738, 12114.839, 0}, 
					{8897.765, 12036.665, 0.289}
				},
			 	{9008.229, 12059.82, 0}, // spawn rouge
			 	1,
				{9016.459, 12000.715, 3},
				{8928.836, 12089.324, 3},
				{9075.345, 12061.861, 4},
				0, // 10 -> si photo vote map ok en 11
				"", // 11 -> chemin relatif de la photo pour le vote map
				{}, // [[id, image], [id, image]] / 12
				{"PC1", "PC2", "PC3"}, // [id PC 1, id PC 2, id PC 3] / 13
				"shopRed_6", // shop rouge / 14
				{"smoke1", "smoke2"}, // shops secrets / 15
				{"redBaseArea_6", "bluBaseArea_6"}, // [id spawn bleu, id spawn rouge] / 16
				{"lampadaire_1", "lampadaire_2", "lampadaire_3", "lampadaire_4", "lampadaire_5"} // [id lampadaire 1, id lampadaire 2, id lampadaire 3] / 17
			},
			{
				{24032.19, 18573.08, 16.2068},
				"Black Box (Laser game)",
				400,
				4,
				{24223.96, 18674.713, 7.883}, // Spawn bleue
				{24023.137, 18720.176, 7.881}, // Spawn rouge
				1,
				"cpA_flag_3", // Drapeau A
				"cpB_flag_3", // Drapeau B
				"cpC_flag_3", // Drapeau C
				1, // 10
				"TA-image\photos_map\Black_boxbis.jpg", // 11
				{
					{"TAlogo1", "TA-image\TAlogo.paa"},
					{"TAlogo2", "TA-image\TAlogo.paa"}
				}, // [[id, image], [id, image]] / 12
				{"shopBlu_3", "shopRed_3"}, // [id shop bleu, id shop rouge]
				{"toilet1_map_3", "toilet2_map_3", "toilet3_map_3", "toilet4_map_3"}, // [id toilettes bleu 1, id toilettes bleu 2, id toilettes rouge 1, id toilettes rouge 2]
				{"eauBleu_3", "eauRouge_3"}, // [id eau bleu, id eau rouge]
				{"redBaseArea_3", "bluBaseArea_3"}, // [id spawn bleu, id spawn rouge]
				0 // parachute (1 si oui et 0 si non) / 17
			}
		};
	};

	class modes_jeux 
	{
		data[] =
		{
			{ // CTF
				150, // billes base
				50, // billes min
				2, // smoke max
				2, // grenade max
				1, // kit soin base
				5, // kit soin max

				10, // nd bouteilles max
				0, // bouteilles base
				750, // points ctf bleu
				750 // points ctf rouge
			},
			{ // VIP
				150, // billes base
				50, // billes min
				2, // smoke max
				2, // grenade max
				1, // kit soin base
				5, // kit soin max

				3, // smoke max VIP
				3, // grenade max VIP
				0 // billes VIP
			},
			{ // piratage
				150, // billes base
				50, // billes min
				0, // smoke max
				0, // grenade max

				0, // billes pirates
				1, // pistolet alarme max
				2, // smoke max pirates
				2, // grenade max pirates
				15 // vies pirates
			},
			{ // laser game
				150, // billes base
				50, // billes min
				2, // smoke max
				2, // grenade max
				1, // kit soin base
				5, // kit soin max

				10, // nd bouteilles max
				0, // bouteilles base
				50, // points ctf bleu
				50 // points ctf rouge
			}
		};
	};
};
