extends Node

## Tick clock for in-game time. Speeds: 0.0 (paused), 1x, 2x, 4x.
## A "tick" = one in-game minute. Emits EventBus.time_tick each minute.

const SPEED_PAUSED: float = 0.0
const SPEED_1X: float = 1.0
const SPEED_2X: float = 2.0
const SPEED_4X: float = 4.0

## Real seconds per in-game minute at 1x speed.
const SECONDS_PER_MINUTE: float = 0.5

@export var speed: float = SPEED_1X
@export var in_game_minute: int = 0   # 0..59
@export var in_game_hour: int = 0     # 0..23
@export var in_game_day: int = 1      # 1..N

var _minute_accumulator: float = 0.0

func _process(delta: float) -> void:
	if speed <= 0.0:
		return
	_minute_accumulator += delta * speed
	while _minute_accumulator >= SECONDS_PER_MINUTE:
		_minute_accumulator -= SECONDS_PER_MINUTE
		_advance_minute()

func _advance_minute() -> void:
	in_game_minute += 1
	if in_game_minute >= 60:
		in_game_minute = 0
		in_game_hour += 1
		if in_game_hour >= 24:
			in_game_hour = 0
			in_game_day += 1
	EventBus.time_tick.emit(in_game_hour, in_game_minute, speed)

func set_speed(new_speed: float) -> void:
	speed = maxf(new_speed, SPEED_PAUSED)

func get_speed_name() -> String:
	match speed:
		SPEED_PAUSED: return "Paused"
		SPEED_1X: return "1x"
		SPEED_2X: return "2x"
		SPEED_4X: return "4x"
		_: return "%.1fx" % speed

func get_time_string() -> String:
	return "%02d:%02d Day %d" % [in_game_hour, in_game_minute, in_game_day]
