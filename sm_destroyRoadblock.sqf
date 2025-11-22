private _roadblock = selectRandom (LBT_objectives select 5);
if (isNil "_roadblock") exitWith {};

private _task = [west, ["roadblock"], ["Destroy the roadblock", "Destroy Roadblock", "Roadblock"], _roadblock select 0, true] call BIS_fnc_taskCreate;

private _grp = createGroup [east, true];
for "_i" from 1 to 4 do {
    _grp createUnit [selectRandom ((missionNamespace getVariable [OPFOR_FACTION, []]) param ["infantry", []]), (_roadblock select 0) getPos [random 20, random 360], [], 0, "NONE"];
};

waitUntil { sleep 10; ({alive _x} count units _grp) == 0 };
[_task, "SUCCEEDED"] call BIS_fnc_taskSetState;
