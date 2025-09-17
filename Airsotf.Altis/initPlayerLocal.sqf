#define LOG_PREFIX "[InitPlayerLocal]"

params ["_player", "_didJIP"];

diag_log format ["%1 Executing...", LOG_PREFIX];

// Define basics vars on player and client
enableEnvironment [true, false];
setShadowDistance 500;
setViewDistance 500;
setObjectViewDistance 500;
player allowDamage false;
player enableFatigue false;
player enableStamina false;
showHUD [true, false, false, false];
showGPS false;
showCompass false;