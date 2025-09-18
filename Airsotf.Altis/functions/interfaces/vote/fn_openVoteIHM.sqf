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
private _voteButton = _display displayCtrl VOTE_BUTTON_IDD;
lbClear _listBox;

private _gameMaps = call Data_fnc_getGameMaps;
private _gameMapsKeys = keys _gameMaps;

{
    private _map = _gameMaps get _x;
    private _mapName = _map get "name";

    private _idx = _listBox lbAdd _mapName;

    _listbox lbSetData [_idx, _x];
} forEach _gameMapsKeys;

_listBox lbSetCurSel 0;

private _firstMapKey = _gameMapsKeys select 0;

[_firstMapKey] call IHM_fnc_changeVoteMapPicture;

_listBox ctrlAddEventHandler [
    "lbSelChanged",
    {
        params ["_control", "_lbCurSel"];

        private _gameMaps = call Data_fnc_getGameMaps;
        
        private _key = lbCurSel _control;
        private _mapKey = _control lbData _key;

        [_mapKey] call IHM_fnc_changeVoteMapPicture;
    }
];

_voteButton ctrlAddEventHandler [
    "buttonClick",
    {
        params ["_control"];

        private _gameMaps = call Data_fnc_getGameMaps;

        private _display = findDisplay VOTE_IHM_IDD;
        private _listBox = _display displayCtrl MAPS_LIST_IDD;

        private _key = lbCurSel _listBox;
        private _mapKey = _listBox lbData _key;

        private _map = _gameMaps get _mapKey;

        private _mapID = _map get "id";
        private _mapName = _map get "name";

        [_mapID] call Vote_fnc_clientVoteForMap;

        closeDialog 0;
        
        hint format ["Vous venez de voter pour la map '%1' !", _mapName];

        [_mapKey] call IHM_fnc_changeVoteMapPicture;
    }
];