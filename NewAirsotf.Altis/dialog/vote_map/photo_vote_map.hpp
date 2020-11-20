
class vote_map_photo
{
	idd = -1;	
	duration = 10e10;
	onLoad = "uiNamespace setVariable ['vote_map_photo', _this select 0]";
	onUnload = "uiNamespace setVariable ['vote_map_photo', objNull]";
	onDestroy = "uiNamespace setVariable ['vote_map_photo', objNull]";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "TA-image\photos_map\black_screen.jpg";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.99463 * safezoneH;
		};
	};
};