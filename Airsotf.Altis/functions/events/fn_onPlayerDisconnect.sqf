/*
    Event_fnc_onPlayerDisconnect.sqf
    Description:
        Add a mission event handler that:
        - 1. Logs player disconnects.
        - 2. Ends the mission if no players remain.
        Refactored with constants and improved structure.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[DISCONNECT]"
#define PLAYER_CHECK_DELAY 1

// Run only on the server
if (!isServer) exitWith {};

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_playerID", "_playerUID", "_playerName"];

    // Log player disconnect
    diag_log format [
        "%1 Player '%2' disconnected (UID: '%3', ID: %4)", 
        LOG_PREFIX, _playerName, _playerUID, _playerID
    ];

    // Clean up disconnected player unit
    deleteVehicle _unit;

    // Check remaining players after engine cleanup
    [] spawn {
        sleep PLAYER_CHECK_DELAY;
        
        private _remainingPlayers = count allPlayers;
        
        if (_remainingPlayers == 0) then {
            diag_log format ["%1 No players remaining, initiating game end sequence", LOG_PREFIX];

            private _gameStatus = call Data_fnc_getGameStatus;

            // If no connected players remaining
            switch (_gameStatus) do {
                case IN_VOTE_GAME_STATUS: { 
                    // Stop vote system
                    call Vote_fnc_serverStopVote;
                };
                case IN_GAME_GAME_STATUS: { 
                    // Stop game
                    call Game_fnc_serverStopGame;
                };
            };            
        } else {
            diag_log format ["%1 %2 player(s) remaining in session", LOG_PREFIX, _remainingPlayers];
        };
    };

    // Return false for normal engine cleanup
    false
}];