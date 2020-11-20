waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Mysterfreez
	Description: Place les tickets en haut au centre de l'écran pour afficher les informations en jeu.

*/
1999 cutRsc ["osefStatusBar2","PLAIN"];

[] spawn {
	_counter = 180;
	_timeSinceLastUpdate = 0;
	
	while {true} do
	{
		sleep 1;

		switch (-1) do {
			case cpAValue: 
			{ 
				_counter = _counter - 1;
				(
					(
						uiNamespace getVariable "osefStatusBar2"
					)
					displayCtrl 1000
				)
				ctrlSetStructuredText parseText format
				[
					// couleur rouge #a62802
					// couleur blanche #fffff
					// couleur bleue #1d24e0
					" Avancement du Piratage : %1%2 <t color='#a62802'>(en progression Terminal A)</t> ", 
					pourcentagePiratage,
					"%"
				];
			};
			case cpBValue: 
			{ 
				_counter = _counter - 1;
				(
					(
						uiNamespace getVariable "osefStatusBar2"
					)
					displayCtrl 1000
				)
				ctrlSetStructuredText parseText format
				[
					// couleur rouge #a62802
					// couleur blanche #fffff
					// couleur bleue #1d24e0
					" Avancement du Piratage : %1%2 <t color='#a62802'>(en progression Terminal B)</t> ", 
					pourcentagePiratage,
					"%"
				];
			};
			case cpCValue: 
			{ 
				_counter = _counter - 1;
				(
					(
						uiNamespace getVariable "osefStatusBar2"
					)
					displayCtrl 1000
				)
				ctrlSetStructuredText parseText format
				[
					// couleur rouge #a62802
					// couleur blanche #fffff
					// couleur bleue #1d24e0
					" Avancement du Piratage : %1%2 <t color='#a62802'>(en progression Terminal C)</t> ", 
					pourcentagePiratage,
					"%"
				];
			};
			default 
			{ 
				_counter = _counter - 1;
				(
					(
						uiNamespace getVariable "osefStatusBar2"
					)
					displayCtrl 1000
				)
				ctrlSetStructuredText parseText format
				[
					// couleur rouge #a62802
					// couleur blanche #fffff
					// couleur bleue #1d24e0
					" Avancement du Piratage : %1%2 ", 
					pourcentagePiratage,
					"%"
				];
			};
		};
	};
};