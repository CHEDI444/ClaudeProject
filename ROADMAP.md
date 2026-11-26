# Living-World Sim - Build Checklist

- [x] Step 1: Core Foundation - project.godot, CLAUDE.md, .claude/skills/, EventBus.gd, TimeManager.gd, WorldTopology.gd
- [ ] Step 2: Pure-Data Simulation and 3-Tier LOD - AgentData.gd, WorldSim.gd, toroidal distance tier transitions, headless test
- [ ] Step 3: Main Scene and Active Visual Layer (Tier 0) - Main.tscn, WorldRenderer.gd pooling/spawning visual nodes only for Tier 0 agents, camera pan/zoom
- [ ] Step 4: Needs, Goals and Simple Behavior Loop - Hunger/energy decay, basic decision states (idle, wander, seek_food, rest), world resources/zones
- [ ] Step 5: Debug HUD and Inspection UI - Time speed controls (Pause, 1x, 2x, 4x), agent count and LOD tier readout, click-to-inspect selected agent
- [ ] Step 6: Save/Load and Determinism Verification - JSON/Resource serialization of WorldSim state and headless round-trip test
