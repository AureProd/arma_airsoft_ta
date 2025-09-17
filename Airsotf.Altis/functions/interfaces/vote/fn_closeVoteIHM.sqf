/*
    IHM_fnc_closeVoteIHM.sqf
    Description:
        Close vote interface for player on client side.
*/

#define BLACK_SCREEN_IMAGE "pictures\vote\black_screen.jpg"

if (!hasInterface) exitWith {};  // Only on client side

// stop vote music
playMusic "";

closeDialog 0;

private _selectedMapPicture = uiNamespace getVariable "selected_map_picture";

_mapPictureCtrl ctrlSetText BLACK_SCREEN_IMAGE;
_selectedMapPicture ctrlShow true;

// Destroy cam
if (!isNil "voteMapPictureCam") then 
{
	voteMapPictureCam cameraEffect ["TERMINATE", "BACK"];
	camDestroy voteMapPictureCam;
	player switchCamera "INTERNAL";

    voteMapPictureCam = nil
};
