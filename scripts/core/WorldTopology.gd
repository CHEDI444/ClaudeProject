class_name WorldTopology
extends RefCounted

## Toroidal (wrapping) world topology for continuous 2D world coordinates.
## Positions wrap around the world edges; delta/distance/direction always
## take the shortest path across the seam. Pure static utility (not an autoload).

const WORLD_SIZE: Vector2 = Vector2(16384.0, 16384.0)
const ACTIVE_VISUAL_RADIUS: float = 1800.0

## Wraps a position into [-WORLD_SIZE/2, WORLD_SIZE/2) on both axes.
static func wrap_pos(pos: Vector2) -> Vector2:
	var half: Vector2 = WORLD_SIZE * 0.5
	return Vector2(
		fposmod(pos.x + half.x, WORLD_SIZE.x) - half.x,
		fposmod(pos.y + half.y, WORLD_SIZE.y) - half.y
	)

## Shortest vector pointing from b to a (a - b), across the seam.
static func toroidal_delta(a: Vector2, b: Vector2) -> Vector2:
	return wrap_pos(a - b)

static func toroidal_distance_squared(a: Vector2, b: Vector2) -> float:
	return toroidal_delta(a, b).length_squared()

static func toroidal_distance(a: Vector2, b: Vector2) -> float:
	return toroidal_delta(a, b).length()

## Unit direction pointing from a toward b, across the seam.
static func toroidal_direction(a: Vector2, b: Vector2) -> Vector2:
	var delta: Vector2 = toroidal_delta(b, a)
	if delta.length_squared() == 0.0:
		return Vector2.ZERO
	return delta.normalized()
