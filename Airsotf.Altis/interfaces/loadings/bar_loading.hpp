class BarLoading
{
	idd = -1;	
	onLoad = "uiNamespace setVariable ['bar_loading',_this select 0]";
	duration=1e9;

	class controls
	{
		class ProgressBar: RscProgressBar
		{
			idc = 1;
			type = 8;
    		style = 0;
			colorFrame[] = {0,0,0,1};
			colorBar[] = {0,0,0,1};
    		texture = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};