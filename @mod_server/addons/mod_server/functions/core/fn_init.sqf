/*
    DB_fn_init.sqf
    Description:
        Initialize and open connection to MySQL database. 
*/

_result = "extDB3" callExtension format ["9:ADD_DATABASE:%1","Database"];
if (!(_result isEqualTo "[1]")) then {
    diag_log format ["Unexpected error with EXTDB loading: %1",_result];
} 
else {
    diag_log "Database client successfully initialized.";
};

_result = "extDB3"callExtension format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",444,"Database"];
if (!(_result isEqualTo "[1]")) then {
    diag_log format ["Unexpected error with EXTDB loading: %1",_result];
} 
else {
    diag_log "Database client successfully connected.";
};