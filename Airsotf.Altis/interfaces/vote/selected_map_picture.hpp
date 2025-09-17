class SelectedMapPicture
{
	idd = -1;	
	onLoad = "uiNamespace setVariable ['selected_map_picture',_this select 0]";
    
	class controls
	{
		class MapPicture: RscPicture
		{
			idc = 1;
			text = "pictures\vote\black_screen.jpg";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.99463 * safezoneH;
		};
	};
};