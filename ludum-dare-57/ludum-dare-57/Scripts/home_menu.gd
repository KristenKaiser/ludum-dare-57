extends Control
class_name HomeMenu
@onready var camera_2d: Camera2D = $Camera2D

func _on_start_button_down() -> void:
	Manager.start_game()
	camera_2d.enabled = false
