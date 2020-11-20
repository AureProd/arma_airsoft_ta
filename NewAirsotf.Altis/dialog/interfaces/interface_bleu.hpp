
class interface_bleu 
{
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['interface_bleu', _this select 0]";
	onUnload = "uiNamespace setVariable ['interface_bleu', objNull]";
	onDestroy = "uiNamespace setVariable ['interface_bleu', objNull]";
	class controls 
	{
		class image_bleu: RscPicture
		{
			idc = 1000;
			text = "TA-image\interface_bleu.paa";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1.95 * safezoneH;
			class Attributes {
				align="center";
			};
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1001; // soif
			text = ""; //--- ToDo: Localize;
			x = 0.116875 * safezoneW + safezoneX;
			y = 0.85663 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			class Attributes {
				align="center";
				color="#FFFFF";
				size="1.1";
			};
		};
		class RscStructuredText_1102: RscStructuredText
		{
			idc = 1002; // credits
			text = ""; //--- ToDo: Localize;
			x = 0.120469 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			class Attributes {
				align="left";
				color="#FFFFF";
				size="1.25";
			};
		};
		class RscStructuredText_1103: RscStructuredText
		{
			idc = 1003; // urine
			text = ""; //--- ToDo: Localize;
			x = 0.15401 * safezoneW + safezoneX;
			y = 0.85837 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			class Attributes {
				align="center";
				color="#FFFFF";
				size="1.1";
			};
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1004; // kill/mort
			text = ""; //--- ToDo: Localize;
			x = 0.188073 * safezoneW + safezoneX;
			y = 0.882332 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			class Attributes {
				align="center";
				color="#FFFFF";
				size="1.1";
			};
		};
		class RscStructuredText_1104: RscStructuredText
		{
			idc = 1005; // billes
			text = ""; //--- ToDo: Localize;
			x = 0.932084 * safezoneW + safezoneX;
			y = 0.859185 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			class Attributes {
				align="right";
				color="#FFFFF";
				size="1.5";
			};
		};
	};
};