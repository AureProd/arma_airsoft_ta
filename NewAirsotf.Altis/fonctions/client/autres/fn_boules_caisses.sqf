
player setVariable ["earplugs", 0];

waituntil 
{
	!(IsNull (findDisplay 46))
};  

(findDisplay 46) displayAddEventHandler ["KeyDown", 
{
	if ((_this select 1) == 59) then 
	{
		_temp = player getVariable "earplugs";

		switch (_temp) do 
		{
			case 30: 
			{
				player setvariable ["earplugs", 0];
				1 fadeSound 1;
				[parseText "<t align='center' shadow='2' size='4'><t color='#F6A821'>Casque allumé!</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
			};
			case 50: 
			{
				player setvariable ["earplugs", 30];
				1 fadeSound 0.7;
				[parseText "<t align='center' shadow='2' size='4'><t color='#F6A821'>30% plus haut</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
			};
			case 80: 
			{
				player setvariable ["earplugs", 50];
				1 fadeSound 0.5;
				[parseText "<t align='center' shadow='2' size='4'><t color='#F6A821'>50% plus haut</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
			};
			case 90: 
			{
				player setvariable ["earplugs", 80];
				1 fadeSound 0.2;
				[parseText "<t align='center' shadow='2' size='4'><t color='#F6A821'>80% plus haut</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
			};
			case 95: 
			{
				player setvariable ["earplugs", 90];
				1 fadeSound 0.1;
				[parseText "<t align='center' shadow='2' size='4'><t color='#F6A821'>90% plus haut</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
			};
			case 0: 
			{
				player setvariable ["earplugs", 95];
				1 fadeSound 0.01;
				[parseText "<t align='center' shadow='2' size='4'><t color='#F6A821'>Casque éteint</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
			};
		};	
	};
}];