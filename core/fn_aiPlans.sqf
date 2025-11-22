/*
    Handles counter-attacks and friendly autonomous pushes.
*/

if (!isServer) exitWith {};

while {true} do {
    sleep (180 + random 120);

    // Enemy counter-attack
    private _enemyOrigin = selectRandom (LBT_objectives select 1); // pick a military base
    private _enemyTarget = selectRandom (LBT_objectives select 0); // push towards towns
    if (!isNil "_enemyOrigin" && {!isNil "_enemyTarget"}) then {
        private _grp = createGroup [east, true];
        for "_i" from 1 to 8 do {
            _grp createUnit [selectRandom ((missionNamespace getVariable [OPFOR_FACTION, []]) param ["infantry", []]), _enemyOrigin select 0, [], 0, "FORM"];
        };
        [_grp, _enemyTarget select 0] spawn BIS_fnc_taskAttack;
    };

    // Friendly autonomous assault
    private _friendlyStart = selectRandom (LBT_objectives select 0);
    private _friendlyTarget = selectRandom (LBT_objectives select 1);
    if (!isNil "_friendlyStart" && {!isNil "_friendlyTarget"}) then {
        private _grpB = createGroup [west, true];
        for "_i" from 1 to 6 do {
            _grpB createUnit [selectRandom ((missionNamespace getVariable [BLUFOR_FACTION, []]) param ["infantry", []]), _friendlyStart select 0, [], 0, "FORM"];
        };
        [_grpB, _friendlyTarget select 0] spawn BIS_fnc_taskAttack;
    };
};
