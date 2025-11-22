/*
    Marks an unarmed truck as a deployable FOB.
*/

if (!hasInterface) exitWith {};

LBT_fobClasses = ["B_Truck_01_transport_F"];
LBT_nearestFOB = objNull;

{
    _x addAction [
        "Deploy FOB",
        {
            params ["_target", "_caller", "_actionId", "_args"];
            private _pos = _target modelToWorld [0,10,0];
            private _hq = "Land_Cargo_HQ_V1_F" createVehicle _pos;
            LBT_nearestFOB = _hq;
            deleteVehicle _target;
        },
        [], 1.5, true, true, "", "(vehicle _this) in LBT_fobClasses"
    ];
} forEach vehicles;
