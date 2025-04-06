extends Node2D
class_name Ocean


func _on_oxygen_body_entered(body: Node2D) -> void:
	if body.has_method("enter_oxygen"):
		body.enter_oxygen()
	else:
		printerr("no method \"enter_oxygen\"")

func _on_oxygen_body_exited(body: Node2D) -> void:
	if body.has_method("exit_oxygen"):
		body.exit_oxygen()
	else:
		printerr("no method \"exit_oxygen\"")
