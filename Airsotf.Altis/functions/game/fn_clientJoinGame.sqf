/*
    Game_fnc_clientJoinGame.sqf
    Description:
        Player join game on client side.
    Params:
        _gameMap (HASHMAP) - Selected map to play game.
        _gameMode (HASHMAP) - Selected game-mode of map to play game.
        _printCountDown (BOOL) - If print start countdown to player (Default value: 'false').
*/

#define LOG_PREFIX "[Game]"

params ["_gameMap", "_gameMode", ["_printCountDown", false]];

if (!hasInterface) exitWith {};  // Only on client side

diag_log format ["%1 Join game.", LOG_PREFIX];

if (_printCountDown) then {
    // Print start countdown before game starting
    call Game_fnc_clientGameCountDown;
};

// Display KillFeed 
cutRsc ["KillFeed", "PLAIN"];

// Teleport player to his base
// Make player invincble during teleportation
player allowDamage false;

private _gameModeID = _gameMap get "game_mode";
private _mapSpawns = _gameMap get "spawns";
private _mapBlueSpawn = _mapSpawns get "blue";
private _mapRedSpawn = _mapSpawns get "red";

if(side player == west) then
{
    // Teleport player to blue spawn because he is in blue team
    if(_gameModeID == "SPY") then
    {
        // If game-mode is SPY blue team hase many differents spawns points
        player setPosATL (selectRandom(_mapBlueSpawn));
    }
    else 
    {
        player setposATL _mapBlueSpawn;
    };
}
else
{
    // Teleport player to red spawn because he is in red team
    player setPosATL _mapRedSpawn;
};

[] spawn {
    sleep 1;
    player allowDamage true;
};
