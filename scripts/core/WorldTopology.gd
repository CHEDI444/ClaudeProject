extends Node
class_name WorldTopology

## Toroidal (wrapping) world topology for continuous 2D world coordinates.
## Positions wrap continuously around the world edges; delta/distance/direction
## always take the shortest path across the seam.

const WORLD_SIZE: Vector2 = Vector2(16384.0, 16384.0)
const ACTIVE_VISUAL_RADIUS: float = 1800.0

static func wrap_pos(pos: Vector2) -> Vector2:
	var half: float = WORLD_SIZE * 0.5
	var wrapped: Vector2
	# Map each component into [0, world_size), then center into [-half, half).
	wrapped.x = pos.x % WORLD_SIZE.x
	if wrapped.x < 0.0:
		wrapped.x += WORLD_SIZE.x
	wrapped.y = pos.y % WORLD_SIZE.y
	if wrapped.y < 0.0:
		wrapped.y += WORLD_SIZE.y
	if wrapped.x >= half.x:
		wrapped.x -= WORLD_SIZE.x
	if wrapped.y >= half.y:
		wrapped.y -= WORLD_SIZE.y
	return wrapped

static func toroidal_delta(a: Vector2, b: Vector2) -> Vector2:
	return wrap_pos(a - b)

static func toroidal_distance_squared(a: Vector2, b: Vector2) -> float:
	var delta: Vector2 = toroidal_delta(a, b)
	var diff: Vector2 = delta - WorldTopology.wrap_pos(delta)
	return diff.length_squared()

static func toroidal_distance(a: Vector2, b: Vector2) -> float:
	return sqrt(toroidal_distance_squared(a, b))

static func toroidal_direction(a: Vector2, b: Vector2) -> Vector2:
	var delta: Vector2 = toroidal_delta(a, b)
	var diff: Vector2 = delta - WorldTopology.wrap_pos(delta)
	if diff.length_squared() == 0.0:
		return Vector2.ZERO
	return diff.normalized()
