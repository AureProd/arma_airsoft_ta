class VoteIHM 
{
    idd = 5001;
    movingEnable = 0;
    enableSimulation = 1;
    
    class controls 
	{
		class Container1: RscText
		{
			idc = -1;
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,1};
		};
		class Container2: RscText
		{
			idc = -1;
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,153,1};
		};
		class Container3: RscText
		{
			idc = -1;
			text = "Nos map"; //--- ToDo: Localize;
			x = 0.00706247 * safezoneW + safezoneX;
			y = 0.642 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,1};
			shadow = 0;
		};
		class MapsList: RscListbox
		{
			idc = 1;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.253 * safezoneH;
			sizeEx = 0.05;
		};
		class VoteButton: RscMenuButton
		{
			idc = 2;
			text = "Votez pour cette map";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.9674 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			shadow = 0;
			colorBackground[] = {153,0,0,1};
		};
    };
};
