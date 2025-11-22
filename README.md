# Liberation-Style Dynamic War Template

Drop-in Arma 3 mission files laid out like `core.liberation` so players can copy
this folder into a mission directory and start testing immediately. Only faction
configs live under `mod_template/`; everything else sits at the root for easy
branching.

## Quick start
1. Create or open a mission folder (for example, `Frontlines_No_Ace.<mapname>`)
   under your Arma 3 profile.
2. Copy **all files and folders in this repo** into that mission folder while
   preserving the root structure (`core/`, `logistics/`, `missions/`, etc.).
3. Copy the desired faction files from `mod_template/factions/` into a
   `mod_template/` folder in that mission directory.
4. In `init.sqf`, set `BLUFOR_FACTION`, `OPFOR_FACTION`, and optionally
   `INDFOR_FACTION` to match the faction files you copied.
5. Launch the mission in the editor or host it; objectives, garrisons, and side
   missions will spawn automatically.

## Features
- **Auto objectives:** cities, towns, military bases, factories, fuel depots,
  radio towers, and roadblocks detected from the map and garrisoned by the
  enemy.
- **Dynamic fronts:** enemy counter-attacks by land/air plus friendly patrols in
  held territory to keep the map busy.
- **Side missions:** destroy roadblocks, destroy patrols, scout sectors, and
  destroy supply convoys traveling between sectors.
- **Logistics & economy:** FOB build menu with infrastructure gates, industry
  production for resources/fuel, and manpower from rescued civilians.
- **FOB system:** unarmed FOB truck deploys bases; build menu is available at
  FOBs via the mouse wheel.

## File layout
```
README.md           # This file
LICENSE             # License
description.ext    # Mission config (author, onLoadName, respawn, etc.)
init.sqf            # Mission entry point

core/               # Core mission flow (like Liberation RX core.liberation)
├── cfgFunctions.hpp
├── fn_aiPlans.sqf
├── fn_economy.sqf
├── fn_initWorld.sqf
├── fn_sectorDefense.sqf
├── fn_sideMissions.sqf
└── fn_spawnGarrisons.sqf

logistics/          # FOB build menu + infrastructure rules
├── build_menu.hpp
├── fn_buildMenuInit.sqf
├── fn_buildables.sqf
├── fn_fobTruck.sqf
└── fn_industry.sqf

missions/side/      # Side mission scripts
├── sm_destroyConvoy.sqf
├── sm_destroyPatrol.sqf
├── sm_destroyRoadblock.sqf
└── sm_scoutSector.sqf

mod_template/
└── factions/       # Only faction definitions live here
    ├── faction_opfor_csat.sqf  # Enemy template (OPFOR)
    ├── faction_blufor_nato.sqf # Playable BLUFOR template
    └── faction_indfor_aaf.sqf  # Optional independent template
```

## Customizing
- Update `description.ext` and `init.sqf` in your mission folder to set the
  on-load name (`Frontlines No Ace`) and author (`Dark Demon`).
- Adjust costs, build prerequisites, and unit pools in
  `logistics/fn_buildables.sqf` and the faction files.
- Export the mission from the Arma 3 editor or pack it into a `.pbo` when you
  are ready to share.

## Housekeeping
- Keep packaged `.pbo`/`.zip` files out of source control; this repo is the
  clean template for downstream missions or releases.
- Only faction files belong under `mod_template/`; the rest of the logic stays
  at the root for simple copying and branching.

## Credits
Inspired by the layout of
[Liberation RX](https://github.com/tbox1911/Liberation-RX).
