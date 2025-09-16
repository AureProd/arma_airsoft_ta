/*
    DB_fn_decodeArray.sqf
    Description:
        Reverses DB_fnc_escapeArray
        Converts a stringified, back-tick-escaped array back into a real SQF array.
    Params:
        _escaped (STRING) – Escaped array string (e.g. "[`John`]")
    Returns:
        ARRAY – The restored SQF array.
*/

params ["_escaped"];

// Empty input → empty array
if (_escaped isEqualTo "") exitWith { [] };

// Convert to char array
private _chars = toArray _escaped;

// Replace back-ticks (ASCII 96) with double quotes (ASCII 34)
{
    if (_x isEqualTo 96) then {
        _chars set [_forEachIndex, 34];
    };
} forEach _chars;

// Compile back into a real SQF array
private _result;
try {
    _result = call compile toString _chars;
} catch {
    diag_log format ["DB_fnc_unescapeArray: compile failed for '%1'", _escaped];
    _result = [];
};

_result
