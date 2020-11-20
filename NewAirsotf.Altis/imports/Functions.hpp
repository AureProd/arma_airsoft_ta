
class CfgFunctions 
{
    class mission 
    {
        tag = "mission";
        
        class fonctions
        {
            file = "fonctions\client\fonctions";
            class setloadout {};
            class uriner {};
            class boire {};
            class boire_bouteille {};
            class capture_drapeau {};
            class reanimation {};
            class setFlagColor {};
        };

        class menus
        {
            file = "fonctions\client\menus";
            class menu_admin {};
            class fonctions_menus {};
            class add_arme {};
            class funcs {};

            class interface_bleu {};
            class interface_espion {};
            class interface_rouge {};
            class interface_wifi {};
            class status_bar {};
            class status_bar_bis {};
            class status_bar_pirate {};
            class statusticket {};
            class statusticket_pirate {};
        };

        class add_actions
        {
            file = "fonctions\client\add_actions";
            class actions_ctf {};
            class actions_piratage {};
            class actions_vip {};
        };

        class client_autres
        {
            file = "fonctions\client\autres";
            class intro_airsoft {};
            class briefing {};
            class boules_caisses {};
            class config_server {};
            class config_client {};
            class logos {};
            class jump {};
            class boucle {};
        };

        class client_bdd
        {
            file = "fonctions\client\bdd";
            class modif_var_bdd {};
            class syns_data {};
            class modif_money {};
            class set_money {};
        };

        class vote_map
        {
            file = "fonctions\client\vote_map";
            class welcome {};
        };

        class serveur
        {
            file = "fonctions\serveur";
            class kill_cadavre {};
            class events_server {};
        };
    };

    class vote_map_client
    {
		tag = "gg";

		class functions
        {
			file = "fonctions\vote_map\client";

			class selectMap {};
			class showArena {};
			class voteForMap {};
			class spawn {};
			class startGame {};
            class init_client {};
		};
	};

	class vote_map_server
    {
		tag = "mav";

		class functions
        {
			file = "fonctions\vote_map\server";

			class voteForMap {};
            class init_server {};
		};
	};
};
