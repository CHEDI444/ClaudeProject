---
name: godot-47-gdscript
description: Enforce Godot 4.7.2 strict static typing, class_name, data-driven .tres resources in data/ pointing to assets/placeholders/ (no hardcoded paths), and verifying via Godot MCP tools.
---

# Godot 4.7.2 GDScript Standards

## Strict Static Typing
- All variables, parameters, and return types must be explicitly typed
- Use `Vector2i`, `Vector2`, `int`, `float`, `bool`, `String`, `Array[T]`, `Dictionary[K, V]`
- No dynamic `var` unless absolutely necessary (reflection, Godot APIs)

## class_name
- Every script must declare `class_name ClassName` matching the filename
- Use PascalCase for class names

## Data-Driven Resources
- All configurable data in `data/` as `.tres` files
- Resources reference `assets/placeholders/` for art/audio placeholders
- No hardcoded asset paths in code — load via `ResourceLoader.load()` with relative paths

## Verification
- Use Godot MCP tools to verify project opens cleanly
- Run `mcp__godot__get_godot_version` and `mcp__godot__get_project_info`
- Test with `mcp__godot__run_project`