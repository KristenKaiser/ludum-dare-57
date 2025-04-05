extends Node2D
class_name Player

var score : int = 0

func update_score(value : int) -> void:
	score += value
