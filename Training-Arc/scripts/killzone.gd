extends Area2D
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../../Player"
#When player enters killzone, they die
func _on_body_entered(_body: Node2D) -> void:
	Game.death(_body)
	timer.start()
#After dying, scene is reloaded
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
