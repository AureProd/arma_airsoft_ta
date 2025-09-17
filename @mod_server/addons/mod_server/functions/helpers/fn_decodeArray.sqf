/*
    DB_fn_decodeArray.sqf
    Description:
        Reverses DB_fnc_escapeArray
        Converts a stringified, back-tick-escaped array back into a real SQF array.
    Params:
        _encoded (STRING) – Escaped array string (e.g. "[`John`]")
    Returns:
        ARRAY – The restored SQF array.
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[DB_ARRAY_DECODER]"

params ["_encoded"];

// Empty input → empty array
if (_encoded isEqualTo "") exitWith { [] };

// Convert to char array
private _chars = toArray _encoded;

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
    diag_log format ["%1 ERROR: Failed to decode encoded array '%2'.", LOG_PREFIX, _encoded];
    _result = [];
};

_result
