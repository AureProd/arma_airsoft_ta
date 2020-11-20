waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
2000 cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
	while {true} do
	{
		_counter = 180;
		_timeSinceLastUpdate = 0;

		sleep 1;

		_counter = _counter - 1;
		(
			(
				uiNamespace getVariable "osefStatusBar"
			)
			displayCtrl 1000
		)
		ctrlSetStructuredText parseText format
		[
			"%6 | Argent : %1 | K/D: %5:%2 | Billes : %3 | Force de l'Arme: %4 | Vies Restantes: %7",
			((missionNamespace getVariable nomVarPlayerUID) select 0), 
			timesHit, 
			pellets, 
			projInitSpeed, 
			hitsGiven, 
			teamString,
			viePirates
		];
	};
};