/*
    Spawns defensive squads when a sector is captured by players.
*/

if (!isServer) exitWith {};

"LBT_sectorCaptured" addPublicVariableEventHandler {
    params ["_var", "_data"];
    _data params ["_pos", "_side"];

    private _grp = createGroup [_side, true];
    private _pool = (missionNamespace getVariable [BLUFOR_FACTION, []]) param ["infantry", []];

    for "_i" from 1 to 6 do {
        _grp createUnit [selectRandom _pool, _pos getPos [random 30, random 360], [], 0, "NONE"];
    };

    _grp setBehaviour "AWARE";
    _grp setCombatMode "YELLOW";
};
