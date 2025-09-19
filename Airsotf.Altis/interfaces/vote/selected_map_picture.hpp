class SelectedMapPicture
{
	idd = -1;	
	onLoad = "uiNamespace setVariable ['selected_map_picture',_this select 0]";
	duration=1e9;
    
	class controls
	{
		class MapPicture: RscPicture
		{
			idc = 1;
			text = "pictures\vote\black_screen.jpg";
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
		};
	};
};