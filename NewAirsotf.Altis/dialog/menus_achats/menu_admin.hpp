
class menu_admin {
	idd = 1556;	
	onLoad = "checkbox_VIP ctrlSetChecked false; checkbox_admin ctrlSetChecked false;";
	onUnload = "call fn_menu_stop";
	class controls
	{
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class RscText_1003: RscText
		{
			idc = -1;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class RscText_1004: RscText
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class liste: RscListbox
		{
			idc = 1500;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.385 * safezoneH;
			sizeEx = 0.05;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			text = "X"; //--- ToDo: Localize;
			x = 0.692864 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0133856 * safezoneW;
			h = 0.0247778 * safezoneH;
			onButtonClick = "call fn_quit_bis;";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {1,0,0,1};
		};
		
		class text_argent: RscStructuredText
		{
			idc = 1102;
			text = "<t size='1.25' color='#000000'>---</t>"; //--- ToDo: Localize;
			x = 0.542813 * safezoneW + safezoneX;
			y = 0.437593 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class bouton_reset: RscButtonMenu
		{
			idc = 2401;
			text = "RESET"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			onButtonClick = "call fn_appui_reset;";
			class Attributes {
				align="center";
				color = "#FFFFFF";
				valign="middle";
				size=1.25;
			};
		};
		class edit_argent: RscEdit
		{
			idc = 1400;
			text = ""; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.7,0.7,0.7,1};
			class Attributes {
				align="center";
				color = "#000000";
				valign="middle";
				size=1.25;
			};
		};
		class bouton_set: RscButtonMenu
		{
			idc = 2402;
			text = "SET"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			onButtonClick = "call fn_appui_set;";
			class Attributes {
				align="center";
				color = "#FFFFFF";
				valign="middle";
				size=1.25;
			};
		};
		class image_admin: RscPicture
		{
			idc = -1;
			text = "TA-image\interfaces\interface_admin.paa";
			x = 0.233438 * safezoneW + safezoneX;
			y = 0.214926 * safezoneH + safezoneY;
			w = 0.533074 * safezoneW;
			h = 0.945889 * safezoneH;
			class Attributes {
				align="center";
			};
		};
	};
};