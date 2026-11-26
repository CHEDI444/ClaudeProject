extends Node

signal time_tick(hours: int, minutes: int, speed: float)
signal world_event_occurred(event_name: String, position: Vector2)
signal rumor_shared(agent_name: String, rumor: String)
signal agent_goal_changed(agent_id: String, goal: String)
signal agent_lod_changed(agent_id: String, lod: int)
