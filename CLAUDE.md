# CLAUDE.md

## Project

This is a Godot 4.7.2 project.

## Folder layout

- `scenes/` — all `.tscn` scene files
- `scripts/` — all GDScript scripts (`.gd`)
- `assets/` — art, audio, fonts and other imported resources

## Conventions

- Write all game logic in **GDScript** (Godot 4 syntax, e.g. `@export` annotations, signals, typed variants).
- Keep scripts attached to nodes within their scene; scenes may reference scripts by relative path.
- Do not commit or edit generated files (`.godot/`, `*.import`, `export_presets.cfg`, temporary files).

## Godot MCP tools

Use the Godot MCP tools for scene creation and version checks:

- `mcp__godot__get_godot_version` — check the Godot version in use.
- `mcp__godot__get_project_info` — inspect the current project.
- `mcp__godot__create_scene` — create a new scene.
- `mcp__godot__add_node` — add a node to a scene.
- `mcp__godot__save_scene` — save a scene.
- `mcp__godot__run_project` — run the project.

## Git

- Keep the default branch named `main`.
