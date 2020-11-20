
// Different vars
gg_gamestatus = 0; // Waiting for weapon list
publicVariable "gg_gamestatus";

gg_mapvotes = [];
{
	gg_mapvotes pushBack 0;
} forEach (getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data"));

// lance l 'interface vote map
gg_weaponList = {1; 1};
publicVariable "gg_weaponList";

// Wait defined seconds
sleep 
(
	getNumber(missionConfigFile >> "CfgGungame" >> "Basic" >> "voteTime")
);

// Determine winning map
_winindex = -1;
if (true) then
{
	_lowest = -1;
	{
		if (_x > _lowest) then 
		{
			_winindex = _forEachIndex;
			_lowest = _x;
		};
	} forEach gg_mapvotes;
};

// Publish map index to play
gg_mapindex = _winindex;
publicVariable "gg_mapindex";

arena = (getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data")) select gg_mapindex;
publicVariable "arena";

sleep 0.2;

[] call mission_fnc_config_server;

// Start game for all players
[] remoteExec ["gg_fnc_startGame"];

// Set game status to running
gg_gamestatus = 1;
publicVariable "gg_gamestatus";
