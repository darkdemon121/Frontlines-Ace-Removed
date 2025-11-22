/*
    Scheduler for lightweight side missions.
*/

if (!isServer) exitWith {};

while {true} do {
    sleep (120 + random 120);
    private _pool = [
        "missions/side/sm_destroyRoadblock.sqf",
        "missions/side/sm_destroyPatrol.sqf",
        "missions/side/sm_scoutSector.sqf",
        "missions/side/sm_destroyConvoy.sqf"
    ];
    private _mission = selectRandom _pool;
    [] execVM _mission;
};
