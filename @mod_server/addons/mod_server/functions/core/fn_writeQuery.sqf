/*
    DB_fn_writeQuery.sqf
    Description:
        Executes an INSERT/UPDATE/DELETE query via extDB3.
    Params:
        _query (STRING) - MySQL write query
    Returns:
        BOOL - true if extDB accepted the query
*/

params ["_query"];

// --- Common code: send extDB3 request in mode 1 (write) ---
[_query, 1, false] call DB_fnc_asyncQuery;
