/*
    DB_fnc_asyncQuery.sqf
    Description:
        Internal helper for extDB3 async queries.
        Notes:
            - Handles extDB3 “pending” ([3]) and multipart ([5]) responses.
            - Uses timeout & sleep to avoid busy loops.
            - Not meant to be called directly outside the DB wrappers.
    Params:
        _query (STRING) - MySQL statement
        _mode (NUMBER)  - Query mode:
            - 1 = write (INSERT / UPDATE / DELETE)
            - 2 = read  (SELECT)
        _multiarr (BOOL) - only for read (SELECT):
            - false (default) -> first row only
            - true            -> full result set
    Returns:
        Mode 1 (write) -> BOOL  - true if extDB accepted the query
        Mode 2 (read)  -> ARRAY - parsed result or [] on failure/timeout
*/

private ["_key", "_queryResult", "_return", "_loop", "_pipe"];

// Retrieve parameters
params [
    "_query",           // MySQL statement
    "_mode",            // 1 = write, 2 = read
    ["_multiarr", false]  // true = return all rows, false = first row only
];

// Prepare extDB key
_key = "extDB3" callExtension format ["%1:%2:%3", _mode, 444, _query];

// Mode 1: write query, exit immediately
if (_mode isEqualTo 1) exitWith { true };

// Compile the key for query
_key = call compile format ["%1", _key];
_key = _key select 1;

// Execute the query
_queryResult = "extDB3" callExtension format ["4:%1", _key];

// Wait for pending ([3]) response
if (_queryResult isEqualTo "[3]") then {
    for "_i" from 0 to 1 step 0 do {
        if !(_queryResult isEqualTo "[3]") exitWith {};
        uiSleep 0.05;
        _queryResult = "extDB3" callExtension format ["4:%1", _key];
    };
};

// Handle multi-part message ([5])
if (_queryResult isEqualTo "[5]") then {
    _loop = true;
    for "_i" from 0 to 1 step 0 do {
        _queryResult = "";
        for "_j" from 0 to 1 step 0 do {
            _pipe = "extDB3" callExtension format ["5:%1", _key];
            if (_pipe isEqualTo "") exitWith { _loop = false };
            _queryResult = _queryResult + _pipe;
        };
        if (!_loop) exitWith {};
    };
};

// Compile the final result
_queryResult = call compile _queryResult;

// Check for protocol errors
if ((_queryResult select 0) isEqualTo 0) exitWith {
    diag_log format ["extDB3: Protocol Error: %1", _queryResult];
    [];
};

// Extract return value
_return = _queryResult select 1;

// If not multi-array and data exists, take first row only
if (!_multiarr && count _return > 0) then {
    _return = _return select 0;
};

_return;
