extends Node2D
class_name Player
@onready var oxygen_timer: Timer = $oxygen_timer


var score : int = 0
var is_above_water : bool = false
var oxygen_time : int = 15
var is_touching_oxygen = false

func update_score(delta_value : int) -> void:
	score += delta_value
	Manager.hud.update_cash(score)

func start_oxygen_timer()->void:
	print("start timer")
	if is_touching_oxygen:
		oxygen_timer.stop()
	oxygen_timer.wait_time = oxygen_time
	is_touching_oxygen = false
	oxygen_timer.start()

func _on_oxygen_timer_timeout() -> void:
	oxygen_timer.stop()
	if is_touching_oxygen == false:
		print("you died")
