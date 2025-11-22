/*
    Staffing and linking factories/fuel depots to FOB industry buildings.
*/

if (!hasInterface) exitWith {};

// Example action to staff a site with civilians carried by the player
player addAction [
    "Assign worker to industry",
    {
        params ["_target", "_caller", "_actionId", "_args"];
        private _type = _args select 0; // "FACTORY" or "FUEL"
        private _workers = _target getVariable ["LBT_workers", 0];
        _workers = _workers + 1;
        _target setVariable ["LBT_workers", _workers, true];

        if (_type == "FACTORY") then {
            private _arr = missionNamespace getVariable ["LBT_activeFactories", []];
            _arr pushBack [_target, _workers];
            missionNamespace setVariable ["LBT_activeFactories", _arr, true];
        } else {
            private _arr = missionNamespace getVariable ["LBT_activeDepots", []];
            _arr pushBack [_target, _workers];
            missionNamespace setVariable ["LBT_activeDepots", _arr, true];
        };
    },
    ["FACTORY"], 1.5, true, true, "", "alive _target && side player == west"]
];
