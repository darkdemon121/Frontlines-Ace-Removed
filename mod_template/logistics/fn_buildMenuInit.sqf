/*
    Adds mouse-wheel access to the build menu when near a friendly FOB.
*/

if (!hasInterface) exitWith {};

player addAction [
    "Open FOB Build Menu",
    {
        createDialog "LBT_BuildMenu";
    },
    [], 1.5, true, true, "", "(player distance2D LBT_nearestFOB) < 25"
];
