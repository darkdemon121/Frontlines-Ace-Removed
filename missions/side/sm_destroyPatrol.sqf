private _town = selectRandom (LBT_objectives select 0);
if (isNil "_town") exitWith {};

private _task = [west, ["patrol"], ["Destroy the enemy patrol", "Destroy Patrol", "Patrol"], _town select 0, true] call BIS_fnc_taskCreate;

private _grp = [(_town select 0), east, selectRandom ((missionNamespace getVariable [OPFOR_FACTION, []]) param ["infantry", []]), 6] call BIS_fnc_spawnGroup;
[_grp, _town select 0, 300] call BIS_fnc_taskPatrol;

waitUntil { sleep 10; ({alive _x} count units _grp) == 0 };
[_task, "SUCCEEDED"] call BIS_fnc_taskSetState;
