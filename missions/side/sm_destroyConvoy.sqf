private _sectors = (LBT_objectives select 0) + (LBT_objectives select 1) + (LBT_objectives select 2) + (LBT_objectives select 3) + (LBT_objectives select 4);
if ((count _sectors) < 2) exitWith {};

private _start = selectRandom _sectors;
private _destCandidates = _sectors select {(_x select 0) distance2D (_start select 0) > 200};
if ((count _destCandidates) == 0) exitWith {};
private _end = selectRandom _destCandidates;

private _taskText = format ["Destroy the supply convoy moving from %1 to %2", _start select 1, _end select 1];
private _task = [west, ["convoy"], [_taskText, "Destroy Convoy", "Convoy"], _start select 0, true] call BIS_fnc_taskCreate;

private _heading = (_start select 0) getDir (_end select 0);
private _veh1 = createVehicle ["O_Truck_03_transport_F", _start select 0, [], 0, "NONE"];
private _veh2 = createVehicle ["O_Truck_03_fuel_F", (_start select 0) getPos [10, _heading], [], 0, "NONE"];

private _grp = createGroup [east, true];
crew _veh1 joinSilent _grp;
crew _veh2 joinSilent _grp;

{ _x setDir _heading; } forEach [_veh1, _veh2];
_grp setFormation "COLUMN";

private _wp = _grp addWaypoint [_end select 0, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointCompletionRadius 50;

waitUntil { sleep 10; (alive _veh1) isEqualTo false && (alive _veh2) isEqualTo false };
[_task, "SUCCEEDED"] call BIS_fnc_taskSetState;
