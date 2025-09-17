/*
    Init_fnc_createBriefing.sqf
    Description:
        Creates briefing subjects and records to show the team and available game modes.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[BRIEFING]"
#define TA_BRIEF_PART "TA"
#define GAMES_BRIEF_PART "Games"

if (!hasInterface) exitWith {};  // Only on client side

// Exit if diary already exists to avoid duplicates
if (player diarySubjectExists "rules") exitWith {};

// --- Create diary subjects ---
player createDiarySubject [TA_BRIEF_PART, "Tactique Airsoft"];
player createDiarySubject [GAMES_BRIEF_PART, "Available Game Modes"];

// --- Create diary records for team information ---
player createDiaryRecord [
    TA_BRIEF_PART,
    [
        "Our Team",
        "
        <br/>
        Founders:<br/>
        - Founder: Mysterfreez<br/>
        - Developer: AureProd<br/>
        - Graphic Designer: Ghis<br/><br/>
        Staff:<br/>
        - Admin: Dracoo<br/>
        - Manager: Reinhard<br/><br/>
        "
    ]
];

player createDiaryRecord [
    TA_BRIEF_PART,
    [
        "Site & Forums",
        "
        <img image='TA-image\\TA-logo\\TA - logo15.paa' width='300' height='100'/><br/>
        Tactique Airsoft Community:<br/><br/>
        Discord:<br/>
        - https://discord.gg/Aq7vaJH<br/><br/>
        Steam Group:<br/>
        - https://steamcommunity.com/groups/tactique-airsoft-arma-3<br/><br/>
        Twitter:<br/>
        - https://twitter.com/3Tactique<br/><br/>
        Website: Under development<br/><br/>
        Join us!<br/><br/>
        "
    ]
];

// --- Create diary records for game modes ---
player createDiaryRecord [
    GAMES_BRIEF_PART,
    [
        "Game Mode: Hacking",
        "
        <br/>
        Two teams on a nighttime map.<br/>
        Look for vendors on the map for both teams.<br/><br/>
        Blufor team must hack 3 terminals using a laser designator.<br/>
        Use mobility and night vision to avoid getting hit by Redfor.<br/>
        Only 30 lives for the whole team.<br/>
        Each player has a pistol with 25 bullets for the whole match.<br/><br/>
        Redfor has unlimited bullets but is slow.<br/>
        Use flashlights and a heartbeat skill to detect enemies.<br/>
        Prevent the enemy from hacking the terminals.<br/><br/>
        Good luck, soldier!<br/><br/>
        "
    ]
];

player createDiaryRecord [
    GAMES_BRIEF_PART,
    [
        "VIP Escort",
        "
        <br/>
        - For Americans: protect the VIP from Germans.<br/>
        - Exfiltrate the VIP if you are Americans.<br/>
        - Kill the VIP if you are Germans.<br/><br/>
        Good luck, soldier!<br/><br/>
        "
    ]
];

player createDiaryRecord [
    GAMES_BRIEF_PART,
    [
        "Game Mode: Capture the Flags",
        "
        <br/>
        Map has 3 flags to capture.<br/>
        Each team earns credits for capturing flags.<br/>
        Capturing a flag reduces the opposing team's tickets.<br/>
        Objective: reduce enemy tickets to 0.<br/><br/>
        Good luck, soldier!<br/><br/>
        "
    ]
];

diag_log format ["%1 Briefing created.", LOG_PREFIX];
