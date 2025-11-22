/*
    Creates garrisons for each generated objective using the active OPFOR faction pools.
*/

if (!isServer) exitWith {};

private _faction = missionNamespace getVariable [OPFOR_FACTION, []];
private _infPool = _faction param ["infantry", []];
private _vehPool = _faction param ["vehicles", []];

{
    private _pos = _x select 0;
    private _type = _x select 1;
    private _grp = createGroup [east, true];

    // place infantry ring
    for "_i" from 1 to 6 do {
        private _unitType = selectRandom _infPool;
        _grp createUnit [_unitType, _pos getPos [random 60, random 360], [], 0, "NONE"];
    };

    // add light vehicle defenses for high-value points
    if (_type in ["MILBASE","FACTORY","FUEL","RADIO"]) then {
        private _vehType = selectRandom _vehPool;
        private _veh = createVehicle [_vehType, _pos getPos [random 35, random 360], [], 0, "NONE"];
        [_veh, crew _veh] joinSilent _grp;
    };

    _grp setBehaviour "COMBAT";
    _grp setCombatMode "RED";
} forEach (LBT_objectives call BIS_fnc_flatten);
