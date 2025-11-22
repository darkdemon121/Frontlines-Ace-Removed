// Entry point for the Liberation-style dynamic war template
// Include this file from your mission init.sqf

BLUFOR_FACTION = "faction_blufor_nato";
OPFOR_FACTION  = "faction_opfor_csat";
INDFOR_FACTION = "faction_indfor_aaf"; // optional

// World/objective generation
[] call LBT_fnc_initWorld;
[] call LBT_fnc_spawnGarrisons;
[] call LBT_fnc_sectorDefense;

// Side missions and AI battle plans
[] spawn LBT_fnc_sideMissions;
[] spawn LBT_fnc_aiPlans;

// Economy & logistics
[] call LBT_fnc_economy;
[] call LBT_fnc_buildMenuInit;
[] call LBT_fnc_fobTruck;
