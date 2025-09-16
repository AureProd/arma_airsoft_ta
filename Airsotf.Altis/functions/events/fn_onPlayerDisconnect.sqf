/*
    Event_fnc_onPlayerDisconnect.sqf
    Description:
        Add a mission event handler that:
        - 1. Logs player disconnects.
        - 2. Ends the mission if no players remain.
*/

// run only on the server
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_unit", "_playerID", "_playerUID", "_playerName"];

        diag_log format ["Player '%1' disconnected (UID: '%2').", _playerName, _playerUID];

        deleteVehicle _unit;

        // --- Check if any players remain ---
        // `allPlayers` lists only human players (AI excluded).
        // After the engine removes the leaving player,
        // we need a small delay to ensure the array updates.
        [] spawn {
            sleep 1;   // short delay so allPlayers updates

            if ((count allPlayers) == 0) then {
                diag_log "No players left, ending game.";

                // Change game status to 'waiting'
                missionNamespace setVariable ["game_status", "waiting"];
		        diag_log "Game-status updated to 'waiting'.";
                
                // End the mission on the server; everyone will see debriefing.
                // TODO: add end game function
            };
        };

        // Return false to let the engine perform its normal cleanup
        false
    }];
};   
