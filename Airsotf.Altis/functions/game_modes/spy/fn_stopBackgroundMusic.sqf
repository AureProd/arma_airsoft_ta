/*
    SPY_fnc_stopBackgroundMusic.sqf
    Description:
        Stop spying game mode background music on player side.
*/

// --- STOP ---
spyBackgroundMusicStoped = true;
if (!isNil "spyBackgroundMusicHandle") then {
    terminate spyBackgroundMusicHandle;
    spyBackgroundMusicHandle = nil;
};

// Stop music
playMusic "";
