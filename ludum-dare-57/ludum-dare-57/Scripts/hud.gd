extends CanvasLayer
class_name Hud
@onready var time_label: Label = $HBoxContainer/PanelContainer/VBoxContainer/time_label
@onready var score: Label = $HBoxContainer/PanelContainer2/HBoxContainer/score
@onready var shop_button: Button = $HBoxContainer/shop_button

func _ready() -> void:
	update_oxygen_timer(Manager.player.oxygen_time)

func update_oxygen_timer(time : int) -> void: 
	time_label.text = str(time)

func update_cash(cash : int) -> void:
	score.text = str(cash)

func _on_shop_button_down() -> void:
	Manager.shop.open_shop()
