extends Area2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("This is an egg")
#Picks up egg
func _on_body_entered(_body: Node2D) -> void:
	print("+1 egg")
	queue_free()
