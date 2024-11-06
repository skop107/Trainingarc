extends CanvasLayer
#Makes the viewport size match the monitor display size
func _ready() -> void:
	get_viewport().size = DisplayServer.screen_get_size()
