#define LOG_PREFIX "[InitPlayerServer]"
#define PLAYER_IS_INIT_VAR "is_initialized"
#define PLAYER_WELCOME_MESSAGE "Welcome to the server !"

params ["_player", "_didJIP"];

diag_log format ["%1 Executing...", LOG_PREFIX];

private _playerName = name _player;
private _playerUID  = getPlayerUID _player;

// Initialize new connected player
diag_log format ["%1 Player '%2' connected (UID: '%3').", LOG_PREFIX, _playerName, _playerUID];

[PLAYER_WELCOME_MESSAGE] remoteExec ["hint", _player];

// Fetch player data from database
[_player] call DB_fnc_fetchPlayerData;

// Wait player is fully initialized
waitUntil {_player getVariable [PLAYER_IS_INIT_VAR, false]};

diag_log format ["%1 Player '%2' initialized (UID: '%3').", LOG_PREFIX, _playerName, _playerUID];

private _gameStatus = call Data_fnc_getGameStatus;
private _gameMaps = call Data_fnc_getGameMaps;

// Execute the code that corresponds to the game-status
switch (_gameStatus) do {
	case WAITING_GAME_STATUS: { 
		// Game in wait of players to start
		// After this first player is connected, change game-status to 'in_vote' and start vote for select map 
		call Vote_fnc_serverStartVote;

		diag_log format ["%1 Player '%2' join vote.", LOG_PREFIX, _playerName];
		[keys _gameMaps] remoteExecCall ["Vote_fnc_clientJoinVote", _player];
	};
	case IN_VOTE_GAME_STATUS: { 
		diag_log format ["%1 Player '%2' join vote.", LOG_PREFIX, _playerName];
		[keys _gameMaps] remoteExecCall ["Vote_fnc_clientJoinVote", _player];
	};
	case IN_GAME_GAME_STATUS: { 
		if (isNil "gameMap" || (count (keys gameMap)) == 0) exitWith {
			diag_log format ["%1 ERROR: Variable 'gameMap' is empty or not defined.", LOG_PREFIX];
		};
		if (isNil "gameMode" || (count (keys _voteHashMap)) == 0) exitWith {
			diag_log format ["%1 ERROR: Variable 'gameMode' is empty or not defined.", LOG_PREFIX];
		};

		diag_log format ["%1 Player '%2' join game.", LOG_PREFIX, _playerName];
		[gameMap, gameMode] remoteExecCall ["Game_fnc_clientJoinGame", _player];
	};
};