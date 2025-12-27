class RoundLoading
{
	idd = -1;	
	onLoad = "uiNamespace setVariable ['round_loading',_this select 0]";
	duration=1e9;

	class controls
	{
		class ProgressRoundPicture: RscStructuredText
		{
			idc = 1;
			text = "<img image='pictures\round_progress\progress_0.paa' size='3' />";
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.4668 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.14 * safezoneH;
		};
		class SkullPicture: RscStructuredText
		{
			idc = 2;
			text = "<img image='pictures\round_progress\skull.paa' size='3' />";
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.4668 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.14 * safezoneH;
		};
	};
};