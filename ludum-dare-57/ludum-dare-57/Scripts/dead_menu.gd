extends Control
class_name DeadMenu
@onready var camera_2d: Camera2D = $Camera2D

func _on_start_button_down() -> void:
	Manager.start_game()
	camera_2d.enabled = false

func _on_quit_button_down() -> void:
	get_tree().quit()
