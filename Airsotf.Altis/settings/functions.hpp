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
            class createBriefing {
                preInit = 1;
            };
        };
    };

    class Schedulers
    {
        tag = "Cron";

        class Functions
        {
            file = "functions\schedulers"; 
            class cleanupBodies {
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

    class Keybinds
    {
        tag = "Keys";

        class Handlers
        {
            file = "functions\keybinds"; 
            class earplugs {
                postInit = 1;
            };      
            class jump {
                postInit = 1;
            };       
        };
    };

    class Game
    {
        tag = "Game";

        class Functions
        {
            file = "functions\game"; 
            class serverStartGame {};     
            class serverStopGame {};      
            class clientJoinGame {};            
        };
    };


    class SpyGameMode
    {
        tag = "SPY";

        class Functions
        {
            file = "functions\game_modes\spy"; 
            class playBackgroundMusic {
                postInit = 1;
            };            
        };
    };

    class Vote
    {
        tag = "Vote";

        class Functions
        {
            file = "functions\vote"; 
            class serverStartVote {};     
            class serverStopVote {};     
            class serverFinishVote {};
            class serverPlayerVoteForMap {};     
            class clientJoinVote {};         
            class clientQuitVote {};      
            class clientVoteForMap {};          
        };
    };

    class Data
    {
        tag = "Data";

        class Functions
        {
            file = "functions\data"; 
            class getGameMaps {};  
            class getGameModes {};  
            class getGameStatus {};  
            class setGameStatus {};           
        };
    };

    class Interfaces
    {
        tag = "IHM";

        class Vote
        {
            file = "functions\interfaces\vote"; 
            class openVoteIHM {};  
            class closeVoteIHM {};    
            class changeVoteMapPicture {};    
        };

        class Loading
        {
            file = "functions\interfaces\loading"; 
        };
    };
};
