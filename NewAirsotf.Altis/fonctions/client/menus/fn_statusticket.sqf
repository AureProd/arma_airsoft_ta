waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Mysterfreez
	Description: Place les tickets en haut au centre de l'écran pour afficher les informations en jeu.

*/
1999 cutRsc ["osefStatusBar2","PLAIN"];

if ((arena select 3) == 4) then 
{
	[] spawn 
	{
		_counter = 180;
		_timeSinceLastUpdate = 0;
		while {true} do
		{
			if (side player == west) then 
			{
				sleep 0.5;

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
					" <t color='#1d24e0'>%1</t> | <t color='#a62802'>%2</t> ", 
					ticketsBlu, 
					ticketsRed
				];
			} 
			else 
			{
				sleep 0.5;

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
					" <t color='#1d24e0'>%1</t> | <t color='#a62802'>%2</t> ", 
					ticketsBlu, 
					ticketsRed
				];
			};
		};
	};
}
else 
{
	[] spawn {
		_counter = 180;
		_timeSinceLastUpdate = 0;
		while {true} do
		{
			if (side player == west) then 
			{
				sleep 0.5;

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
					" <t color='#1d24e0'>%1</t> | <img size='0.95' image='%4'/> <img size='0.95' image='%3'/> <img size='0.95' image='%5'/> | <t color='#a62802'>%2</t> ", 
					ticketsBlu, 
					ticketsRed,
					couleurA,
					couleurB,
					couleurC
				];
			} 
			else 
			{
				sleep 0.5;

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
					" <t color='#1d24e0'>%1</t> | <img size='0.95' image='%4'/> <img size='0.95' image='%3'/> <img size='0.95' image='%5'/> | <t color='#a62802'>%2</t> ", 
					ticketsBlu, 
					ticketsRed,
					couleurA,
					couleurB,
					couleurC
				];
			};
		};
	};
};
