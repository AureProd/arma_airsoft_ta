/*
    Cron_fnc_cleanupBodies.sqf
    Description:
        Continuously removes all dead bodies from the mission.
        Runs automatically via postInit as a cron task.
*/

// CONSTANTS DEFINITION
#define LOOP_INTERVAL 0.2 // seconds to wait between iterations

// Run only on server (so deletion is authoritative)
if (!isServer) exitWith {};

// Spawn a loop to delete all dead bodies periodically
[] spawn {
    while {true} do {
        {
            deleteVehicle _x;
        } foreach allDead;  // get all dead units

        sleep LOOP_INTERVAL;  // wait X seconds between iterations
    };
};