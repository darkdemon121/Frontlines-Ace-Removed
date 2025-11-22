# Liberation-Style Dynamic War Template

This template sketches a Liberation-inspired dynamic campaign for **any terrain**, using vanilla assets as defaults. It follows the structure of the Liberation-RX mod template while remaining self-contained so mission makers can drop it into their own `core.liberation` folder.

## Overview
- **Auto-generated objectives:** cities, towns, military bases, factories, fuel depots, radio towers, and roadblocks are detected from the world and seeded with garrisons.
- **Dynamic fronts:** enemy battle groups counter-attack captured sectors by land and air. Friendly patrols spawn in controlled territory to keep the battlefield alive.
- **Side missions:** destroy roadblocks, destroy patrols, scout sectors, and destroy supply convoys.
- **Logistics & economy:** FOB-based build menu gated by constructed infrastructure and captured industry. Resources and fuel are produced by staffed factories/fuel depots; civilians provide manpower for recruiting troops.
- **FOB system:** an unarmed FOB truck can deploy a forward base. Build menu is accessible from FOBs via the mouse wheel.

The template is intentionally data-driven: factions, costs, and buildable assets live in `factions/` and `logistics/` so mission makers can add new sides without touching mission logic.

## File map
```
mod_template/
├── README.md                 # This file
├── description.ext           # High-level mission config snippets
├── init.sqf                  # Entry point for mission logic
├── core/
│   ├── fn_initWorld.sqf      # World scan & objective seeding
│   ├── fn_spawnGarrisons.sqf # Defenders for generated objectives
│   ├── fn_sideMissions.sqf   # Side mission scheduler
│   ├── fn_aiPlans.sqf        # Offensive/defensive AI plans for both factions
│   ├── fn_sectorDefense.sqf  # Auto-defense for captured sectors
│   └── fn_economy.sqf        # Resource & fuel economy hooks
├── factions/
│   ├── faction_opfor_csat.sqf   # Enemy template (OPFOR)
│   ├── faction_blufor_nato.sqf  # Playable BLUFOR template
│   └── faction_indfor_aaf.sqf   # Optional independent template
├── logistics/
│   ├── build_menu.hpp        # UI definition for FOB build menu
│   ├── fn_buildMenuInit.sqf  # Menu init & access control
│   ├── fn_buildables.sqf     # Catalog of buildable assets & prerequisites
│   ├── fn_industry.sqf       # Factory/fuel depot staffing & linking
│   └── fn_fobTruck.sqf       # FOB truck deployment logic
└── missions/side/
    ├── sm_destroyRoadblock.sqf
    ├── sm_destroyPatrol.sqf
    ├── sm_scoutSector.sqf
    └── sm_destroyConvoy.sqf
```

## How to use
1. Copy the `mod_template` folder into your mission root (e.g., `core.liberation/mod_template`).
2. Import or merge `description.ext` and `init.sqf` into your mission. They are written to be additive; keep your existing settings as needed.
3. Point your mission to the desired factions by editing `init.sqf` variables `BLUFOR_FACTION`, `OPFOR_FACTION`, and optionally `INDFOR_FACTION`.
4. Tweak build costs, prerequisites, and unit pools inside `logistics/fn_buildables.sqf` and the faction files.
5. Run the mission. On load, objectives are generated automatically based on the terrain and garrisoned by the enemy faction.

## Notes
- All SQF in this template is written to be easily extended; it favors clarity over micro-optimizations.
- The economy loop mirrors Liberation: capture industry, staff it with civilians, and build infrastructure at FOBs to unlock new build categories.
- Side missions are scheduled at a low frequency to avoid overwhelming players on busy maps.
- Default faction pools rely on vanilla Arma 3 classes to keep dependencies minimal.

## Credits
Inspired by the structure of [Liberation RX](https://github.com/tbox1911/Liberation-RX/tree/master/core.liberation/mod_template).
