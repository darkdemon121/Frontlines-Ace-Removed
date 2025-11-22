# Liberation-Style Dynamic War Template

This repository supplies a Liberation-inspired mission scaffold split into separable pieces so you can branch and iterate on each area independently.

## Overview
- **Auto-generated objectives:** cities, towns, military bases, factories, fuel depots, radio towers, and roadblocks are detected from the world and seeded with garrisons.
- **Dynamic fronts:** enemy battle groups counter-attack captured sectors by land and air. Friendly patrols spawn in controlled territory to keep the battlefield alive.
- **Side missions:** destroy roadblocks, destroy patrols, scout sectors, and destroy supply convoys between sectors.
- **Logistics & economy:** FOB-based build menu gated by constructed infrastructure and captured industry. Resources and fuel are produced by staffed factories/fuel depots; civilians provide manpower for recruiting troops.
- **FOB system:** an unarmed FOB truck can deploy a forward base. Build menu is accessible from FOBs via the mouse wheel.

The template is intentionally data-driven. Faction definitions live in `mod_template/factions/`, while all gameplay systems sit in the repository root so you can branch and swap them independently.

## File map
```
README.md                # This file
description.ext          # High-level mission config snippets
init.sqf                 # Entry point for mission logic
cfgFunctions.hpp         # Function registration for mission scripts
fn_initWorld.sqf         # World scan & objective seeding
fn_spawnGarrisons.sqf    # Defenders for generated objectives
fn_sideMissions.sqf      # Side mission scheduler
fn_aiPlans.sqf           # Offensive/defensive AI plans for both factions
fn_sectorDefense.sqf     # Auto-defense for captured sectors
fn_economy.sqf           # Resource & fuel economy hooks
fn_buildMenuInit.sqf     # Menu init & access control
fn_buildables.sqf        # Catalog of buildable assets & prerequisites
fn_industry.sqf          # Factory/fuel depot staffing & linking
fn_fobTruck.sqf          # FOB truck deployment logic
build_menu.hpp           # UI definition for FOB build menu
sm_destroyRoadblock.sqf  # Side mission: destroy roadblock
sm_destroyPatrol.sqf     # Side mission: destroy patrol
sm_scoutSector.sqf       # Side mission: scout sector
sm_destroyConvoy.sqf     # Side mission: destroy convoy moving between sectors
mod_template/
└── factions/
    ├── faction_opfor_csat.sqf  # Enemy template (OPFOR)
    ├── faction_blufor_nato.sqf # Playable BLUFOR template
    └── faction_indfor_aaf.sqf  # Optional independent template
```

## How to use
1. Copy the root-level mission files (everything listed above except `mod_template/`) directly into your mission root (e.g., `core.liberation`).
2. Drop `mod_template/factions/` into your mission under `mod_template/` so the faction selector can find them.
3. Point your mission to the desired factions by editing `init.sqf` variables `BLUFOR_FACTION`, `OPFOR_FACTION`, and optionally `INDFOR_FACTION`.
4. Tweak build costs, prerequisites, and unit pools inside `fn_buildables.sqf` and the faction files.
5. Run the mission. On load, objectives are generated automatically based on the terrain and garrisoned by the enemy faction.

### Packaging for distribution
- Set mission metadata (e.g., on-load name `Frontlines No Ace` and author `Dark Demon`) inside your target mission folder’s `description.ext`/`init.sqf` after copying the files over.
- When you are happy with the configuration, export the mission from the Arma 3 editor or pack it into a `.pbo` for distribution.
- Keep packaged artifacts out of this source repository—store them in your release pipeline or a separate binary storage location.

### Keeping the template repo clean
- Only faction definitions live in `mod_template/`. Everything else belongs at the root so downstream missions can branch off logic without touching faction data.
- Avoid committing packaged `.pbo` or `.zip` artifacts here; treat this repo strictly as the source template that feeds your mission folder or GitHub release pipeline.

## Notes
- All SQF in this template is written to be easily extended; it favors clarity over micro-optimizations.
- The economy loop mirrors Liberation: capture industry, staff it with civilians, and build infrastructure at FOBs to unlock new build categories.
- Side missions are scheduled at a low frequency to avoid overwhelming players on busy maps.
- Default faction pools rely on vanilla Arma 3 classes to keep dependencies minimal.

## Credits
Inspired by the structure of [Liberation RX](https://github.com/tbox1911/Liberation-RX/tree/master/core.liberation/mod_template).
