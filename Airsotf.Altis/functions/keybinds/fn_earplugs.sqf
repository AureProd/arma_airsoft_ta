/*
    Keys_fnc_earplugs.sqf
    Description:
        Adds a key handler (F1 = DIK 59) to toggle earplug sound levels.
        Refactored with constants and cleaner structure.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[EARPLUGS]"
#define EARPLUGS_KEY 59
#define EARPLUGS_VAR "earplugs"
#define FADE_DURATION 1
#define TEXT_DISPLAY_TIME 7
#define TEXT_FADE_TIME 0.7
#define TEXT_COLOR "#F6A821"

if (!hasInterface) exitWith {};

// Initialize earplugs system
player setVariable [EARPLUGS_VAR, 0];

[] spawn {
    waitUntil { !isNull findDisplay 46 };

    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        params ["_display", "_keyCode"];
        
        if (_keyCode != EARPLUGS_KEY) exitWith {};

        private _currentLevel = player getVariable [EARPLUGS_VAR, 0];
        private _newLevel = 0;
        private _soundVolume = 1;
        private _displayText = "";

        // Determine next level in cycle
        switch (_currentLevel) do {
            case 0: {
                _newLevel = 95;
                _soundVolume = 0.01;
                _displayText = "Casque éteint";
            };
            case 95: {
                _newLevel = 90;
                _soundVolume = 0.1;
                _displayText = "90% plus haut";
            };
            case 90: {
                _newLevel = 80;
                _soundVolume = 0.2;
                _displayText = "80% plus haut";
            };
            case 80: {
                _newLevel = 50;
                _soundVolume = 0.5;
                _displayText = "50% plus haut";
            };
            case 50: {
                _newLevel = 30;
                _soundVolume = 0.7;
                _displayText = "30% plus haut";
            };
            case 30: {
                _newLevel = 0;
                _soundVolume = 1;
                _displayText = "Casque allumé!";
            };
        };

        // Apply changes
        player setVariable [EARPLUGS_VAR, _newLevel];
        FADE_DURATION fadeSound _soundVolume;

        // Log the change
        diag_log format ["%1 Earplugs level changed from %2 to %3 (volume: %4)", LOG_PREFIX, _currentLevel, _newLevel, _soundVolume];

        // Display notification
        [
            parseText format [
                "<t align='center' shadow='2' size='4'><t color='%1'>%2</t></t><br/>",
                TEXT_COLOR,
                _displayText
            ],
            [0, 0.7, 1, 0.5],
            nil,
            TEXT_DISPLAY_TIME,
            TEXT_FADE_TIME,
            0
        ] spawn BIS_fnc_textTiles;
    }];
};