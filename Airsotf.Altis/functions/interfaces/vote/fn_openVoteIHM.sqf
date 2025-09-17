/*
    IHM_fnc_openVoteIHM.sqf
    Description:
        Open vote interface for player on client side.
*/

#define VOTE_IHM_CLASS "VoteIHM"
#define VOTE_IHM_IDD 5001
#define MAPS_LIST_IDD 1
#define SELECTED_MAP_PICTURE_IDD 1
#define VOTE_BUTTON_IDD 2
#define CAM_X_DELTA 100
#define CAM_Y_DELTA 100
#define CAM_Z_DELTA 100

if (!hasInterface) exitWith {};  // Only on client side

closeDialog 0;
disableSerialization;

// Create cam to see maps
voteMapPictureCam = "camera" camCreate (getPos player);
voteMapPictureCam cameraEffect ["Internal", "Back"];
voteMapPictureCam camSetFOV .65;
voteMapPictureCam camSetFocus [150, 1];
voteMapPictureCam camCommit 0;

[] spawn {
    // Remove cinematiques borders in cam with sleep to wait cam is ready
    sleep 0.05;
    showCinemaBorder false;
};

cutRsc ["SelectedMapPicture", "PLAIN"];

createDialog VOTE_IHM_CLASS;
waitUntil {dialog};

// Play vote music on player client side durring vote
playMusic "Vote";

private _display = findDisplay VOTE_IHM_IDD;

private _listBox = _display displayCtrl MAPS_LIST_IDD;
lbClear _listBox;

private _gameMaps = call Data_fnc_getGameMaps;

{
    private _map = _gameMaps get _x;
    private _mapName = _map get "name";

    private _idx = _listBox lbAdd _mapName;

    _listbox lbSetData [_idx, _map];
} forEach (keys _gameMaps);

_listBox lbSetCurSel 0;

_listBox ctrlAddEventHandler [
    "onLBSelChanged",
    {
        params ["_control", "_lbCurSel"];
        
        private _key = lbCurSel _control;
        private _map = _control lbData _key;

        private _mapPicture = _map get "vote_map_picture";
        private _mapPosition = _map get "position";

        private _selectedMapPicture = uiNamespace getVariable "selected_map_picture";

        if (_mapPicture == "") then {
            _selectedMapPicture ctrlShow false;

            // No map picture use cam
            // Move camera to pos
            voteMapPictureCam camPreparePos [(_mapPosition select 0) - CAM_X_DELTA,(_mapPosition select 1) - CAM_Y_DELTA, CAM_Z_DELTA];
            voteMapPictureCam camPrepareTarget _mapPosition;
            voteMapPictureCam camCommitPrepared 0;
        } else {
            // Print map picture
            private _mapPictureCtrl = _selectedMapPicture displayCtrl SELECTED_MAP_PICTURE_IDD;

            _mapPictureCtrl ctrlSetText _mapPicture;
            _selectedMapPicture ctrlShow true;
        };
    }
];

_btn ctrlAddEventHandler [
    "onButtonClick",
    {
        params ["_control"];

        private _display = findDisplay VOTE_IHM_IDD;
        private _listBox = _display displayCtrl MAPS_LIST_IDD;

        private _key = lbCurSel _listBox;
        private _map = _listBox lbData _key;
        private _mapID = _map get "id";
        private _mapName = _map get "name";
        private _mapPicture = _map get "vote_map_picture";
        private _mapPosition = _map get "position";

        [_mapID] call Vote_fnc_clientVoteForMap;

        closeDialog 0;
        
        hint format ["Vous venez de voter pour la map '%1' !", _mapName];

        private _selectedMapPicture = uiNamespace getVariable "selected_map_picture";

        if (_mapPicture == "") then {
            _selectedMapPicture ctrlShow false;

            // No map picture use cam
            // Move camera to pos
            voteMapPictureCam camPreparePos [(_mapPosition select 0) - CAM_X_DELTA,(_mapPosition select 1) - CAM_Y_DELTA, CAM_Z_DELTA];
            voteMapPictureCam camPrepareTarget _mapPosition;
            voteMapPictureCam camCommitPrepared 0;
        } else {
            // Print map picture
            private _mapPictureCtrl = _selectedMapPicture displayCtrl SELECTED_MAP_PICTURE_IDD;

            _mapPictureCtrl ctrlSetText _mapPicture;
            _selectedMapPicture ctrlShow true;
        };
    }
];