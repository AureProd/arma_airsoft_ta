#define LOG_PREFIX "[InitPlayerServer]"

params ["_player", "_didJIP"];

diag_log format ["%1 Executing...", LOG_PREFIX];

private _playerName = name _player;
private _playerUID  = getPlayerUID _player;

// Initialize new connected player
diag_log format ["%1 Player '%2' connected (UID: '%3').", LOG_PREFIX, _playerName, _playerUID];

["Welcome to the server !"] remoteExec ["hint", _player];

// Fetch player data from database
[_player] call DB_fnc_fetchPlayerData;

// Wait player is fully initialized
waitUntil {_player getVariable ["is_initialized", false]};

diag_log format ["%1 Player '%2' initialized (UID: '%3').", LOG_PREFIX, _playerName, _playerUID];

// Read game-status
private _gameStatus = missionNamespace getVariable ["game_status", "waiting"];

// Execute the code that corresponds to the game-status
switch (_gameStatus) do {
	case "waiting": { 
		// Game in wait of players to start
		// After this first player is connected, change game-status to 'in_vote' and start vote for select map 
		missionNamespace setVariable ["game_status", "in_vote", true];
		diag_log format ["%1 Game-status updated to 'in_vote'.", LOG_PREFIX];

		call Vote_fnc_serverStartVote;

		[] remoteExecCall ["Vote_fnc_clientJoinVote", _player];
	};
	case "in_vote": { 
		[] remoteExecCall ["Vote_fnc_clientJoinVote", _player];
	};
	case "in_game": { 
		
	};
	default { 
		diag_log format ["%1 ERROR: Unexpected game-status value: '%2'.", LOG_PREFIX, _gameStatus];
	};
};