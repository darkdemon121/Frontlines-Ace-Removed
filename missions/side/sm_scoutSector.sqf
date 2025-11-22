private _sector = selectRandom (LBT_objectives select 1);
if (isNil "_sector") exitWith {};

private _task = [west, ["scout"], ["Scout the sector without being detected", "Scout Sector", "Scout"], _sector select 0, true] call BIS_fnc_taskCreate;

private _startTime = time;
waitUntil { sleep 5; (player distance2D (_sector select 0)) < 100 };

waitUntil {
    sleep 5;
    ((time - _startTime) > 60) || (player knowsAbout (selectRandom allUnits)) > 1
};

if ((time - _startTime) > 60) then {
    [_task, "SUCCEEDED"] call BIS_fnc_taskSetState;
} else {
    [_task, "FAILED"] call BIS_fnc_taskSetState;
};
