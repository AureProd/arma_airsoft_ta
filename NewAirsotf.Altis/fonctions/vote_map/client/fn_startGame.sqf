
_skipCountdown = param[0,false,[false]];

waitUntil {!isNull player};

// Close dialogs
closeDialog 0;

// Smooth transition
if (!isNil "gg_didSelectMap") then 
{
	50000 cutRsc ["gungame_blackout", "PLAIN"];
};

sleep 2;

// Spawn
[] spawn gg_fnc_spawn;

sleep 0.5;

// Clear some layers
100 cutRsc ["Default", "PLAIN"];

// Destroy cam
if (!isNil "gg_introcam_object") then 
{
	((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow false;

	gg_introcam_object cameraEffect ["TERMINATE","BACK"];
	camDestroy gg_introcam_object;
	player switchCamera "INTERNAL";
};

// Clear some layers
100 cutRsc ["Default", "PLAIN"];

// Killfeed display
151 cutRsc ["Killfeed", "PLAIN"];

// Smooth transition in
50000 cutRsc ["gungame_blackin", "PLAIN"];

// Prevent JIP players from having a countdown
if (_skipCountdown) exitWith {};

// Disable player input
disableUserInput true;

// Disable stamina
player enableStamina false;
player setCustomAimCoef 0;

// Countdown
[parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>5</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	playSound "Decompte2";
sleep 2;
[parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>4</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	playSound "Decompte2";
sleep 2;
[parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>3</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	playSound "Decompte2";
sleep 2;
[parseText "<t align='center' shadow='2' size='4'><t color='#21c0f6'>2</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	playSound "Decompte2";
sleep 2;
[parseText "<t align='center' shadow='2' size='4'><t color='#21f632'>1</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	playSound "Decompte2";
sleep 2;
[parseText "<t align='center' shadow='4' size='6'><t color='#f62148'>Play</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	playSound "usmoveout";

disableUserInput false;