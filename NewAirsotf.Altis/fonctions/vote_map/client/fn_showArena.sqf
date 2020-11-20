
_index = _this select 1;

// Get arena info
_arenaToLoad = getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data") select _index;

// Transition
//5000 cutRsc ["gungame_spawntransition","PLAIN"];
//sleep 1;

// Move camera to pos
gg_introcam_object camPreparePos [((_arenaToLoad select 0) select 0) - 100,((_arenaToLoad select 0) select 1) - 100, 100];
gg_introcam_object camPrepareTarget (_arenaToLoad select 0);
gg_introcam_object camCommitPrepared 0;

// _arenaToLoad select 10

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

switch (_arenaToLoad select 3) do 
{
    case 1:
    { 
        if ((_arenaToLoad select 10) == 1) then 
        {
            ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow true;

            19 cutRsc ["vote_map_photo","PLAIN"];

            (
                (
                    uiNamespace getVariable "vote_map_photo"
                )
                displayCtrl 1200
            )
            ctrlSetText (_arenaToLoad select 11);
        }
        else
        {
            ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow false;
        };
    };
    case 3:
    { 
        if ((_arenaToLoad select 10) == 1) then 
        {
            ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow true;

            19 cutRsc ["vote_map_photo","PLAIN"];

            (
                (
                    uiNamespace getVariable "vote_map_photo"
                )
                displayCtrl 1200
            )
            ctrlSetText (_arenaToLoad select 11);
        }
        else
        {
            ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow false;
        };
    };
    case 2:
    { 
        if ((_arenaToLoad select 7) == 1) then 
        {
            ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow true;

            19 cutRsc ["vote_map_photo","PLAIN"];

            (
                (
                    uiNamespace getVariable "vote_map_photo"
                )
                displayCtrl 1200
            )
            ctrlSetText (_arenaToLoad select 8);
        }
        else
        {
            ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow false;
        };
    };
    default
    {
        ((uiNamespace getVariable "vote_map_photo") displayCtrl 1200) ctrlShow false;
    };
};
