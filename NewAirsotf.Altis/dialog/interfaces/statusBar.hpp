
class osefStatusBar 
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = 0 * safezoneW + safezoneX;
			y = 0.97 * safezoneH + safezoneY;
			w = safezoneW;
			h = safezoneH;
			shadow = 1;
			colorBackground[] = { 1, 0.3, 0, 0.0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.035;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="center";
				color = "#FFFFF";
			};
		};
	};
};

class osefStatusBar2 
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar2', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar2', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar2', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = safezoneW;
			h = safezoneH;
			shadow = 0.2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.095;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="center";
				color = "#FFFFF";
			};
		};
	};
};

class osefStatusBar3 
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar3', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar3', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar3', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = 0.47 * safezoneW + safezoneX;
			y = 0.90 * safezoneH + safezoneY;
			w = safezoneW;
			h = safezoneH;
			shadow = 0.2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.15;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="center";
				color = "#FFFFF";
			};
		};
	};
};

class Ableu 
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['Ableu', _this select 0]";
	onUnload = "uiNamespace setVariable ['Ableu', objNull]";
	onDestroy = "uiNamespace setVariable ['Ableu', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1998;
			x = safezoneX + safezoneW - 2.5;
			y = safezoneY + safezoneH - 1.6;
			w = safezoneW - 1;
			h = safezoneH - 0.10;
			shadow = 0.2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.095;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="right";
				color = "#FFFFF";
			};
		};
	};
};

class dateheure 
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['dateheure', _this select 0]";
	onUnload = "uiNamespace setVariable ['dateheure', objNull]";
	onDestroy = "uiNamespace setVariable ['dateheure', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1994;
			x = safezoneX + safezoneW - 2.5;
			y = safezoneY + safezoneH - 1.6;
			w = safezoneW - 1;
			h = safezoneH - 0.10;
			shadow = 0.2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.095;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="right";
				color = "#FFFFF";
			};
		};
	};
};