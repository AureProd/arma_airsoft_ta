
class CfgMusic 
{
	tracks[] = {};
	class GermanWin {
        name = "german_win";
        sound[] = {"sounds\music\german_win.wav", 2.5, 1};
    };
	class USAWin {
        name = "usa_win";
        sound[] = {"sounds\music\usa_win.ogg", 0.25, 1};
    };
	class Download {
        name = "download";
        sound[] = {"sounds\music\download.ogg", 4, 1};
    };
    class Environment {
        name = "environment";
        sound[] = {"sounds\music\environnment.ogg", 0.4, 1};
    };
};

class CfgSounds 
{
	sounds[] = {}; 
	class Hit0 {
        name = "hit_0";
        sound[] = {"sounds\hits\hit_0.ogg", 10, 1};
        titles[] = {};
    };
    class Hit1 {
        name = "hit_1";
        sound[] = {"sounds\hits\hit_1.ogg", 10, 1};
        titles[] = {};
    };
    class Hit2 {
        name = "hit_2";
        sound[] = {"sounds\hits\hit_2.ogg", 10, 1};
        titles[] = {};
    };
    class Hit3 {
        name = "hit_3";
        sound[] = {"sounds\hits\hit_3.ogg", 10, 1};
        titles[] = {};
    };
    class Hit4 {
        name = "hit_4";
        sound[] = {"sounds\hits\hit_4.ogg", 10, 1};
        titles[] = {};
    };
    class Hit5 {
        name = "hit_5";
        sound[] = {"sounds\hits\hit_5.ogg", 10, 1};
        titles[] = {};
    };
    class Hit6 {
        name = "hit_6";
        sound[] = {"sounds\hits\hit_6.ogg", 10, 1};
        titles[] = {};
    };


    class IEM {
        name = "iem";
        sound[] = {"@A3\Missions_F_Bootcamp\data\sounds\vr_shutdown", 15, 1};
        titles[] = {};
    };

	class Jump {
        name = "jump";
        sound[] = {"sounds\player\jump.wav", 10, 1};
        titles[] = {};
    };
	class Piss {
        name = "piss";
        sound[] = {"sounds\player\piss.ogg", 1, 1};
        titles[] = {};
    };
    class Drink {
        name = "drink";
        sound[] = {"sounds\player\drink.ogg", 1000, 1};
        titles[] = {};
    };
    class NVG {
        name = "nvg";
        sound[] = {"sounds\player\nvg.ogg", 2, 1};
        titles[] = {};
    };
    class FastHeart {
        name = "fast_heart";
        sound[] = {"sounds\player\fast_heart.ogg", 3, 1};
        titles[] = {};
    };
    class SlowHeart {
        name = "slow_heart";
        sound[] = {"sounds\player\slow_heart.ogg", 3, 1};
        titles[] = {};
    };

	class USACapturedPoint {
        name = "usa_captured_point";
        sound[] = {"sounds\game\usa_captured_point.wav", 3, 1};
        titles[] = {};
    };
	class GermanCapturedPoint {
        name = "german_captured_point";
        sound[] = {"sounds\game\german_captured_point.wav", 3, 1};
        titles[] = {};
    };
	class Purchase {
        name = "purchase";
        sound[] = {"sounds\game\purchase.ogg", 2, 1};
        titles[] = {};
    };
	class Countdown {
        name = "countdown";
        sound[] = {"sounds\game\countdown.ogg", 3, 1};
        titles[] = {};
    };
	class Welcome {
        name = "welcome";
        sound[] = {"sounds\game\welcome.ogg", 1, 1};
        titles[] = {};
    };
	class GameStart {
        name = "game_start";
        sound[] = {"sounds\game\game_start.wav", 3, 1};
        titles[] = {};
    };
};