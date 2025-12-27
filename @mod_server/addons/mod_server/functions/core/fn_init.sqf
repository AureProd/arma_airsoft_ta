/*
    DB_fn_init.sqf
    Description:
        Initialize and open connection to MySQL database. 
*/

// CONSTANTS DEFINITION
#define LOG_PREFIX "[DB]"

_result = "extDB3" callExtension format ["9:ADD_DATABASE:%1", "Database"];
if (!(_result isEqualTo "[1]")) then {
    diag_log format ["%1 ERROR: Unexpected error with EXTDB loading: %2", LOG_PREFIX,_result];
} 
else {
    diag_log format ["%1 Database client initialized.", LOG_PREFIX];
};

_result = "extDB3"callExtension format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2", 444, "Database"];
if (!(_result isEqualTo "[1]")) then {
    diag_log format ["%1 ERROR: Unexpected error with EXTDB loading: %2", LOG_PREFIX, _result];
} 
else {
    diag_log format ["%1 Database client connected.", LOG_PREFIX];
};