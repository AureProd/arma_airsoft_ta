class KillFeed
{
	idd = 5006;
	movingEnable = true;
	enableSimulation = true;
	fadeout=0;
	fadein=0;
	onLoad = "uiNamespace setVariable ['kill_feed',_this select 0]";
	duration=999999999;
		
	class controls {
		class KillFeedText: RscStructuredText
		{
			idc = 1;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.231 * safezoneH;
		};
	};
};