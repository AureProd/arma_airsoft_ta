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

[] spawn {
    if (_printCountDown) then {
        // Print start countdown before game starting
        // Disable player input
        disableUserInput true;

        // Countdown
        [
            parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>5</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
        ] spawn BIS_fnc_textTiles;
        playSound "Countdown";
        
        sleep 2;
        
        [
            parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>4</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
        ] spawn BIS_fnc_textTiles;
        playSound "Countdown";

        sleep 2;
        
        [
            parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>3</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
        ] spawn BIS_fnc_textTiles;
        playSound "Countdown";
        
        sleep 2;
        [
            parseText "<t align='center' shadow='2' size='4'><t color='#21c0f6'>2</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
        ] spawn BIS_fnc_textTiles;
        playSound "Countdown";
        
        sleep 2;
        
        [
            parseText "<t align='center' shadow='2' size='4'><t color='#21f632'>1</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
        ] spawn BIS_fnc_textTiles;
        playSound "Countdown";
        
        sleep 2;
        [
            parseText "<t align='center' shadow='4' size='6'><t color='#f62148'>Play</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
        ] spawn BIS_fnc_textTiles;
        playSound "GameStart";

        disableUserInput false;
    };

    // Display KillFeed 
    cutRsc ["KillFeed", "PLAIN"];

    [] spawn {
        // play game environnement music
        while {true} do 
        {
            playMusic "BackgroundMusic";
            
            sleep 130;
        };
    };

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

    sleep 1;
    player allowDamage true;

    hint format ["Bon jeu %1", name player];
};