class RscTitles {
    class LBT_BuildMenu {
        idd = 88001;
        movingEnable = 0;
        enableSimulation = 1;
        duration = 999999;
        onLoad = "uiNamespace setVariable ['LBT_BuildMenu', _this select 0];";
        class controls {
            class Background {
                type = 0;
                idc = -1;
                x = 0.3; y = 0.2; w = 0.4; h = 0.5;
                style = 80;
                text = "";
                colorBackground[] = {0,0,0,0.7};
            };
            class Title {
                type = 0;
                idc = -1;
                x = 0.32; y = 0.22; w = 0.36; h = 0.04;
                style = 0;
                text = "FOB Build Menu";
                colorText[] = {1,1,1,1};
                colorBackground[] = {0,0,0,0};
            };
            class CategoryList {
                type = 5; style = 16; idc = 88002;
                x = 0.32; y = 0.28; w = 0.16; h = 0.4;
            };
            class ItemList {
                type = 5; style = 16; idc = 88003;
                x = 0.50; y = 0.28; w = 0.18; h = 0.4;
            };
            class BuildButton {
                type = 1; idc = 88004;
                x = 0.50; y = 0.70; w = 0.18; h = 0.05;
                text = "Build";
                action = "[] call LBT_fnc_buildables;";
            };
        };
    };
};
