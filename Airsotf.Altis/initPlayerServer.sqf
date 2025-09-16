params ["_player", "_didJIP"];

diag_log "Run InitPlayerServer file";

private _playerName = name _player;
private _playerUID  = getPlayerUID _player;

// Initialize new connected player
diag_log format ["Player '%1' connected (UID: '%2').", _playerName, _playerUID];

["Welcome to the server !"] remoteExec ["hint", _player];

// Fetch player data from database
[_player] call DB_fnc_fetchPlayerData;

// Wait player is fully initialized
waitUntil {_player getVariable ["is_initialized", false]};

diag_log format ["Player '%1' initialized (UID: '%2').", _playerName, _playerUID];

// Read game-status
private _gameStatus = missionNamespace getVariable ["game_status", "waiting"];

// Execute the code that corresponds to the game-status
switch (_gameStatus) do {
	case "waiting": { 
		// Game in wait of players to start
		// After this first player is connected, change game-status to 'in_vote' and start vote for select map 
		missionNamespace setVariable ["game_status", "in_vote", true];
		diag_log "Game-status updated to 'in_vote'.";

		call Vote_fnc_serverStartVote;
	};
	case "in_vote": { 
		
	};
	case "in_game": { 
		
	};
	default { 
		diag_log format ["ERROR: Unexpected game-status value: '%1'.", _gameStatus];
	};
};