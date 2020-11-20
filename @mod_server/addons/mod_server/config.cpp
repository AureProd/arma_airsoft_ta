
class DefaultEventhandlers;
class CfgPatches
{
    class 1700_server 
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        fileName = "mod_server.pbo";
        author = "AureProd";
    };
};

class CfgFunctions 
{
    class MySQL_Database 
    {
        tag = "db";
        class MySQL
        {
            file = "\mod_server\Functions";
            class init{};
            class asyncCall{};
            class isDejaConnecte {};
            class sauvegardeBdd {};
        };
        class convertions
        {
            file = "\mod_server\Functions\convert";
            class mresArray {}; // _array = [_array] call db_fnc_mresArray;
            class mresToArray {}; // _array = [_array] call db_fnc_mresToArray;
        };
    };
};