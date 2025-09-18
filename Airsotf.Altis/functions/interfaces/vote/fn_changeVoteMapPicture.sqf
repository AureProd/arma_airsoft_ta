/*
    IHM_fnc_changeVoteMapPicture.sqf
    Description:
        Change selected map picture in vote IHM.
    Params:
        _selectedGameMapKey (STRING) - Selected vote map to print picture in IHM.
*/

#define LOG_PREFIX "[VoteIHM]"
#define CAM_X_DELTA 100
#define CAM_Y_DELTA 100
#define CAM_Z_DELTA 100
#define SELECTED_MAP_PICTURE_IDD 1

if (!hasInterface) exitWith {};  // Only on client side

params ["_selectedGameMapKey"];

if (isNil "voteMapPictureCam") exitWith {
    diag_log format ["%1 ERROR: Vote map picture cam not defined.", LOG_PREFIX];
};

private _gameMaps = call Data_fnc_getGameMaps;
        
private _selectedMap = _gameMaps get _selectedGameMapKey;

private _mapPicture = _selectedMap get "vote_map_picture";
private _mapPosition = _selectedMap get "position";

private _selectedMapPicture = uiNamespace getVariable "selected_map_picture";
private _selectedMapPictureCtrl = _selectedMapPicture displayCtrl SELECTED_MAP_PICTURE_IDD;

if (_mapPicture == "") then {
    _selectedMapPictureCtrl ctrlShow false;

    // No map picture use cam
    // Move camera to pos
    voteMapPictureCam camPreparePos [(_mapPosition select 0) - CAM_X_DELTA,(_mapPosition select 1) - CAM_Y_DELTA, CAM_Z_DELTA];
    voteMapPictureCam camPrepareTarget _mapPosition;
    voteMapPictureCam camCommitPrepared 0;
} else {
    // Print map picture
    _selectedMapPictureCtrl ctrlSetText _mapPicture;
    _selectedMapPictureCtrl ctrlShow true;
};