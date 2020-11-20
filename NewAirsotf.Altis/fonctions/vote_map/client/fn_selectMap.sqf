
[] spawn mission_fnc_welcome;

// Close dialogs
closeDialog 0;
disableSerialization;

// Create cam that hovers above arena
gg_introcam_object = "camera" camCreate (getPos player);
gg_introcam_object cameraEffect ["Internal", "Back"];
gg_introcam_object camSetFOV .65;
gg_introcam_object camSetFocus [150, 1];
gg_introcam_object camCommit 0;
sleep 0.05;
showCinemaBorder false;

// Note that I was in the map selection screen
gg_didSelectMap = 1;

// Smooth transition
50000 cutRsc ["gungame_selectmaptransition","PLAIN"];
sleep 3;

// Open map selection dialog
createDialog "gg_dialog_votemap";
waitUntil {dialog};

// Clear listbox
_listbox = (findDisplay 5100) displayCtrl 1;
lbClear _listbox;

_nbBleu = 0;

{
	if(side _x == west) then // west = bleu
	{
		_nbBleu = _nbBleu + 1;
	};
} forEach allPlayers;

// Load arenas into listbox
_arenas = getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data");
{
	if(_nbBleu == 0) then
	{
		if((_x select 3) != 2) then
		{
			_listbox lbAdd (_x select 1);
		};
	}
	else
	{
		_listbox lbAdd (_x select 1);
	};
} forEach _arenas;

// Select first map
_listbox lbSetCurSel 0;
[0, 0] spawn gg_fnc_showArena;