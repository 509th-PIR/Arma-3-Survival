class bulwarkShopDialog
{
    idd = 9999;
    movingEnabled = false;

    class controls
    {
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT START (by Hilltop, v1.063, #Hofuqe)
    // Modified by: Ansible // Cipher
    ////////////////////////////////////////////////////////

        class bulwarkShopDialog_rscPicture: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.8)";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h =  0.385 * safezoneH;
        };

        class bulwarkShopDialog_buildList: RscListbox
        {
            idc = 1500;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.185 * safezoneW;
            h = 0.3 * safezoneH;
        };
		
		class ObjectPicture: RscPicture
        {
            idc = 1502;
			text = "preview.paa";
            x = 0.1 * safezoneW + safezoneX;
            y = 0.3 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.2 * safezoneH;
        };
		
        class bulwarkShopDialog_buildButton: RscButton
        {
            idc = 1600;
            text = "Purchase Building";
            x = 0.309 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.185 * safezoneW;
            h = 0.04 * safezoneH;
            action = "call BLWK_fnc_purchaseObject";
        };

        class bulwarkShopDialog_supportLst: RscListbox
        {
            idc = 1501;
            x = 0.505 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.185 * safezoneW;
            h = 0.3 * safezoneH;
        };
        class bulwarkShopDialog_supportButton: RscButton
        {
            idc = 1601;
            text = "Purchase Support";
            x = 0.505 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.185 * safezoneW;
            h = 0.04 * safezoneH;
            // CIPHER COMMENT: need to pass the new function here when done
            action = "_nil=[]ExecVM ""supports\purchase.sqf""";
        };

        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////

  };
};