/*
    Defines buildable categories and handles the actual spawning + resource costs.
*/

params ["_target", "_caller", "_actionId", "_arguments"];

if (!isServer) exitWith {};

private _categories = [
    ["Infantry", ["B_soldier_F", "B_soldier_AR_F", "B_medic_F"], {LBT_resources >= 10 && LBT_manpower >= 1}],
    ["Vehicles", ["B_MRAP_01_F", "B_APC_Wheeled_01_cannon_F"], {LBT_resources >= 50 && LBT_fuel >= 20}],
    ["Helicopters", ["B_Heli_Light_01_dynamicLoadout_F"], {LBT_resources >= 80 && LBT_fuel >= 50}],
    ["Planes", ["B_Plane_CAS_01_dynamicLoadout_F"], {LBT_resources >= 120 && LBT_fuel >= 80}],
    ["Buildings", ["Land_Cargo_HQ_V1_F","Land_Cargo_House_V1_F","Land_BagBunker_Large_F","Land_BagFence_Round_F"], {true}]
];

// In a real build, you would populate UI lists from _categories and apply costs per item.
{
    private _catName = _x select 0;
    private _items = _x select 1;
    private _condition = _x select 2;

    if (call _condition) then {
        private _spawnPos = player modelToWorld [0,5,0];
        private _class = selectRandom _items;
        if (_catName == "Buildings") then {
            private _bld = createVehicle [_class, _spawnPos, [], 0, "NONE"];
        } else {
            private _grp = createGroup [side player, true];
            private _u = _grp createUnit [_class, _spawnPos, [], 0, "FORM"];
            [_u] joinSilent group player;
        };
        LBT_resources = LBT_resources - 10;
        LBT_fuel = LBT_fuel max 0;
        publicVariable "LBT_resources";
        publicVariable "LBT_fuel";
    };
} forEach _categories;
