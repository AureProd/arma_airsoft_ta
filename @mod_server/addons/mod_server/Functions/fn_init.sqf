/*-----------------------------------------------------------------------------
	 _   _ ______ _  _______   ____
	| \ | |  ____| |/ /  __ \ / __ \
	|  \| | |__  | ' /| |__) | |  | |
	| . ` |  __| |  < |  _  /| |  | |
	| |\  | |____| . \| | \ \| |__| |
	|_| \_|______|_|\_\_|  \_\____/

-----------------------------------------------------------------------------*/

_result = "extDB3" callExtension format ["9:ADD_DATABASE:%1","Database"];
if (!(_result isEqualTo "[1]")) then {diag_log format ["Un problème avec la connexion de EXTDB a été trouver sur le format EXTDB RETURN: %1",_result]} 
else {diag_log format ["EXTDB a charger correctement. RETURN: %1",_result];};

_result = "extDB3"callExtension format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",444,"Database"];
if (!(_result isEqualTo "[1]")) then {diag_log format ["Un problème avec la connexion de EXTDB a été trouver sur le format EXTDB RETURN: %1",_result]} 
else {diag_log format ["EXTDB a charger correctement. RETURN: %1",_result];};