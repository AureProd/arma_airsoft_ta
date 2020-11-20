
remet_chargeurs =
{
    [] spawn 
    {
        _fusil = primaryWeapon player; 
        _pistolet = handgunWeapon player;

        _configbis1 = getArray(missionConfigFile >> "TA" >> "guns" >> "data");

        {
            if ((_x select 5) == _fusil || (_x select 5) == _pistolet) then 
            {
                _id = _x select 6;
                _cnt = {_x == _id} count (magazineCargo player);

                switch (_cnt) do 
                {
                    case 1: 
                    { 
                        player addmagazines [_id, 1];
                    };
                    case 0: 
                    { 
                        player addmagazines [_id, 2];
                    };
                };
            }; 
        } forEach (_configbis1 select 0);

        reload player;
    };
};

randomGearBlu = 
{
    player forceAddUniform "U_BG_Guerilla2_1";
    player addVest "V_Rangemaster_belt";

    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    player linkItem "ItemRadio";
};

randomGearRed =
{
    player forceAddUniform "U_BG_Guerilla1_1";
    player addVest "V_Rangemaster_belt";

    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    player linkItem "ItemRadio";
};

tenue_vr_bleu = 
{
    player forceAddUniform "U_B_Protagonist_VR";

    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    player linkItem "ItemRadio";
};

tenue_vr_rouge =
{
    player forceAddUniform "U_O_Protagonist_VR";

    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    player linkItem "ItemRadio";
};

fn_GetOutfit_laser_games =
{
    if(side player == west) then
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call tenue_vr_bleu;

        call fn_Buyacpc2_sans_light;
    }
    else
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call tenue_vr_rouge;

        call fn_Buyacpc2_sans_light;
    };
};

fn_GetOutfit =
{
    if(side player == west) then
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call randomGearBlu;

        call fn_Buyrook40;
    }
    else
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call randomGearRed;

        call fn_Buyrook40;
    };
};

fn_GetOutfit_bis_bis =
{
    if(side player == west) then
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call compile(player getVariable "tenueOn");

        call fn_Buyrook40;
    }
    else
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call compile(player getVariable "tenueOn");

        call fn_Buyrook40;
    };
};

fn_GetOutfit_bis =
{
    if(side player == west) then
    {
        call randomGearBlu;
    }
    else
    {
        call randomGearRed;
    };
};

fn_GetOutfit_pirate =
{
    if(side player == west) then
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        player forceAddUniform "U_B_Wetsuit";
        player addGoggles "G_Balaclava_TI_blk_F";
        
		//call fn_Buyrook40;

        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "ItemRadio";

        player linkItem "NVGogglesB_blk_F";
        player addWeapon "Laserdesignator";
    }
    else
    {
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeBackpack player;
        removeUniform player;
        removeVest player;

        removeHeadgear player;
        removeGoggles player;

        call randomGearRed;

        call fn_Buyacpc2;
    };
};

fn_VIPTenue =
{
    removeAllWeapons player;
    removeAllItems player;
    removeAllAssignedItems player;
    removeUniform player;
    removeVest player;

    removeHeadgear player;
    removeGoggles player;

    player forceAddUniform "U_NikosBody";

    player linkItem "ItemCompass";
    player linkItem "ItemWatch";

    player setFace "WhiteHead_13";
    player setSpeaker "Male03ENGB";
};

fn_Urine =
{
    uriner = true;

    if (!boire) then 
    {
        [player, "Acts_GetAttention_Loop"] remoteExec ["switchMove", 0];
        animationOn = true;

        playSound "urine";
        titleText["Vous urinez !", "PLAIN DOWN"];
        sleep 7;

        if (!beingHit) then 
        {
            titleFadeOut 1;
            urinePourcent = 0;

            [player, "normal"] remoteExec ["switchMove", 0];
            animationOn = false;
        };
    };

    uriner = false;
};

fn_Eau =
{
    boire = true;
    
    if (!uriner) then 
    {
        [player, "Acts_GetAttention_Loop"] remoteExec ["switchMove", 0];
        animationOn = true;

        playSound "eau";
        titleText["Vous Buvez !", "PLAIN DOWN"];
        sleep 7;
        
        if (!beingHit) then 
        {
            titleFadeOut 1;

            eau = 100;

            if(urinePourcent < 80) then
            {
                urinePourcent = urinePourcent + 20;
            }
            else 
            {
                urinePourcent = 100;
            };

            [player, "normal"] remoteExec ["switchMove", 0];
            animationOn = false;
        };
    };

    boire = false;
};

