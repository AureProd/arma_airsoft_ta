
//_onScreenTime = 6;

sleep 4;

waitUntil {!isNull player};
waitUntil {alive player};

playsound "WelcomeSound";
		  
/*
sleep 4;

_role1 = "La Communautée Tactique Airsoft";
_role1names = ["Vous remercies d'être là"];
_role2 = "Règles";
_role2names = ["Amusez-vous et revenez"];
_role3 = "Discord";
_role3names = ["https://discord.gg/9EXphTA"];
_role4 = "Merci spécial";
_role4names = ["Mysterfreez", "AureProd"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='1.60' color='#1d24e0' align='center'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='1.60' color='#a62802' align='center'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		safezoneX + safezoneW * 0.6,	//DEFAULT: 0.5,0.35
		safezoneY + safezoneH * 0.4, 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5,
		0,
		100
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} 
forEach 
[
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names] 
];
*/