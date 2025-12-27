class VoteIHM 
{
    idd = 5001;
    movingEnable = 0;
    enableSimulation = 1;
    duration = 1e9;   // équivalent à 999999999

    class controls 
    {
        class BackgroundContainer: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.01;
			y = safeZoneY + safeZoneH * 0.65;
			w = safeZoneW * 0.25;
			h = safeZoneH * 0.31222223;
            colorBackground[] = {0.12,0.14,0.16,1};
        };
        class Header: RscText
        {
            idc = -1;
            x = 0.01 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0.6,1}; // RGB -> 0.6 = 153/255 -> blue
        };
        class HeaderTitle: RscText
        {
            idc = -1;
            text = "Nos maps";
            x = safeZoneX + safeZoneW * 0.098125;
			y = safeZoneY + safeZoneH * 0.62333334;
			w = safeZoneW * 0.15125;
			h = safeZoneH * 0.04333334;
            colorText[] = {1,1,1,1}; // white
            shadow = 0;
            sizeEx = 0.04;
        };
        class MapsList: RscListbox
        {
            idc = 1;
            x = safeZoneX + safeZoneW * 0.015;
			y = safeZoneY + safeZoneH * 0.66888889;
			w = safeZoneW * 0.24;
			h = safeZoneH * 0.28555556;
            sizeEx = 0.03;
        };
        class VoteButton: RscMenuButton
        {
            idc = 2;
            text = "Votez pour cette map";
            x = safeZoneX + safeZoneW * 0.01;
			y = safeZoneY + safeZoneH * 0.96111112;
			w = safeZoneW * 0.25;
			h = safeZoneH * 0.03111112;
            colorText[] = {1,1,1,1}; // white
            shadow = 0;
            colorBackground[] = {0.6,0,0,1}; // RGB -> 0.6 = 153/255 -> red
        };
    };
};