fn_pirate_A =
{
    player setVariable ["value", true, true];

    cpAValue = -1;
    publicVariable "cpAValue";

    [] remoteExec ["fn_SoundPC_A"];

    [] spawn
    {
        while {cpAValue == -1} do 
        {
            switch (wifi) do 
            {
                case 3: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 2.5;
                };
                case 2: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 5;
                };
                case 1: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 10;
                };
            };
        };
    };

    [] spawn
    {
        while {cpAValue == -1} do 
        {
            if (wifi == 0 || pourcentagePiratage >= 100 || beingHit || gg_gamestatus == 0) then 
            {
                player setVariable ["value", false, true];

                cpAValue = 0;
                publicVariable "cpAValue";
            }
            else 
            {
                playMusic "telechargement";
                sleep 0.76;
            }; 
        };
    };
};

fn_pirate_B =
{
    player setVariable ["value", true, true];

    cpBValue = -1;
    publicVariable "cpBValue";

    [] remoteExec ["fn_SoundPC_B"];

    [] spawn
    {
        while {cpBValue == -1} do 
        {
            switch (wifi) do 
            {
                case 3: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 2.5;
                };
                case 2: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 5;
                };
                case 1: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 10;
                };
            };
        };
    };

    [] spawn
    {
        while {cpBValue == -1} do 
        {
            if (wifi == 0 || pourcentagePiratage >= 100 || beingHit || gg_gamestatus == 0) then 
            {
                player setVariable ["value", true, true];

                cpBValue = 0;
                publicVariable "cpBValue";
            }
            else 
            {
                playMusic "telechargement";
                sleep 0.76;
            }; 
        };
    };
};

fn_pirate_C =
{
    player setVariable ["value", true, true];

    cpCValue = -1;
    publicVariable "cpCValue";

    [] remoteExec ["fn_SoundPC_C"];

    [] spawn
    {
        while {cpCValue == -1} do 
        {
            switch (wifi) do 
            {
                case 3: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 2.5;
                };
                case 2: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 5;
                };
                case 1: 
                { 
                    pourcentagePiratage = pourcentagePiratage + 0.5;
                    publicVariable "pourcentagePiratage";

                    50 call fn_AddCreditsSound;

                    sleep 10;
                };
            };
        };
    };

    [] spawn
    {
        while {cpCValue == -1} do 
        {
            if (wifi == 0 || pourcentagePiratage >= 100 || beingHit || gg_gamestatus == 0) then 
            {
                player setVariable ["value", true, true];

                cpCValue = 0;
                publicVariable "cpCValue";
            }
            else 
            {
                playMusic "telechargement";
                sleep 0.76;
            }; 
        };
    };
};

fn_SoundPC_A =
{
    ["Notif", ["Terminal A", "Piratage en cours ..."]] call BIS_fnc_showNotification;
    
    playSound "usobjectivesecure";
};

fn_SoundPC_B =
{
    ["Notif", ["Terminal B", "Piratage en cours ..."]] call BIS_fnc_showNotification;
    
    playSound "usobjectivesecure";
};

fn_SoundPC_C =
{
    ["Notif", ["Terminal C", "Piratage en cours ..."]] call BIS_fnc_showNotification;
    
    playSound "usobjectivesecure";
};

fn_tropBilles =
{
    titleText["Vous avez trop de billes", "PLAIN DOWN", 0.25];
    playSound "AddItemFailed";
};

fn_InsufficientFunds =
{
    titleText["Fonds insuffisants", "PLAIN DOWN", 0.25];
    playSound "AddItemFailed";
};

//Cost of pellet = 2 credits
fn_AddPellets =
{
    _cost = _this * 1.5;

    if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _cost) then
    {
        if(pellets < 300) then
		{
            [_cost, 0] call mission_fnc_modif_money;

            pellets = pellets + _this;

            call remet_chargeurs;

            titleText
            [
                format
                [
                    "%1 billes achetées",
                    _this
                ],
                "PLAIN DOWN",
                0.25
            ];

            playSound "purchase";
		}
        else
        {
			call fn_tropBilles;
		};
    }
    else
    {
        call fn_InsufficientFunds;
    };
};

