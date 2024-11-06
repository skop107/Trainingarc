extends Camera2D
@onready var camera_2d: Camera2D = $"."
#Sets camera limits and initial offset
func _ready() -> void:
	camera_2d.offset.x = 0.0
	camera_2d.limit_left = -350
	camera_2d.limit_top = -300
	camera_2d.limit_right = 600
	camera_2d.limit_bottom = 120
#Directional camera offset
func _process(_delta: float) -> void:
	#Uses the PLAYER_DIRECTION variable from the player script to adjust camera offset based on direction
	if Game.PLAYER_DIRECTION == "LEFT":
		camera_2d.offset.x = lerp(camera_2d.offset.x, -15.0, 0.04)
	if Game.PLAYER_DIRECTION == "RIGHT":
		camera_2d.offset.x = lerp(camera_2d.offset.x, 15.0, 0.04)
	
