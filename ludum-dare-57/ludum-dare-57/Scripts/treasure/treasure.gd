extends Node
class_name Treasure

var collision_shape : CollisionShape2D

func _ready() -> void:
	self.body_entered.connect(collect_treasure)
	
func collect_treasure(treasure :Node2D)->void:
	Manager.player.update_score(get_value())
	self.queue_free()

func get_value() -> int:
	return 0
