class liberation_template {
    tag = "LBT";
    class core {
        file = "mod_template/core";
        class initWorld { preInit = 1; };
        class spawnGarrisons {};
        class sideMissions {};
        class aiPlans {};
        class sectorDefense {};
        class economy {};
    };
    class logistics {
        file = "mod_template/logistics";
        class buildMenuInit {};
        class buildables {};
        class industry {};
        class fobTruck {};
    };
};
