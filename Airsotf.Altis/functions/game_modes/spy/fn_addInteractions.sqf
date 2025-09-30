/*
    SPY_fnc_addInteractions.sqf
    Description:
        Add spying game mode add actions interactions on player side.
*/

#define LOG_PREFIX "[SPYAddInteraction]"

spyAddedInteractions = [];

hackingInProgressOnPC = createHashMap;
hackingInProgressOnPC set ["A", false];
hackingInProgressOnPC set ["B", false];
hackingInProgressOnPC set ["C", false];
publicVariable "hackingInProgressOnPC";

_addInteraction = {
    /*  
        _addInteraction
        Usage:
            [_object, _text, _callback, _condition] call _addInteraction;
        Description:
            Player join game on client side.
        Params:
            _object (OBJECT) - Object to add interaction.
            _text (STRING) - Printed text.
            _callback (STRING|CODE) - Callback code to execute on interaction.
            _condition (STRING) : Interaction seen condition (default to 'true')
    */
    params [
        ["_object", objNull, [objNull]],
        ["_text",  "",      [""]],
        ["_callback",   "",      ["",{}]],
        ["_condition", "true", [""]]
    ];

    if (isNull _object) exitWith {
        diag_log format ["%1 ERROR: _object pass in _addInteraction function is null.", LOG_PREFIX];
        -1
    };

    private _handle = _object addAction [
        _text,
        _callback,
        [],            // arguments
        1.5,           // priorité
        true,          // showWindow
        true,          // hideOnUse
        "",            // shortcut
        _condition
    ];

    spyAddedInteractions pushBack [_object, _handle];
    _handle
};



if(side player == west) then
{
    [ 
        ordinateurs select 0,
        "Pirater le Terminal A",
        "call fn_pirate_A",
        "!(hackingInProgressOnPC get 'A') && !(hackingInProgressOnPC get 'B') && !(hackingInProgressOnPC get 'C') && (currentWeapon player) isEqualTo 'Laserdesignator'"
    ] call SPY_fnc_addInteraction;


    (ordinateurs select 0) addAction ["Pirater le Terminal A", "call fn_pirate_A", [], 1.5, true, true, "", "cpAValue != -1 && cpBValue != -1 && cpCValue != -1 && (currentWeapon player) isEqualTo 'Laserdesignator'"];
	(ordinateurs select 1) addAction ["Pirater le Terminal B", "call fn_pirate_B", [], 1.5, true, true, "", "cpAValue != -1 && cpBValue != -1 && cpCValue != -1 && (currentWeapon player) isEqualTo 'Laserdesignator'"];
	(ordinateurs select 2) addAction ["Pirater le Terminal C", "call fn_pirate_C", [], 1.5, true, true, "", "cpAValue != -1 && cpBValue != -1 && cpCValue != -1 && (currentWeapon player) isEqualTo 'Laserdesignator'"];

	(PNJ select 0) addAction ["<t color='#1d24e0'>Menu</t>", "1 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 0) <= 10"];

	(PNJ select 1) addAction ["<t color='#1d24e0'>Menu</t>", "1 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 1) <= 10"];

	(findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1 == 219) && (bombeIEM_pourcentage == 100) && !beingHit) then {call fn_bombeIEM}"]; // P

	(findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 49) then {call fn_nvg}"]; // N
}
else
{
	(PNJ select 0) addAction ["<t color='#a62802'>Menu</t>", "2 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 0) <= 10"];
	
	(PNJ select 1) addAction ["<t color='#a62802'>Menu</t>", "2 call fn_menu_bis", [], 1.5, true, true, "", "player distance (PNJ select 1) <= 10"];
    
	(pancartes select 0) addAction ["<t color='#a62802'>Menu Armes</t>", "1 call fn_menu", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
	(pancartes select 0) addAction ["<t color='#a62802'>Menu Général</t>", "0 call fn_menu_bis", [], 1.5, true, true, "", "player distance (pancartes select 0) <= 10"];
};