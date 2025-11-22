# Liberation-Style Dynamic War Template

This repository is a Liberation-inspired mission scaffold laid out like the
`core.liberation` folder from Liberation RX so players can drop it into an Arma
3 profile and play-test without moving files around.

## Quick start (download and play)
1. Create or open an Arma 3 mission folder (for example:
   `Frontlines_No_Ace.<mapname>` under your profile).
2. Copy **everything in this repo** into that mission folder while keeping the
   `core/`, `logistics/`, and `missions/` folders at the root.
3. Copy the faction files from `mod_template/factions/` into a `mod_template/`
   folder inside that mission.
4. In `init.sqf`, set `BLUFOR_FACTION`, `OPFOR_FACTION`, and optionally
   `INDFOR_FACTION` to the faction files you want to use.
5. Load the mission in the Arma 3 editor or host it; world objectives and
   garrisons are generated automatically.

## What you get
- **Auto-generated objectives:** cities, towns, military bases, factories, fuel
  depots, radio towers, and roadblocks discovered from the map and garrisoned by
  the enemy.
- **Dynamic fronts:** enemy battle groups counter-attack captured sectors on
  land and by air; friendly patrols spawn in controlled territory to keep the
  battlefield lively.
- **Side missions:** destroy roadblocks, destroy patrols, scout sectors, and
  destroy supply convoys that travel from sector to sector.
- **Logistics & economy:** FOB-based build menu gated by constructed
  infrastructure and captured industry. Resources and fuel are produced by
  staffed factories/fuel depots; civilians provide manpower for recruiting
  troops.
- **FOB system:** an unarmed FOB truck can deploy a forward base. Build menu is
  accessible from FOBs via the mouse wheel.

The template is intentionally data-driven: faction definitions live in
`mod_template/factions/`, while gameplay systems sit in dedicated folders so you
can branch and swap them independently.

## File map
```
README.md           # This file
description.ext     # Mission config snippets (author, onLoadName, respawn, etc.)
init.sqf            # Entry point for mission logic

core/               # Core mission flow (similar to Liberation RX core.liberation)
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
└── factions/
    ├── faction_opfor_csat.sqf  # Enemy template (OPFOR)
    ├── faction_blufor_nato.sqf # Playable BLUFOR template
    └── faction_indfor_aaf.sqf  # Optional independent template
```

## Customizing for tests or releases
- Set mission metadata (on-load name `Frontlines No Ace` and author `Dark Demon`)
  in `description.ext` and `init.sqf` inside your mission folder after copying
  these files over.
- Tweak build costs, prerequisites, and unit pools inside
  `logistics/fn_buildables.sqf` and the faction files.
- When you are happy with the configuration, export the mission from the Arma 3
  editor or pack it into a `.pbo` for distribution.

## Keeping the repo clean
- Only faction definitions belong in `mod_template/`; all other mission files
  stay at the root so downstream missions can branch the logic without touching
  faction data.
- Keep packaged `.pbo`/`.zip` artifacts out of this source repository—treat it
  as the clean template that feeds your mission folders or GitHub releases.

## Credits
Inspired by the structure of [Liberation RX][liberation-rx].

[liberation-rx]: https://github.com/tbox1911/Liberation-RX/tree/master/core.liberation/mod_template
