waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

1995 cutRsc ["interface_rouge", "PLAIN"];

[] spawn {
	while {true} do
	{
		sleep 0.5;
		
		_displayRouge = (uiNamespace getVariable "interface_rouge");
		
		(_displayRouge displayCtrl 1001)
		ctrlSetStructuredText parseText format
		[
			"%1", eau
		];

		(_displayRouge displayCtrl 1002)
		ctrlSetStructuredText parseText format
		[
			"%1", ((missionNamespace getVariable nomVarPlayerUID) select 0)
		];

		(_displayRouge displayCtrl 1003)
		ctrlSetStructuredText parseText format
		[
			"%1", urinePourcent
		];

		(_displayRouge displayCtrl 1004)
		ctrlSetStructuredText parseText format
		[
			"%1/%2", hitsGiven, timesHit
		];

		(_displayRouge displayCtrl 1005)
		ctrlSetStructuredText parseText format
		[
			"%1", pellets
		];
	};
};