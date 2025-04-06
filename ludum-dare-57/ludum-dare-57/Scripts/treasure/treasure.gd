extends Node
class_name Treasure

var collision_shape : CollisionShape2D
#var audio_stream_player: AudioStreamPlayer


func _ready() -> void:
	self.body_entered.connect(collect_treasure)
	#audio_stream_player = get_node("AudioStreamPlayer")
	
func collect_treasure(treasure :Node2D)->void:
	Manager.audio_manager.play_coin_sound()
	#audio_stream_player.play()
	Manager.player.update_score(get_value())
	self.queue_free()

func get_value() -> int:
	return 0
