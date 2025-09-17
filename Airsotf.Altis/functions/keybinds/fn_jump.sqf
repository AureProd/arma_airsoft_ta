/*
    Keys_fnc_jump.sqf
    Description:
        Handles double-tap jump animation directly in KeyDown event.
        Clean, simplified, fully client-local.
*/

// CONSTANTS DEFINITION
#define JUMP_SPACE_KEY 57
#define JUMP_HEIGHT 4.5
#define JUMP_FORWARD_SPEED 0.4
#define JUMP_SOUND "jump"
#define JUMP_ANIMATION "AovrPercMrunSrasWrflDf"
#define JUMP_COOLDOWN 3
#define JUMP_KEY_DEBOUNCE 0.3
#define JUMP_AVAILABLE_VAR "jump_available"
#define JUMP_COOLDOWN_VAR "jump_couldown"
#define JUMP_FIRE_VAR "MIS_unitDisableFire"

if (!hasInterface) exitWith {};  // ensure player exists

[] spawn {
    waitUntil { !isNull findDisplay 46 }; // wait for main display

    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        params ["_display", "_keyCode"];

        // Only process SPACE key
        if (_keyCode != JUMP_SPACE_KEY) exitWith {};

        // Check key debounce
        if (!(player getVariable [JUMP_AVAILABLE_VAR, true])) exitWith {};

        // Set debounce and schedule reset
        player setVariable [JUMP_AVAILABLE_VAR, false];
        [] spawn { 
            sleep JUMP_KEY_DEBOUNCE; 
            player setVariable [JUMP_AVAILABLE_VAR, true]; 
        };

        // Validate jump conditions
        if (
            (player != vehicle player) 
            || !(player getVariable [JUMP_COOLDOWN_VAR, true]) 
            || !isTouchingGround player
        ) exitWith {};

        // Execute jump sequence
        playSound JUMP_SOUND;
        
        player setVariable [JUMP_COOLDOWN_VAR, false];
        player setVariable [JUMP_FIRE_VAR, true];

        // Calculate and apply jump physics
        private _currentVel = velocity player;
        private _playerDir = direction player;

        player setVelocity [
            (_currentVel select 0) + (sin _playerDir * JUMP_FORWARD_SPEED),
            (_currentVel select 1) + (cos _playerDir * JUMP_FORWARD_SPEED),
            (_currentVel select 2) + JUMP_HEIGHT
        ];

        // Play jump animation
        player switchMove JUMP_ANIMATION;

        // Restore shooting immediately
        player setVariable [JUMP_FIRE_VAR, false];

        // Schedule jump cooldown reset
        [] spawn { 
            sleep JUMP_COOLDOWN; 
            player setVariable [JUMP_COOLDOWN_VAR, true]; 
        };
    }];
};
