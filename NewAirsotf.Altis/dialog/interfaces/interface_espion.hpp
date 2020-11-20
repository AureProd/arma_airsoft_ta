
class interface_espion 
{
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['interface_espion', _this select 0]";
	onUnload = "uiNamespace setVariable ['interface_espion', objNull]";
	onDestroy = "uiNamespace setVariable ['interface_espion', objNull]";
	class controls 
	{
		class image_espion: RscPicture
		{
			idc = 1000;
			text = "TA-image\interface_espion.paa";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1.95 * safezoneH;
			class Attributes {
				align="center";
			};
		};
	};
};