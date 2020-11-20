
class bombeiem 
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['bombeiem', _this select 0]";
	onUnload = "uiNamespace setVariable ['bombeiem', objNull]";
	onDestroy = "uiNamespace setVariable ['bombeiem', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t size='1.5' color='#FFFFF'>Press Win >> Active IEM</t>"; //--- ToDo: Localize;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
};