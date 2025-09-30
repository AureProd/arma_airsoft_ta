/*
    Game_fnc_clientGameCountDown.sqf
    Description:
        Play start game count down to join game player on client side.
*/

[] spawn {
    // Disable player input
    disableUserInput true;

    // Countdown
    [
        parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>5</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
    ] spawn BIS_fnc_textTiles;
    playSound "Countdown";

    sleep 2;

    [
        parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>4</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
    ] spawn BIS_fnc_textTiles;
    playSound "Countdown";

    sleep 2;

    [
        parseText "<t align='center' shadow='2' size='4'><t color='#9221f6'>3</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
    ] spawn BIS_fnc_textTiles;
    playSound "Countdown";

    sleep 2;
    [
        parseText "<t align='center' shadow='2' size='4'><t color='#21c0f6'>2</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
    ] spawn BIS_fnc_textTiles;
    playSound "Countdown";

    sleep 2;

    [
        parseText "<t align='center' shadow='2' size='4'><t color='#21f632'>1</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
    ] spawn BIS_fnc_textTiles;
    playSound "Countdown";

    sleep 2;
    [
        parseText "<t align='center' shadow='4' size='6'><t color='#f62148'>Play</t></t><br/>", [0,0.7,1,0.5], nil, 7, 0.7, 0
    ] spawn BIS_fnc_textTiles;
    playSound "GameStart";

    disableUserInput false;
};