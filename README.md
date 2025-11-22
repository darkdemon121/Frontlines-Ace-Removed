# Liberation-Style Dynamic War Template

This repository supplies a Liberation-inspired mission scaffold laid out like the `core.liberation` folder from Liberation RX so it’s easy to drop into an Arma 3 profile and play-test without guesswork.

## Overview
- **Auto-generated objectives:** cities, towns, military bases, factories, fuel depots, radio towers, and roadblocks are detected from the world and seeded with garrisons.
- **Dynamic fronts:** enemy battle groups counter-attack captured sectors by land and air. Friendly patrols spawn in controlled territory to keep the battlefield alive.
- **Side missions:** destroy roadblocks, destroy patrols, scout sectors, and destroy supply convoys between sectors.
- **Logistics & economy:** FOB-based build menu gated by constructed infrastructure and captured industry. Resources and fuel are produced by staffed factories/fuel depots; civilians provide manpower for recruiting troops.
- **FOB system:** an unarmed FOB truck can deploy a forward base. Build menu is accessible from FOBs via the mouse wheel.

The template is intentionally data-driven. Faction definitions live in `mod_template/factions/`, while gameplay systems are grouped into clear folders so you can branch and swap them independently.

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

## How to use
1. Download or clone this repo and drop the contents directly into an Arma 3 mission folder (e.g., `Frontlines_No_Ace.<map>`), preserving the `core/`, `logistics/`, and `missions/` directories.
2. Copy `mod_template/factions/` into `mod_template/` in that mission folder (only faction files live there; everything else stays at the mission root just like Liberation RX).
3. Point your mission to the desired factions by editing `init.sqf` variables `BLUFOR_FACTION`, `OPFOR_FACTION`, and optionally `INDFOR_FACTION`.
4. Tweak build costs, prerequisites, and unit pools inside `logistics/fn_buildables.sqf` and the faction files.
5. Run the mission. On load, objectives are generated automatically based on the terrain and garrisoned by the enemy faction.

### Packaging for distribution
- Set mission metadata (e.g., on-load name `Frontlines No Ace` and author `Dark Demon`) inside your target mission folder’s `description.ext`/`init.sqf` after copying the files over.
- When you are happy with the configuration, export the mission from the Arma 3 editor or pack it into a `.pbo` for distribution.
- Keep packaged artifacts out of this source repository—store them in your release pipeline or a separate binary storage location.

### Keeping the template repo clean
- Only faction definitions live in `mod_template/`. Everything else belongs at the root so downstream missions can branch off logic without touching faction data.
- Keep the `core/`, `logistics/`, and `missions/` folders intact so anyone can download-and-play without relocating files.
- Avoid committing packaged `.pbo` or `.zip` artifacts here; treat this repo strictly as the source template that feeds your mission folder or GitHub release pipeline.

## Notes
- All SQF in this template is written to be easily extended; it favors clarity over micro-optimizations.
- The economy loop mirrors Liberation: capture industry, staff it with civilians, and build infrastructure at FOBs to unlock new build categories.
- Side missions are scheduled at a low frequency to avoid overwhelming players on busy maps.
- Default faction pools rely on vanilla Arma 3 classes to keep dependencies minimal.

## Credits
Inspired by the structure of [Liberation RX](https://github.com/tbox1911/Liberation-RX/tree/master/core.liberation/mod_template).
