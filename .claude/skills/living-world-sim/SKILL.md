---
name: living-world-sim
description: Enforce continuous Vector2 toroidal wrapping via WorldTopology, pure-data AgentData in scripts/sim/ decoupled from nodes, and 3-tier LOD streaming.
---

# Living-World Simulation Standards

## WorldTopology Toroidal Wrapping
- All movement/world queries pass through `WorldTopology` for continuous Vector2 toroidal wrapping
- `wrap_pos()`, `toroidal_delta()`, `toroidal_distance()`, `toroidal_direction()`
- No direct position manipulation bypassing WorldTopology

## Pure-Data AgentData
- `AgentData` resource in `scripts/sim/` — pure data, decoupled from scene nodes
- Agents hold `AgentData` reference; nodes reference data, data doesn't reference nodes

## 3-Tier LOD Streaming
- Tier 1: Active radius (`ACTIVE_VISUAL_RADIUS`) — full simulation + rendering
- Tier 2: Mid radius — reduced update frequency
- Tier 3: Far radius — minimal/no updates, stream in/out