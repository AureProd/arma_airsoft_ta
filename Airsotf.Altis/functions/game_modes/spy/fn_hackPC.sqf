/*
    SPY_fnc_hackPC.sqf
    Description:
        Hack PC on player side.
    Params:
        _pcID ("A" | "B" | "C") - PC ID to hack.
*/

playPCHackSound = {
    params [
        ["_pcID", nil, ["A", "B", "C"]]
    ]

    ["Notif", [format ["Terminal %1", _pcID], "Piratage en cours ..."]] call BIS_fnc_showNotification;
    
    playSound "USACapturedPoint";
};

params [
    ["_pcID", nil, ["A", "B", "C"]]
]

hackingInProgressOnPC set [_pcID, true];
publicVariable "hackingInProgressOnPC";

// play sound for all players and not server
[] remoteExec ["playPCHackSound", 2];

if (isNil "pourcentagePiratage") then {
    pourcentagePiratage = 0;
    publicVariable "pourcentagePiratage";
}

[] spawn
{
    while {hackingInProgressOnPC get _pcID} do 
    {
        switch (wifi) do 
        {
            case 3: 
            { 
                pourcentagePiratage = pourcentagePiratage + 0.5;
                publicVariable "pourcentagePiratage";

                50 call fn_AddCreditsSound;

                sleep 2.5;
            };
            case 2: 
            { 
                pourcentagePiratage = pourcentagePiratage + 0.5;
                publicVariable "pourcentagePiratage";

                50 call fn_AddCreditsSound;

                sleep 5;
            };
            case 1: 
            { 
                pourcentagePiratage = pourcentagePiratage + 0.5;
                publicVariable "pourcentagePiratage";

                50 call fn_AddCreditsSound;

                sleep 10;
            };
        };
    };
};

[] spawn
{
    while {hackingInProgressOnPC get _pcID} do 
    {
        if (wifi == 0 || pourcentagePiratage >= 100 || beingHit || gg_gamestatus == 0) then 
        {
            hackingInProgressOnPC set [_pcID, false];
            publicVariable "hackingInProgressOnPC";

            playMusic "";
        }
        else 
        {
            playMusic "Download";
            sleep 0.76;
        }; 
    };
};