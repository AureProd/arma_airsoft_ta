waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
1998 cutRsc ["osefStatusBar3","PLAIN"];

[] spawn {
	while {true} do
	{
		if (side player == west) then 
		{
			switch (wifi) do 
			{
				case 0: 
				{ 
					_counter = 180;
					_timeSinceLastUpdate = 0;
					
					sleep 0.1;

					_counter = _counter - 1;
					(
						(
							uiNamespace getVariable "osefStatusBar3"
						)
						displayCtrl 1000
					)
					ctrlSetStructuredText parseText format
					[
						"<img image='TA-image\wifi\wifi64_0.paa'/>"
					];
				};
				case 1: 
				{ 
					_counter = 180;
					_timeSinceLastUpdate = 0;
					
					sleep 0.1;

					_counter = _counter - 1;
					(
						(
							uiNamespace getVariable "osefStatusBar3"
						)
						displayCtrl 1000
					)
					ctrlSetStructuredText parseText format
					[
						"<img image='TA-image\wifi\wifi64_1.paa'/>"
					];
				};
				case 2: 
				{ 
					_counter = 180;
					_timeSinceLastUpdate = 0;
					
					sleep 0.1;

					_counter = _counter - 1;
					(
						(
							uiNamespace getVariable "osefStatusBar3"
						)
						displayCtrl 1000
					)
					ctrlSetStructuredText parseText format
					[
						"<img image='TA-image\wifi\wifi64_2.paa'/>"
					];
				};
				case 3: 
				{ 
					_counter = 180;
					_timeSinceLastUpdate = 0;
					
					sleep 0.1;

					_counter = _counter - 1;
					(
						(
							uiNamespace getVariable "osefStatusBar3"
						)
						displayCtrl 1000
					)
					ctrlSetStructuredText parseText format
					[
						"<img image='TA-image\wifi\wifi64_3.paa'/>"
					];
				};
			};
		};
	};
};