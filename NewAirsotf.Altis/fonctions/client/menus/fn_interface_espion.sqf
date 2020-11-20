waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

1997 cutRsc ["interface_espion", "PLAIN"];

[] spawn {
	while {true} do
	{
		sleep 0.5;
		
		_displayEspion = (uiNamespace getVariable "interface_espion");
		
		/* (_displayEspion displayCtrl 1001)
		ctrlSetStructuredText parseText format
		[
			"%6 | <img image='TA-image\credits.paa'/>: %1 | K/D: %5:%2 | <img image='TA-image\billes.paa'/>: %3 | Force de l'Arme: %4 | Vessie: %7%9 | Soif: %8%9", 
			((missionNamespace getVariable nomVarPlayerUID) select 0), 
			timesHit, 
			pellets, 
			projInitSpeed, 
			hitsGiven, 
			teamString,
			urinePourcent,
			eau,
			"%"
		]; */
	};
};