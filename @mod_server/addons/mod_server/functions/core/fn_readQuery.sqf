/*
    DB_fn_readQuery.sqf
    Description:
        Executes a SELECT query via extDB3 and returns the result set.
    Params:
        _query (STRING) - MySQL SELECT query
        _multiarr (BOOL) - true = return full result array,
                           false = only the first row (default)
    Returns:
        ARRAY - parsed rows (or [] if none / error)
*/

params [
    "_query",
    ["_multiarr", false]
];

// --- Common code: send extDB3 request in mode 2 (read) ---
[_query, 2, _multiarr] call DB_fnc_asyncQuery;
