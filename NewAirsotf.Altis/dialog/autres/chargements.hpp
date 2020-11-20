
class chargement 
{
	idd = -1;	
	duration = 1000;
	onLoad = "uiNamespace setVariable ['chargement', _this select 0]";
	onUnload = "uiNamespace setVariable ['chargement', objNull]";
	onDestroy = "uiNamespace setVariable ['chargement', objNull]";
	class controls
	{
		class RscPicture_1200: RscProgress
		{
			idc = 1200;
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

class chargement_rond
{
	idd = -1;	
	duration = 1000;
	onLoad = "uiNamespace setVariable ['chargement_rond', _this select 0]";
	onUnload = "uiNamespace setVariable ['chargement_rond', objNull]";
	onDestroy = "uiNamespace setVariable ['chargement_rond', objNull]";
	class controls
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<img image='TA-image\progress2\progress_0_ca.paa' size='3' />"; //--- ToDo: Localize;
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.4668 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.14 * safezoneH;
		};
		class tete_mort: RscStructuredText
		{
			idc = 1150;
			text = "<img image='TA-image\progress2\holdaction_forcerespawn_ca.paa' size='3' />"; //--- ToDo: Localize;
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.4668 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.14 * safezoneH;
		};
	};
};