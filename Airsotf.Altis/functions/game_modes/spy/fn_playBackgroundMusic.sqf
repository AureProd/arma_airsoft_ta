/*
    SPY_fnc_playBackgroundMusic.sqf
    Description:
        Play spying game mode background music on player side.
*/

// --- START ---
// If already started do not restart background music
if (!isNil "JB_musicHandle") exitWith {};

spyBackgroundMusicStoped = false;
spyBackgroundMusicHandle = [] spawn {
    while { !spyBackgroundMusicStoped } do {
        playMusic "BackgroundSpyMusic";
        sleep 130;
    };
};
