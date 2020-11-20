/*
	Basic configuration for rounds
	Defines possible progression lists, basic settings aswell as maps
*/

class TA_bis 
{
	class autre 
	{
		data[] =
		{
			{//0
				{
					"50 Billes", // nom
					2, // si peut être acheté
					25, // prix
					"50 call fn_AddPellets", // fonction
					1 // si affiche le prix
				},
				{
					"100 Billes",
					2,
					50,
					"100 call fn_AddPellets",
					1
				},
				{
					"200 Billes",
					2,
					100,
					"200 call fn_AddPellets",
					1
				},
				{
					"Bouteille d'eau",
					2,
					10,
					"10 call fn_bouteille",
					1
				},
				{
					"Kit de soins",
					2,
					10,
					"10 call fn_add_kit_soin",
					1
				},
				{
					"Smoke", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_Smoke", // fonction
					1 // si affiche le prix
				},
				{
					"Grenade à billes", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_grenade_billes", // fonction
					1 // si affiche le prix
				},
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				},
				{
					"Drone",
					1,
					1000,
					"call fn_BuyUAV",
					1
				}
			},
			{//1
				{
					"Smoke", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_Smoke", // fonction
					1 // si affiche le prix
				},
				{
					"Grenade à billes", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_grenade_billes", // fonction
					1 // si affiche le prix
				},
				/* {
					"3 billes",
					2,
					150,
					"150 call fn_troisBilles",
					1
				}, */
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				}
			},
			{//2
				{
					"Pistolet d'alarme", // nom
					2, // si peut être acheté
					100, // prix
					"100 call fn_pistoleAlarme", // fonction
					1 // si affiche le prix
				},
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				}
			},
			{//3
				{
					"Déployer sur Alpha", // nom
					2, // si peut être acheté
					300, // prix
					"[cpAValueID, 300, cpAValue, 'A'] call fn_ParaBase", // fonction
					1 // si affiche le prix
				},
				{
					"Déployer sur Bravo",
					2,
					300,
					"[cpBValueID, 300, cpBValue, 'B'] call fn_ParaBase",
					1
				},
				{
					"Déployer sur Charlie",
					2,
					300,
					"[cpCValueID, 300, cpCValue, 'C'] call fn_ParaBase",
					1
				}
			},
			{//4
				{
					"Distribuer des crédits", // nom
					2, // si peut être acheté
					0, // prix
					"call fn_Distribute", // fonction
					0 // si affiche le prix
				},
				{
					"Smoke",
					2,
					40,
					"40 call fn_Smoke",
					1
				},
				{
					"Grenade à billes", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_grenade_billes", // fonction
					1 // si affiche le prix
				}
			},
			{//5
				{
					"50 Billes", // nom
					2, // si peut être acheté
					75, // prix
					"50 call fn_AddPellets", // fonction
					1 // si affiche le prix
				},
				{
					"100 Billes",
					2,
					150,
					"100 call fn_AddPellets",
					1
				},
				{
					"200 Billes",
					2,
					300,
					"200 call fn_AddPellets",
					1
				},
				{
					"Bouteille d'eau",
					2,
					10,
					"10 call fn_bouteille",
					1
				},
				{
					"Kit de soins",
					2,
					10,
					"10 call fn_add_kit_soin",
					1
				},
				{
					"Smoke", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_Smoke", // fonction
					1 // si affiche le prix
				},
				{
					"Grenade à billes", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_grenade_billes", // fonction
					1 // si affiche le prix
				},
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				},
				{
					"Drone",
					1,
					1000,
					"call fn_BuyUAV",
					1
				}
			},
			{//6
				{
					"50 Billes", // nom
					2, // si peut être acheté
					75, // prix
					"50 call fn_AddPellets", // fonction
					1 // si affiche le prix
				},
				{
					"100 Billes",
					2,
					150,
					"100 call fn_AddPellets",
					1
				},
				{
					"200 Billes",
					2,
					300,
					"200 call fn_AddPellets",
					1
				},
				{
					"Kit de soins",
					2,
					10,
					"10 call fn_add_kit_soin",
					1
				},
				{
					"Smoke", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_Smoke", // fonction
					1 // si affiche le prix
				},
				{
					"Grenade à billes", // nom
					2, // si peut être acheté
					40, // prix
					"40 call fn_grenade_billes", // fonction
					1 // si affiche le prix
				},
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				},
				{
					"Drone",
					1,
					1000,
					"call fn_BuyUAV",
					1
				}
			},
			{ // 7
				{
					"50 Billes", // nom
					2, // si peut être acheté
					75, // prix
					"50 call fn_AddPellets", // fonction
					1 // si affiche le prix
				},
				{
					"100 Billes",
					2,
					150,
					"100 call fn_AddPellets",
					1
				},
				{
					"200 Billes",
					2,
					300,
					"200 call fn_AddPellets",
					1
				},
				{
					"Bouteille d'eau",
					2,
					10,
					"10 call fn_bouteille",
					1
				},
				{
					"Kit de soins",
					2,
					10,
					"10 call fn_add_kit_soin",
					1
				},
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				}
			},
			{//8
				{//0
					{
						"Tenue 1", // nom
						1, // si peut être acheté
						20000, // prix
						"1 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"TA-image\tenues_bleus\lvl_1.paa" // chemain de image
					},
					{
						"Tenue 2", // nom
						1, // si peut être acheté
						40000, // prix
						"2 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"TA-image\tenues_bleus\lvl_2.paa" // chemain de image
					},
					{
						"Tenue 3", // nom
						1, // si peut être acheté
						60000, // prix
						"3 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						3, // n° tenue
						"TA-image\tenues_bleus\lvl_3.paa" // chemain de image
					},
					{
						"Tenue 4", // nom
						1, // si peut être acheté
						80000, // prix
						"4 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						4, // n° tenue
						"TA-image\tenues_bleus\lvl_4.paa" // chemain de image
					}
				},
				{//1
					{
						"Tenue VIP 1", // nom
						1, // si peut être acheté
						5000, // prix
						"5 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						5, // n° tenue
						"TA-image\tenues_bleus\Tenue_VIP_1.paa" // chemain de image
					}
				},
				{//2
					{
						"Tenue VIP 2", // nom
						1, // si peut être acheté
						10000, // prix
						"6 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						6, // n° tenue
						"TA-image\tenues_bleus\Tenue_VIP_2.paa" // chemain de image
					}
				},
				{//3
					{
						"Tenue VIP 3", // nom
						1, // si peut être acheté
						15000, // prix
						"7 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						7, // n° tenue
						"TA-image\tenues_bleus\Tenue_VIP_3.paa" // chemain de image
					}
				},
				{//4
					{
						"Tenue 1", // nom
						1, // si peut être acheté
						20000, // prix
						"1 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"TA-image\tenues_bleus\lvl_1.paa" // chemain de image
					},
					{
						"Tenue 2", // nom
						1, // si peut être acheté
						40000, // prix
						"2 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"TA-image\tenues_bleus\lvl_2.paa" // chemain de image
					},
					{
						"Tenue 3", // nom
						1, // si peut être acheté
						60000, // prix
						"3 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						3, // n° tenue
						"TA-image\tenues_bleus\lvl_3.paa" // chemain de image
					},
					{
						"Tenue 4", // nom
						1, // si peut être acheté
						80000, // prix
						"4 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						4, // n° tenue
						"TA-image\tenues_bleus\lvl_4.paa" // chemain de image
					},
					{
						"Tenue VIP 1", // nom
						1, // si peut être acheté
						5000, // prix
						"5 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						5, // n° tenue
						"TA-image\tenues_bleus\Tenue_VIP_1.paa" // chemain de image
					},
					{
						"Tenue VIP 2", // nom
						1, // si peut être acheté
						10000, // prix
						"6 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						6, // n° tenue
						"TA-image\tenues_bleus\Tenue_VIP_2.paa" // chemain de image
					},
					{
						"Tenue VIP 3", // nom
						1, // si peut être acheté
						15000, // prix
						"7 call fn_add_tenue_bleus", // fonction
						1, // si affiche le prix
						7, // n° tenue
						"TA-image\tenues_bleus\Tenue_VIP_3.paa" // chemain de image
					}
				}
			},
			{//9
				{//0
					{
						"Tenue 1", // nom
						1, // si peut être acheté
						20000, // prix
						"1 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"TA-image\tenues_rouges\lvl_1.paa" // chemain de image
					},
					{
						"Tenue 2", // nom
						1, // si peut être acheté
						40000, // prix
						"2 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"TA-image\tenues_rouges\lvl_2.paa" // chemain de image
					},
					{
						"Tenue 3", // nom
						1, // si peut être acheté
						60000, // prix
						"3 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						3, // n° tenue
						"TA-image\tenues_rouges\lvl_3.paa" // chemain de image
					},
					{
						"Tenue 4", // nom
						1, // si peut être acheté
						80000, // prix
						"4 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						4, // n° tenue
						"TA-image\tenues_rouges\lvl_4.paa" // chemain de image
					}
				},
				{//1
					{
						"Tenue VIP 1", // nom
						1, // si peut être acheté
						5000, // prix
						"5 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						5, // n° tenue
						"TA-image\tenues_rouges\VIP_1.paa" // chemain de image
					}
				},
				{//2
					{
						"Tenue VIP 2", // nom
						1, // si peut être acheté
						10000, // prix
						"6 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						6, // n° tenue
						"TA-image\tenues_rouges\VIP_2.paa" // chemain de image
					}
				},
				{//3
					{
						"Tenue VIP 3", // nom
						1, // si peut être acheté
						15000, // prix
						"7 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						7, // n° tenue
						"TA-image\tenues_rouges\VIP_3.paa" // chemain de image
					}
				},
				{//4
					{
						"Tenue 1", // nom
						1, // si peut être acheté
						20000, // prix
						"1 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"TA-image\tenues_rouges\lvl_1.paa" // chemain de image
					},
					{
						"Tenue 2", // nom
						1, // si peut être acheté
						40000, // prix
						"2 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"TA-image\tenues_rouges\lvl_2.paa" // chemain de image
					},
					{
						"Tenue 3", // nom
						1, // si peut être acheté
						60000, // prix
						"3 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						3, // n° tenue
						"TA-image\tenues_rouges\lvl_3.paa" // chemain de image
					},
					{
						"Tenue 4", // nom
						1, // si peut être acheté
						80000, // prix
						"4 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						4, // n° tenue
						"TA-image\tenues_rouges\lvl_4.paa" // chemain de image
					},
					{
						"Tenue VIP 1", // nom
						1, // si peut être acheté
						5000, // prix
						"5 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						5, // n° tenue
						"TA-image\tenues_rouges\VIP_1.paa" // chemain de image
					},
					{
						"Tenue VIP 2", // nom
						1, // si peut être acheté
						10000, // prix
						"6 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						6, // n° tenue
						"TA-image\tenues_rouges\VIP_2.paa" // chemain de image
					},
					{
						"Tenue VIP 3", // nom
						1, // si peut être acheté
						15000, // prix
						"7 call fn_add_tenue_rouges", // fonction
						1, // si affiche le prix
						7, // n° tenue
						"TA-image\tenues_rouges\VIP_3.paa" // chemain de image
					}
				}
			},
			{//10
				{
					"50 Billes", // nom
					2, // si peut être acheté
					75, // prix
					"50 call fn_AddPellets", // fonction
					1 // si affiche le prix
				},
				{
					"100 Billes",
					2,
					150,
					"100 call fn_AddPellets",
					1
				},
				{
					"200 Billes",
					2,
					300,
					"200 call fn_AddPellets",
					1
				},
				{
					"Kit de soins",
					2,
					10,
					"10 call fn_add_kit_soin",
					1
				},
				{
					"Distribuer des crédits",
					2,
					0,
					"call fn_Distribute",
					0
				},
				{
					"Drone",
					1,
					1000,
					"call fn_BuyUAV",
					1
				}
			},
			{//11
				{//0
					{
						"Tenue VR", // nom
						1, // si peut être acheté
						0, // prix
						"1 call fn_add_tenue_vr_bleus", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"" // chemain de image
					}
				},
				{//1
					{ 
						"Tenue VR", // nom
						1, // si peut être acheté
						0, // prix
						"1 call fn_add_tenue_vr_bleus", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"" // chemain de image
					},
					{
						"Tenue VR VIP", // nom
						1, // si peut être acheté
						50000, // prix
						"2 call fn_add_tenue_vr_bleus", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"" // chemain de image
					}
				},
				{//2
					{
						"Tenue VR VIP", // nom
						1, // si peut être acheté
						50000, // prix
						"2 call fn_add_tenue_vr_rouges", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"" // chemain de image
					}
				}
			},
			{//12
				{//0
					{
						"Tenue VR", // nom
						1, // si peut être acheté
						0, // prix
						"1 call fn_add_tenue_vr_rouges", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"" // chemain de image
					}
				},
				{//1
					{ 
						"Tenue VR", // nom
						1, // si peut être acheté
						0, // prix
						"1 call fn_add_tenue_vr_rouges", // fonction
						1, // si affiche le prix
						1, // n° tenue
						"" // chemain de image
					},
					{
						"Tenue VR VIP", // nom
						1, // si peut être acheté
						50000, // prix
						"2 call fn_add_tenue_vr_rouges", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"" // chemain de image
					}
				},
				{//2
					{
						"Tenue VR VIP", // nom
						1, // si peut être acheté
						50000, // prix
						"2 call fn_add_tenue_vr_rouges", // fonction
						1, // si affiche le prix
						2, // n° tenue
						"" // chemain de image
					}
				}
			}
		};
	};
};
