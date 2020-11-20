waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

1996 cutRsc ["interface_bleu", "PLAIN"];

[] spawn {
	while {true} do
	{
		sleep 0.5;
		
		_displayBleu = (uiNamespace getVariable "interface_bleu");
		
		(_displayBleu displayCtrl 1001)
		ctrlSetStructuredText parseText format
		[
			"%1", eau
		];

		(_displayBleu displayCtrl 1002)
		ctrlSetStructuredText parseText format
		[
			"%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)
		];

		(_displayBleu displayCtrl 1003)
		ctrlSetStructuredText parseText format
		[
			"%1", urinePourcent
		];

		(_displayBleu displayCtrl 1004)
		ctrlSetStructuredText parseText format
		[
			"%1/%2", hitsGiven, timesHit
		];

		(_displayBleu displayCtrl 1005)
		ctrlSetStructuredText parseText format
		[
			"%1", pellets
		];
	};
};