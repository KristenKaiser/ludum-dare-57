extends Control
class_name Shop
@onready var popup_panel: PopupPanel = $PopupPanel

const oxygen_price_multiplier : int = 2
var oxygen_price : int = 5
@onready var buy_oxygen_button: Button = $PopupPanel/VBoxContainer/Oxygen/buy_oxygen_button
var oxygen_delta : int = 5

const motor_price_multiplier : int = 2
var motor_price : int = 5
@onready var buy_motors_button: Button = $PopupPanel/VBoxContainer/speed/buy_motors_button
var motor_delta : int = 25

func _ready() -> void:
	buy_oxygen_button.text = "$" + str(oxygen_price)
	buy_motors_button.text = "$" + str(motor_price)

func open_shop()->void: 
	popup_panel.show()




func _on_buy_oxygen_button_up() -> void:
	if Manager.player.score >= oxygen_price:
		Manager.player.update_score(-1 * oxygen_price)
		oxygen_price *= oxygen_price_multiplier
		buy_oxygen_button.text = "$" + str(oxygen_price)
		Manager.player.oxygen_time += oxygen_delta
		

func _on_buy_motors_button_up() -> void:
	if Manager.player.score >= motor_price:
		Manager.player.update_score(-1 * motor_price)
		motor_price *= motor_price_multiplier
		buy_motors_button.text = "$" + str(motor_price)
		Manager.player.update_speed(motor_delta)
		
	
