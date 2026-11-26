# CLAUDE.md

## Project

2D top-down living-world simulation in Godot 4.7.2. Continuous Vector2 toroidal
world via WorldTopology, pure-data AgentData, and 3-tier LOD streaming.

## Folder layout

- `scenes/` — all `.tscn` scene files (`world/`, `entities/`, `ui/`)
- `scripts/` — all GDScript scripts (`core/`, `sim/`, `world/`, `components/`, `controllers/`)
- `data/` — data-driven `.tres` resources referencing `assets/placeholders/`
- `assets/` — art, audio, fonts and other imported resources

## Conventions

- Write all game logic in **GDScript** (Godot 4 syntax, `@export`, signals, typed variants)
- Use strict static typing and `class_name ClassName` matching the filename
- No hardcoded asset paths — load via `ResourceLoader.load()` with relative paths
- Do not commit or edit generated files (`.godot/`, `*.import`, `export_presets.cfg`)

## Godot MCP tools

Use `mcp__godot__get_godot_version`, `mcp__godot__get_project_info`,
`mcp__godot__create_scene`, `mcp__godot__add_node`, `mcp__godot__save_scene`,
`mcp__godot__run_project`.

## Git

- Keep the default branch named `main`.