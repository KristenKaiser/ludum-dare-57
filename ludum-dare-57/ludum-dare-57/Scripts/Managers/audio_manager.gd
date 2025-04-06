extends Node2D
class_name AudioManager

@onready var coins: Node = $coins


var coin_sounds: Array[AudioStreamPlayer]

func _ready() -> void:
	for coin in coins.get_children():
		coin_sounds.append(coin)
	

func play_coin_sound()->void:
	coin_sounds[randi_range(0,coin_sounds.size() - 1)].play(.19)
