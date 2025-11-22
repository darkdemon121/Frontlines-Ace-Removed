/*
    Scans the map to build objective lists for towns, military bases, factories, fuel depots,
    radio towers, and roadblocks. This file keeps only high-level logic; mission makers can
    swap detection methods to match their terrain.
*/

if (!isServer) exitWith {};

// basic data containers
LBT_objectives = [
    [], // towns & cities
    [], // military bases
    [], // factories
    [], // fuel depots
    [], // radio towers
    []  // roadblocks
];

private _towns = nearestLocations [[worldSize/2, worldSize/2, 0], ["NameCityCapital","NameCity","NameVillage"], worldSize];
{
    LBT_objectives select 0 pushBack [locationPosition _x, "TOWN"];
} forEach _towns;

private _milSites = nearestLocations [[worldSize/2, worldSize/2, 0], ["NameLocal","Airport","Strategic"], worldSize];
{
    LBT_objectives select 1 pushBack [locationPosition _x, "MILBASE"];
} forEach _milSites;

// factories & fuel depots from terrain objects
private _factories = nearestObjects [[worldSize/2, worldSize/2, 0], ["Land_Factory_Main_F","Land_Ind_Coltan_Main"] , worldSize];
{
    LBT_objectives select 2 pushBack [getPosATL _x, "FACTORY"];
} forEach _factories;

private _depots = nearestObjects [[worldSize/2, worldSize/2, 0], ["Land_FuelStation_Build_F","Land_fs_roof_F"] , worldSize];
{
    LBT_objectives select 3 pushBack [getPosATL _x, "FUEL"];
} forEach _depots;

private _towers = nearestObjects [[worldSize/2, worldSize/2, 0], ["Land_TTowerBig_1_F","Land_Communication_F"] , worldSize];
{
    LBT_objectives select 4 pushBack [getPosATL _x, "RADIO"];
} forEach _towers;

// crude roadblock sampling along main roads
private _roads = roadsConnectedTo position player;
{
    if (random 1 < 0.15) then {
        LBT_objectives select 5 pushBack [getPosATL _x, "ROADBLOCK"];
    };
} forEach _roads;

publicVariable "LBT_objectives";
