
// Disable saving
enableSaving [false, false];

// Wait until server is ready
waitUntil {!isNil "gg_weaponList"};

waitUntil {!isNil "gg_gamestatus"};

if (gg_gamestatus == 0) then 
{
	// Open map selection
	[] spawn gg_fnc_selectMap;
	//playMusic "LeadTrack02_F_EPC";
}
else 
{
	[true] spawn gg_fnc_startGame;
};