//One force pt = 100 credits
fn_AddPelletForce =
{
    _cost = _this * 100;

    if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= _cost) then
    {
        [_cost, 0] call mission_fnc_modif_money;

        projInitSpeed = projInitSpeed + 10;

        playSound "purchase";
    }
    else
    {
        call fn_InsufficientFunds;
    };
};

//Notifies player that they hit someone
fn_Elimination =
{
    systemChat format
    [
        "%1 hit %2",
        name (_this select 1),
        name (_this select 0)
    ];

    if (arena select 2 == 3) then 
    {
        if (player == VIP) then 
        {
            25 call fn_AddCreditsSound;
        };
    };

    if(player == _this select 1) then
    {
        hitsGiven = hitsGiven + 1;

		playSound selectRandom(sons_hits);

        titleText
        [
            format
            [
                "Vous avez touché %1\n50 crédits accordés",
                name (_this select 0)
            ],
            "PLAIN DOWN",
            0.25
        ];

        if ((arena select 3) == 3) then 
        {
            if (side player == west) then 
            {
                50 call fn_AddCreditsSound;
            }
            else
            {
                100 call fn_AddCreditsSound;
            };
        } 
        else 
        {
            50 call fn_AddCreditsSound;
        };
    };
};

//Plays sound while adding credits
fn_AddCreditsSound =
{
    [_this, 1] call mission_fnc_modif_money;
};

fn_BuyATV =
{
    if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= 3500) then
    {
        [3500, 0] call mission_fnc_modif_money;

        _v = "C_Quadbike_01_F" createVehicle (position vehSpawn);
        _v allowDamage false;

        if(_this == 0) then
        {
            _v disableCollisionWith blu_ATVSpawn;
            _v setPos
            [
                (position blu_ATVSpawn select 0) + ((sin direction blu_ATVSpawn) * 3),
                (position blu_ATVSpawn select 1) + ((cos direction blu_ATVSpawn) * 3),
                0
            ];
            _v setDir (direction blu_ATVSpawn);
        }
        else
        {
            _v disableCollisionWith red_ATVSpawn;
            _v setPos
            [
                (position red_ATVSpawn select 0) + ((sin direction red_ATVSpawn) * 3),
                (position red_ATVSpawn select 1) + ((cos direction red_ATVSpawn) * 3),
                0
            ];
            _v setDir (direction red_ATVSpawn);
        };

        _v setDamage 0;
        player moveInDriver _v;

        playSound "purchase";
    }
    else
    {
        call fn_InsufficientFunds;
    };
};

fn_Distribute_Rcv =
{
    _niceGuy = _this select 0;
    _credits = _this select 1;

    if(side player == side _niceGuy) then
    {
        titleText
        [
            format
            [
                "%1 a distribué ses crédits au sein de l'équipe.\nTu as reçu %2 -C-",
                name _niceGuy,
                _credits
            ],
            "PLAIN DOWN"
        ];

        _credits call fn_AddCreditsSound;
    };
};

fn_Distribute =
{
    if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= 100) then
    {
        _count = (side player) countSide playableUnits;

        _creds = ((missionNamespace getVariable nomVarPlayerUID) select 0);

        [0] call mission_fnc_set_money;

        _share = floor(_creds / (_count max 1));

        [player, _share] remoteExec ["fn_Distribute_Rcv"];

        playSound "click";
    }
    else
    {
        titleText["Vous devez avoir un minimum de 100 crédits à distribuer", "PLAIN DOWN", 0.25];
        playSound "AddItemFailed";
    };
};

