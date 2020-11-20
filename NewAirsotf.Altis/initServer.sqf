
// START / DEBUT

diag_log "Lancement de la connection a la BDD";
[] remoteExec ["db_fnc_init", 2];

[[1988, 5, 16, 8, 0]] remoteExec ["setDate"];

VIPon = 0;
publicVariable "VIPon";

sons_hits = ["hit", "hit1", "hit2", "hit3", "hit4", "hit5", "hit6"];
publicVariable "sons_hits";

[] spawn mission_fnc_kill_cadavre;
[] call mission_fnc_events_server;

[] spawn mav_fnc_init_server;

waitUntil{!isNil "gg_gamestatus"};
waitUntil{gg_gamestatus == 1};

private _boucle_ctf =
{
	while {gg_gamestatus == 1} do
	{
		if(cpAValue == -1) then
		{
			ticketsBlu = ticketsBlu - 1;
			publicVariable "ticketsBlu";
		};

		if(cpAValue == 1) then
		{
			ticketsRed = ticketsRed - 1;
			publicVariable "ticketsRed";
		};

		if(cpBValue == -1) then
		{
			ticketsBlu = ticketsBlu - 1;
			publicVariable "ticketsBlu";
		};

		if(cpBValue == 1) then
		{
			ticketsRed = ticketsRed - 1;
			publicVariable "ticketsRed";
		};

		if(cpCValue == -1) then
		{
			ticketsBlu = ticketsBlu - 1;
			publicVariable "ticketsBlu";
		};

		if(cpCValue == 1) then
		{
			ticketsRed = ticketsRed - 1;
			publicVariable "ticketsRed";
		};

		ticketsBlu = ticketsBlu max 0;
		ticketsRed = ticketsRed max 0;

		publicVariable "ticketsBlu";
		publicVariable "ticketsRed";

		sleep 5;
	};
};

private _boucle_fin_mission_ctf =
{
	while {gg_gamestatus == 1} do
	{
		if(ticketsBlu <= 0 || ticketsRed <= 0) then
		{
			if(ticketsBlu > ticketsRed) then
			{
				west remoteExec ["fn_EndMission"];
			};

			if(ticketsRed > ticketsBlu) then
			{
				east remoteExec ["fn_EndMission"];
			};

			if(ticketsRed == ticketsBlu) then
			{
				resistance remoteExec ["fn_EndMission"];
			};
		};

		sleep 0.25;
	};
};

private _boucle_fin_mission_vip =
{
	while {gg_gamestatus == 1} do
	{
		_deconnection = 0;

		{
			if(_x == VIP) then // west = bleu
			{
				_deconnection = 1;
			};
		} forEach allPlayers;

		if(_deconnection == 0) then
		{
			east remoteExec ["fn_EndMission"];
		};

		sleep 0.25;
	};
};

private _boucle_fin_mission_piratage =
{
	while {gg_gamestatus == 1} do
	{
		if(viePirates == 0) then
		{
			east remoteExec ["fn_EndMission"];
		};

		if(pourcentagePiratage == 100) then
		{
			sleep 1;

			west remoteExec ["fn_EndMission"];
		};

		sleep 0.25;
	};
};

switch (arena select 3) do
{
	case 1:
	{
		//Ticket decrement
		[] spawn _boucle_ctf;
		
		//Server loop
		[] spawn _boucle_fin_mission_ctf;
	};
	case 2:
	{
		_teamVIP = [];

		{
			if(side _x == west) then // west = bleu
			{
				_teamVIP pushBack(_x);
			};
		} forEach allPlayers;

		VIP = selectRandom(_teamVIP);
		publicVariable "VIP";

		VIPon = 1;
		publicVariable "VIPon";

		[] spawn _boucle_fin_mission_vip;
	};
	case 3:
	{
		[] spawn _boucle_fin_mission_piratage;
	};
	case 4:
	{
		//Ticket decrement
		[] spawn _boucle_ctf;
		
		//Server loop
		[] spawn _boucle_fin_mission_ctf;
	};
};