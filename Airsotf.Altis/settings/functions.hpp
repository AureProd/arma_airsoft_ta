class CfgFunctions 
{
    class Helpers
    {
        tag = "Helper";

        class Functions
        {
            file = "functions\helpers"; 
            class loadConfig {};
            class getPlayerByUID {};
        };
    };

    class Initialization
    {
        tag = "Init";

        class Functions
        {
            file = "functions\init"; 
            class loadConfigs {
                preInit = 1;
            };
        };
    };

    class Events
    {
        tag = "Event";

        class Handlers
        {
            file = "functions\events"; 
            class onPlayerDisconnect {
                postInit = 1;
            };            
        };
    };

    class Game
    {
        tag = "Game";

        class Handlers
        {
            file = "functions\game"; 
            class serverStartGame {};     
            class serverStopGame {};      
            class clientJoinGame {};            
        };
    };

    class Vote
    {
        tag = "Vote";

        class Handlers
        {
            file = "functions\vote"; 
            class serverStartVote {};     
            class serverStopVote {};     
            class clientJoinVote {};            
        };
    };
};