fn_EndMission =
{
    if(_this == west) then
    {
        gg_gamestatus = 0;
		publicVariable "gg_gamestatus";

        playMusic "ricainwin";

        if (!isNil "gg_roundended") exitWith {};
        gg_roundended = 1;

        // Disable user input
        disableSerialization;

        // Smooth transition
        1000 cutRsc ["gungame_wintransition", "PLAIN"];
        0.5 fadeMusic 0;
        0 fadeMusic 1;

        // Delete progression title
        150 cutRsc ["Default", "PLAIN"];

        [parseText "", [0,0,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

        switch (arena select 3) do
        {
            case 1:
            {
                if (side player == west) then {
                    [500, 1] call mission_fnc_modif_money;
                }
                else
                {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 250) then 
                    {
                        [250, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                };

                // End screen
                500 cutRsc ["EndScreen","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen", displayNull];
                
                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe allemande, Vous gagnez la partie avec un total de : %1 tickets</t>", ticketsBlu];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe américaine vous a Fisté, Ils gagnent la partie avec un total de : %1 tickets</t>", ticketsBlu];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1:%2", ticketsBlu, ticketsRed];
                (_display displayCtrl 4) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
            case 2:
            {
                if (side player == west) then {
                    [500, 1] call mission_fnc_modif_money;
                }
                else
                {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 250) then 
                    {
                        [250, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                };

                // End screen
                502 cutRsc ["EndScreen_bis","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen_bis", displayNull];
                
                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe allemande</t>"];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe américaine vous a Fisté</t>"];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
            case 3:
            {
                if (side player == west) then {
                    [750, 1] call mission_fnc_modif_money;
                }
                else
                {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 350) then 
                    {
                        [350, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                };

                // End screen
                501 cutRsc ["EndScreen_bis","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen_bis", displayNull];

                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe allemande</t>"];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe américaine vous a Fisté</t>"];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
            case 4:
            {
                if (side player == west) then {
                    [500, 1] call mission_fnc_modif_money;
                }
                else
                {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 250) then 
                    {
                        [250, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                };

                // End screen
                500 cutRsc ["EndScreen","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen", displayNull];
                
                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe allemande, Vous gagnez la partie avec un total de : %1 tickets</t>", ticketsBlu];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe américaine vous a Fisté, Ils gagnent la partie avec un total de : %1 tickets</t>", ticketsBlu];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1:%2", ticketsBlu, ticketsRed];
                (_display displayCtrl 4) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
        };

        // Final cam
        gg_exitcam_object = "camera" camCreate (getPos player);
        gg_exitcam_object cameraEffect ["Internal", "Back"];
        gg_exitcam_object camSetFOV .65;
        gg_exitcam_object camSetFocus [150, 1];
        gg_exitcam_object camCommit 0;
        sleep 0.05;
        showCinemaBorder false;

        // Proper cam animation
        gg_exitcam_object camPreparePos [(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 0) - 200,(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 1) - 200, 100];
        gg_exitcam_object camPrepareTarget ((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0);
        gg_exitcam_object camCommitPrepared 0;
        gg_exitcam_object camPreparePos [(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 0) + 200,(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 1) - 200, 100];
        gg_exitcam_object camPrepareTarget ((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0);
        gg_exitcam_object camCommitPrepared 38;

        sleep 0.05;

        //10000 cutRsc ["gungame_blackoutlong","PLAIN"];
    };

    if(_this == east) then
    {
        gg_gamestatus = 0;
		publicVariable "gg_gamestatus";

        playMusic "germanwin";

        if (!isNil "gg_roundended") exitWith {};
        gg_roundended = 1;

        // Disable user input
        disableSerialization;

        // Smooth transition
        1000 cutRsc ["gungame_wintransition", "PLAIN"];
        0.5 fadeMusic 0;
        0 fadeMusic 1;

        // Delete progression title
        150 cutRsc ["Default", "PLAIN"];

        [parseText "", [0,0,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

        switch (arena select 3) do
        {
            case 1:
            {
                if (side player == west) then {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 250) then 
                    {
                        [250, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                }
                else
                {
                    [500, 1] call mission_fnc_modif_money;
                };

                // End screen
                500 cutRsc ["EndScreen","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen", displayNull];
                
                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe allemande vous a Fisté, Ils gagnent la partie avec un total de : %1 tickets</t>", ticketsRed];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe américaine, Vous gagnez la partie avec un total de : %1 tickets</t>", ticketsRed];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1:%2", ticketsBlu, ticketsRed];
                (_display displayCtrl 4) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
            case 2:
            {
                if (side player == west) then {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 250) then 
                    {
                        [250, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                }
                else
                {
                    [500, 1] call mission_fnc_modif_money;
                };

                // End screen
                502 cutRsc ["EndScreen_bis","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen_bis", displayNull];

                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe allemande vous a Fisté</t>"];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe américaine</t>"];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
            case 3:
            {
                if (side player == west) then {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 350) then 
                    {
                        [350, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                }
                else
                {
                    [750, 1] call mission_fnc_modif_money;
                };

                // End screen
                501 cutRsc ["EndScreen_bis","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen_bis", displayNull];

                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe allemande vous a Fisté</t>"];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe américaine</t>"];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
            case 4:
            {
                if (side player == west) then {
                    if (((missionNamespace getVariable nomVarPlayerUID) select 0) >= 250) then 
                    {
                        [250, 0] call mission_fnc_modif_money;
                    } 
                    else 
                    {
                        [0] call mission_fnc_set_money;
                    };
                }
                else
                {
                    [500, 1] call mission_fnc_modif_money;
                };

                // End screen
                500 cutRsc ["EndScreen","PLAIN"];

                // Fill with data
                _display = uiNamespace getVariable ["gg_endscreen", displayNull];
                
                if (side player == west) then {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>L'équipe allemande vous a Fisté, Ils gagnent la partie avec un total de : %1 tickets</t>", ticketsRed];
                }
                else
                {
                    (_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='4' font='PuristaLight' align='center' shadow='2'>Vous avez Fistés l'équipe américaine, Vous gagnez la partie avec un total de : %1 tickets</t>", ticketsRed];
                };

                // Personal data
                (_display displayCtrl 1) ctrlSetText format["%1", hitsGiven];
                (_display displayCtrl 2) ctrlSetText format["%1", timesHit];
                (_display displayCtrl 3) ctrlSetText format["%1:%2", ticketsBlu, ticketsRed];
                (_display displayCtrl 4) ctrlSetText format["%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)];
            };
        };

        // Final cam
        gg_exitcam_object = "camera" camCreate (getPos player);
        gg_exitcam_object cameraEffect ["Internal", "Back"];
        gg_exitcam_object camSetFOV .65;
        gg_exitcam_object camSetFocus [150, 1];
        gg_exitcam_object camCommit 0;
        sleep 0.05;
        showCinemaBorder false;

        // Proper cam animation
        gg_exitcam_object camPreparePos [(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 0) - 200,(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 1) - 200, 100];
        gg_exitcam_object camPrepareTarget ((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0);
        gg_exitcam_object camCommitPrepared 0;
        gg_exitcam_object camPreparePos [(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 0) + 200,(((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0) select 1) - 200, 100];
        gg_exitcam_object camPrepareTarget ((getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select gg_mapindex) select 0);
        gg_exitcam_object camCommitPrepared 38;

        sleep 0.05;

        //10000 cutRsc ["gungame_blackoutlong","PLAIN"];
    };

    if(_this == resistance) then
    {
        titleText["<t color='#D6D002' size='5'>C'est une égalité</t><br/><br/><br/><br/><br/><br/><t color='#007002'>!!! Airsoft Tactique recrute !!!</t>", "BLACK OUT", -1, true, true];
        
        gg_gamestatus = 0;
		publicVariable "gg_gamestatus";
    };

    sleep 21;

    //["end1", (side player == _this), 1] call BIS_fnc_endMission;
    endMission "END1";
};

fn_BuyUAV =
{
    if(side player == west) then
    {
        removeBackpack player;
        player addBackpack "B_UAV_01_backpack_F";
        player addWeapon "B_UavTerminal";
    }
    else
    {
        removeBackpack player;
        player addBackpack "O_UAV_01_backpack_F";
        player addWeapon "O_UavTerminal";
    };
};

fn_Buycar95 =
{
    if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= 600) then
	{
        [600, 0] call mission_fnc_modif_money;

		if(side player == west) then
		{
			player addweapon "arifle_CTAR_blk_ACO_Pointer_Snds_F";
			player addmagazines ["30Rnd_580x42_Mag_F", 2];
		}
        else
        {
			player addweapon "arifle_CTAR_blk_ACO_Pointer_Snds_F";
			player addmagazines ["30Rnd_580x42_Mag_F", 2];
		};

		titleText["Car95 acheté.", "PLAIN DOWN", 0.25];

		playSound "purchase";
	}
    else
    {
        call fn_InsufficientFunds;
	}
};

fn_Buymk14 =
{
    if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= 1500) then
	{
        [1500, 0] call mission_fnc_modif_money;

		if(side player == west) then
		{
			player addweapon "srifle_DMR_06_camo_F";
			player addmagazines ["20Rnd_762x51_Mag", 2];
			player addPrimaryWeaponItem "muzzle_snds_B";
            player addPrimaryWeaponItem "acc_flashlight";
		}
        else
        {
			player addweapon "srifle_DMR_06_olive_F";
			player addmagazines ["20Rnd_762x51_Mag", 2];
			player addPrimaryWeaponItem "muzzle_snds_B";
            player addPrimaryWeaponItem "acc_flashlight";
		};

		titleText["MK 14 acheté.", "PLAIN DOWN", 0.25];

		playSound "purchase";
	}
    else
    {
        call fn_InsufficientFunds;
	}
};

fn_ParaBase =
{
    id = _this select 0;

    if (side player == west) then 
    {
        if ((_this select 2) == 1) then 
        {
            if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_this select 1)) then
            {
                [(_this select 1), 0] call mission_fnc_modif_money;
                
                playSound "click";

                [] spawn
                {
                    titleText["Déploiement", "BLACK OUT", 0.25];

                    sleep 3;

                    _pos = [(position id) select 0, (position id) select 1, 50];

                    _para = "Steerable_Parachute_F" createVehicle [0, 0, 0];

                    _para setPos _pos;

                    player moveInDriver _para;

                    sleep 1;

                    titleText["", "BLACK IN", 0.5];
                };
            }
            else
            {
                call fn_InsufficientFunds;
            };
        }
        else
        {
            titleText[format["Le point %1 n'est pas capturé, par votre équipe", _this select 3], "PLAIN DOWN", 0.25];
            playSound "AddItemFailed";
        };
    } 
    else 
    {
        if ((_this select 2) == -1) then 
        {
            if(((missionNamespace getVariable nomVarPlayerUID) select 0) >= (_this select 1)) then
            {
                [(_this select 1), 0] call mission_fnc_modif_money;
                
                playSound "click";

                [] spawn
                {
                    titleText["Déploiement", "BLACK OUT", 0.25];

                    sleep 3;

                    _pos = [(position id) select 0, (position id) select 1, 50];

                    _para = "Steerable_Parachute_F" createVehicle [0, 0, 0];

                    _para setPos _pos;

                    player moveInDriver _para;

                    sleep 1;

                    titleText["", "BLACK IN", 0.5];
                };
            }
            else
            {
                call fn_InsufficientFunds;
            };
        }
        else
        {
            titleText[format["Le point %1 n'est pas capturé, par votre équipe", _this select 3], "PLAIN DOWN", 0.25];
            playSound "AddItemFailed";
        };
    };
};

fn_bois =
{
    animationOn = true;

    [player, "Acts_CivilHiding_2"] remoteExec ["switchMove", 0];
    disableUserInput true;

    ["Notif",["Vous avez soif", "Vous n'avez pas bu depuis un moment!"]] call BIS_fnc_showNotification;
    sleep 10;

    if (!beingHit) then 
    {
        disableUserInput false;
        [player, "normal"] remoteExec ["switchMove", 0];

        animationOn = false;
    };
};

fn_pisse =
{
    animationOn = true;

    [player, "Acts_CivilHiding_2"] remoteExec ["switchMove", 0];
    disableUserInput true;

    ["Notif",["Douleur au ventre", "Vous n'avez pas ete au toilette depuis un moment!"]] call BIS_fnc_showNotification;
    sleep 10;

    if (!beingHit) then 
    {
        disableUserInput false;
        [player, "normal"] remoteExec ["switchMove", 0];

        animationOn = false;
    };
};

fn_nvg =
{
    playSound "nvg";
};

fn_bombeIEM =
{
    bombeIEM_pourcentage = 0;

    [player, "IEM"] remoteExec ["fn_son3D", 0];
    
    [player] remoteExec ["fn_bombeIEM_bis", 0];    
};

fn_bombeIEM_bis =
{
    _tableau_lampadaire = [];
    _lampeHandGun = false;
    _lampeGun = false;

    _joueur = _this select 0;
    _array_drones = (position _joueur) nearObjects ["O_UAV_01_F", 150]; // O_UAV_01_backpack_F

    {
        _x setDamage 1;
    } forEach _array_drones;

    {
        if ((_joueur distance _x) <= 50) then 
        {
            _x switchLight "OFF";
            _tableau_lampadaire pushBack (_x);
        };
    } forEach lampadaires; 

    if ((_joueur distance player) <= 50) then 
    {
        {
            if (_x == "acc_flashlight") then {
                player removePrimaryWeaponItem "acc_flashlight";
                _lampeGun = true;
            };
        } forEach (primaryWeaponItems player);

        {
            if (_x == "acc_flashlight_pistol") then {
                player removeHandgunItem "acc_flashlight_pistol";
                _lampeHandGun = true;
            };
        } forEach (handgunItems player);
    };

    [_tableau_lampadaire, _lampeHandGun, _lampeGun] spawn 
    {
        _lampe_pistolet = _this select 1;
        _lampe_arme = _this select 2;

        sleep 3;

        if (_lampe_pistolet) then {
            player addHandgunItem "acc_flashlight_pistol";
        };

        if (_lampe_arme) then {
            player addPrimaryWeaponItem "acc_flashlight";
        };

        sleep 27;

        {
            _x switchLight "ON";
        } forEach (_this select 0);
    };
};

fn_son3D =
{
	_objet = _this select 0;
	_son = _this select 1;

	_objet say3D _son;
};

fn_soigne = 
{
    _joueur = _this;
    
	if ((arena select 3) == 1 || (arena select 3) == 2 || (arena select 3) == 4) then 
	{
		if (_joueur getVariable "hit") then 
		{
            if (kit_soin_restant != 0) then 
			{
				kit_soin_restant = kit_soin_restant - 1;

                private _playerBdd = missionNamespace getVariable nomVarPlayerUID;
			    _niveau_VIP = _playerBdd select 6;

                switch (_niveau_VIP) do {
                    case 3: 
                    {
                        [_joueur, 2] call fn_revive;
                    };
                    case 2: 
                    {
                        [_joueur, 3] call fn_revive;
                    };
                    case 1: 
                    {
                        [_joueur, 4] call fn_revive;
                    };
                    case 0: 
                    {
                        [_joueur, 5] call fn_revive;
                    };
                };
            }
			else
			{
				titleText["Vous n'avez plus de kits de soins !", "PLAIN DOWN", 0.25];
				playSound "AddItemFailed";
			};
		} 
		else 
		{
			titleText["Le joueur n'est pas mort !", "PLAIN DOWN", 0.25];
			playSound "AddItemFailed";
		};
	}
	else
	{
		titleText["Rien, c'est une erreur !", "PLAIN DOWN", 0.25];
    	playSound "AddItemFailed";
	};
};

fn_revive = 
{
    _joueur = _this select 0;
    _while_0n = true;
    _count_while = 0;
    _temps = (_this select 1);
    _temp_div = _temps / 25;

    [player, "Acts_Ambient_Defensive"] remoteExec ["switchMove", 0];
    animationOn = true;

    waitUntil {!(isNull (findDisplay 46))};
	disableSerialization;

	((uiNamespace getVariable "chargement_rond") displayCtrl 1100) ctrlShow true;
	 
	1596 cutRsc ["chargement_rond", "PLAIN"];

    _joueur setVariable ["revive_progression", [true, player], true];

    while {_while_0n && (_joueur getVariable "hit")} do 
    {
        //titleText [format["%1%2", _count_while_pourcentage, "%"], "PLAIN DOWN", 0.25];
        ((uiNamespace getVariable "chargement_rond") displayCtrl 1100) ctrlSetStructuredText parseText format["<img image='TA-image\progress2\progress_%1_ca.paa' size='3' />", _count_while];

        if (_count_while >= 24) then 
        {
            _while_0n = false;

            _joueur setVariable ["hit", false, true];

            ((uiNamespace getVariable "chargement_rond") displayCtrl 1100) ctrlShow false;
            ((uiNamespace getVariable "chargement_rond") displayCtrl 1150) ctrlShow false;

			titleText [format["Vous avez revive %2, il vous reste %1 kits de soins", kit_soin_restant, name _joueur], "PLAIN DOWN", 0.25];

            [50, 1] call mission_fnc_modif_money;
        };

        sleep _temp_div;

        _count_while = _count_while + 1;
    };

    ((uiNamespace getVariable "chargement_rond") displayCtrl 1100) ctrlShow false;
    ((uiNamespace getVariable "chargement_rond") displayCtrl 1150) ctrlShow false;
    
    if (!beingHit) then 
    {
        [player, "normal"] remoteExec ["switchMove", 0];
        animationOn = false;
    };
};

spawnPlayer =
{
    if(side player == west) then
    {
        if((arena select 3) == 3) then
        {
            player setPosATL (selectRandom(arena select 4));
        }
        else 
        {
            player setposATL (arena select 4);
        };
    }
    else
    {
        player setPosATL (arena select 5);
    };
};