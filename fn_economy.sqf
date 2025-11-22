/*
    Resource + fuel economy hooks. Civilians act as manpower.
*/

if (!isServer) exitWith {};

LBT_resources = 0;
LBT_fuel = 0;
LBT_manpower = 0;

[] spawn {
    while {true} do {
        sleep 300;
        private _activeFactories = missionNamespace getVariable ["LBT_activeFactories", []];
        private _activeDepots = missionNamespace getVariable ["LBT_activeDepots", []];

        {
            _x params ["_pos", "_workers"];
            LBT_resources = LBT_resources + (10 * _workers);
        } forEach _activeFactories;

        {
            _x params ["_pos", "_workers"];
            LBT_fuel = LBT_fuel + (8 * _workers);
        } forEach _activeDepots;

        publicVariable "LBT_resources";
        publicVariable "LBT_fuel";
    };
};
