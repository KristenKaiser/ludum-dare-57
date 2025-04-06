extends CharacterBody2D
class_name Diver

@onready var sub_sprite: AnimatedSprite2D = $sub_sprite

@onready var camera_2d: Camera2D = $Camera2D
var speed = 50

var has_fins : bool = false
var has_helmet : bool = false
var has_sub : bool = false

func _ready() -> void:
	camera_2d.enabled = true
	sub_sprite.play("nude")

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	velocity.x = x_direction * speed
	velocity.y = y_direction * speed
	if velocity.x < 0:
		sub_sprite.flip_h = true
	else: 
		sub_sprite.flip_h = false
		
	move_and_slide()

func enter_oxygen():
	Manager.player.is_touching_oxygen = true
	Manager.hud.shop_button.disabled = false
	Manager.player.oxygen_timer.stop()
	print("enter oxygen")
	
func exit_oxygen():
	Manager.player.start_oxygen_timer()
	
func change_sprite() -> void: 
	if has_sub: 
		sub_sprite.play("sub")
	elif has_helmet && has_fins: 
		sub_sprite.play("fins_and_helmet")
	elif has_fins: 
		sub_sprite.play("fins")
	elif has_helmet: 
		sub_sprite.play("helmet")
	else:
		sub_sprite.play("nude")
