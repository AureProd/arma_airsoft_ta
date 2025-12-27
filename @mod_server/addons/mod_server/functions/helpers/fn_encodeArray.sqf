/*
    DB_fn_encodeArray.sqf
    Description:
        Escapes an SQF array so it can be safely inserted into a MySQL
        field (e.g. via extDB3) without breaking the SQL syntax.
        Notes:
            • Only double quotes inside the brackets are replaced.
            • Brackets themselves and the outer quotes stay untouched.
            • Returns "[]" if an empty or invalid array is given.
    Params:
        _array (ARRAY) - Input array to escape.
    Return:
        STRING - Escaped array string, with internal quotes replaced by back-ticks (`).
*/

params ["_array"];

// Convert the array to a string, then to an array of char codes
private _chars = toArray str _array;
private _last  = (count _chars) - 1;

// Replace every inner double-quote (ASCII 34) with back-tick (ASCII 96)
for "_i" from 1 to (_last - 1) do {
    if ((_chars select _i) isEqualTo 34) then {
        _chars set [_i, 96];
    };
};

// Return as a string
toString _chars
