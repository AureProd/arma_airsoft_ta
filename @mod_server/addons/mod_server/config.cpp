
class DefaultEventhandlers;
class CfgPatches
{
    class DBClient 
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
    class Database 
    {
        tag = "DB";

        class Core
        {
            file = "\mod_server\functions\core";
            class init{};
            class asyncQuery{};
            class readQuery{};
            class writeQuery{};
        };

        class Services
        {
            file = "\mod_server\functions\services";
            class fetchPlayerData {};
            class flushPlayerData {};
        };

        class Helpers
        {
            file = "\mod_server\functions\helpers";
            class encodeArray {}; 
            class decodeArray {};
        };
    };
};