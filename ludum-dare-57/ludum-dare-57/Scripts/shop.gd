extends Control
class_name Shop
@onready var popup_panel: PopupPanel = $PopupPanel

const oxygen_price_multiplier : int = 2
var oxygen_price : int = 5
@onready var buy_oxygen_button: Button = $PopupPanel/VBoxContainer/Oxygen/buy_oxygen_button
@onready var oxygen_label: Label = $PopupPanel/VBoxContainer/Oxygen/oxygen_label
var oxygen_delta : int = 5

const motor_price_multiplier : int = 2
var motor_price : int = 5
@onready var buy_motors_button: Button = $PopupPanel/VBoxContainer/speed/buy_motors_button
@onready var motor_label: Label = $PopupPanel/VBoxContainer/speed/motor_label
var motor_delta : int = 25


var sub_price : int = 200
@onready var buy_sub_button: Button = $PopupPanel/VBoxContainer/speed2/buy_sub_button



func _ready() -> void:
	buy_oxygen_button.text = "$" + str(oxygen_price)
	buy_motors_button.text = "$" + str(motor_price)

func open_shop()->void: 
	if Manager.player.is_touching_oxygen:
		popup_panel.show()


func _on_buy_oxygen_button_up() -> void:
	if Manager.player.score >= oxygen_price:
		Manager.player.update_score(-1 * oxygen_price)
		if Manager.player.current_vehicle.has_sub:
			oxygen_price *= oxygen_price_multiplier
			buy_oxygen_button.text = "$" + str(oxygen_price)
		else:
			buy_oxygen_button.disabled = true
			Manager.player.current_vehicle.has_helmet = true
			Manager.player.current_vehicle.change_sprite()
		Manager.player.oxygen_time += oxygen_delta

func _on_buy_motors_button_up() -> void:
	if Manager.player.score >= motor_price:
		Manager.player.update_score(-1 * motor_price)
		if Manager.player.current_vehicle.has_sub:
			motor_price *= motor_price_multiplier
			buy_motors_button.text = "$" + str(motor_price)
		else:
			buy_motors_button.disabled = true
			Manager.player.current_vehicle.has_fins = true
			Manager.player.current_vehicle.change_sprite()
		Manager.player.update_speed(motor_delta)



func _on_buy_sub_button_up() -> void:
	if Manager.player.score >= sub_price:
		buy_sub_button.disabled = true
		Manager.player.current_vehicle.has_sub = true
		Manager.player.current_vehicle.change_sprite()
		
		buy_motors_button.disabled = false
		motor_price *= motor_price_multiplier
		buy_motors_button.text = "$" + str(motor_price)
		motor_label.text = "Upgrade Motors: increase speed"
		Manager.player.update_speed(motor_delta * 4)
		
		
		
		buy_oxygen_button.disabled = false
		oxygen_price *= oxygen_price_multiplier
		buy_oxygen_button.text = "$" + str(oxygen_price)
		oxygen_label.text = "Upgrade Oxygen: +5 seconds"
		Manager.player.oxygen_time += oxygen_delta * 4
		
		
		Manager.player.update_score(-1 * sub_price)
