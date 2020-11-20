
class menu 
{
	idd = 155;	
	onUnload = "call fn_menu_stop";
	class controls
	{
		class menu_shop: RscText
		{
			idc = -1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,1};
		};
		class RscListbox_armes: RscListbox
		{
			idc = 102;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.264 * safezoneH;
			font = "PuristaSemibold";
			sizeEx = 0.05;
		};
		class RscButtonMenu_fermer: RscButtonMenu
		{
			idc = -1;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
			onButtonClick = "call fn_quit_bis;";
			class Attributes {
				align="center";
				color = "#000000";
				valign="middle";
				size=1.25;
			};
		};
		class RscButtonMenu_valider: RscButtonMenu
		{
			idc = 104;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
			font = "PuristaSemibold";
			text = "Acheter";
			onButtonClick = "call fn_valider;";
			class Attributes {
				align="center";
				color = "#FFFFF";
				valign="middle";
				size=1.25;
			};
		};
		class RscListbox_viseurs: RscListbox
		{
			idc = 103;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.264 * safezoneH;
			font = "PuristaSemibold";
			sizeEx = 0.05;
		};

		class image_armes: RscPicture
		{
			idc = -1;
			text = "TA-image\interfaces\interface_marchand.paa";
			x = 0.233422 * safezoneW + safezoneX;
			y = 0.11214 * safezoneH + safezoneY;
			w = 0.533125 * safezoneW;
			h = 0.947965 * safezoneH;
			class Attributes {
				align="center";
			};
		};
	};
};
		
class menu_bis {
	idd = 154;	
	onUnload = "call fn_menu_stop";
	class controls
	{
		class menu_shop_bis: RscText
		{
			idc = -1;
			x = 0.391718 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.374 * safezoneH;
			font = "PuristaSemibold";
			sizeEx = 0.05;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
			font = "PuristaSemibold";
			text = "Acheter";
			onButtonClick = "call fn_valider_bis;";
			class Attributes {
				align="center";
				color = "#FFFFF";
				valign="middle";
				size=1.25;
			};
		};
		class RscButtonMenu_2401: RscButtonMenu
		{
			idc = 2401;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
			font = "PuristaSemibold";
			text = "Fermer";
			onButtonClick = "call fn_quit_bis;";
			class Attributes {
				align="center";
				color = "#FFFFF";
				valign="middle";
				size=1.25;
			};
		};
		class image_general: RscPicture
		{
			idc = -1;
			text = "TA-image\interfaces\interface_general.paa";
			x = 0.235 * safezoneW + safezoneX;
			y = 0.105852 * safezoneH + safezoneY;
			w = 0.537239 * safezoneW;
			h = 0.944148 * safezoneH;
			class Attributes {
				align="center";
			};
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.598125 * safezoneW;
			h = 1.078 * safezoneH;
		};
	};
};
