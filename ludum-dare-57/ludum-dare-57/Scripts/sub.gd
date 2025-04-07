extends CharacterBody2D
class_name Diver

@onready var sub_sprite: AnimatedSprite2D = $sub_sprite

@onready var camera_2d: Camera2D = $Camera2D
var speed = 50
const friction = .01


var has_fins : bool = false
var has_helmet : bool = false
var has_sub : bool = false

func _ready() -> void:
	camera_2d.enabled = true
	sub_sprite.play("nude")

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if x_direction != 0:
		velocity.x = x_direction * speed
	elif abs(velocity.x) - abs(speed * friction) > 0:
		if velocity.x < 0 :
			velocity.x += abs(speed * friction)
		else: 
			velocity.x -= abs(speed * friction)
	else:
		velocity.x = 0
		
	if y_direction != 0:
		velocity.y = y_direction * speed
	elif abs(velocity.y) - abs(speed * friction) > 0:
		if velocity.y < 0 :
			velocity.y += abs(speed * friction)
		else: 
			velocity.y -= abs(speed * friction)
	else:
		velocity.y = 0
		
		
	if velocity.x < 0:
		sub_sprite.flip_h = true
	elif velocity.x > 0: 
		sub_sprite.flip_h = false	
	update_rotation(velocity.x, velocity.y)
	if x_direction == 0 && y_direction == 0:
		sub_sprite.pause()
	else:
		sub_sprite.play()
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



func update_rotation(x,y)->void:
	
	if x < 0 && y < 0:
		sub_sprite.rotation = 120
	elif x < 0 && y > 0:
		sub_sprite.rotation = 100
	elif x > 0 && y < 0:
		sub_sprite.rotation = 100
	elif x > 0 && y > 0:
		sub_sprite.rotation = 120
	else: 
		sub_sprite.rotation = 0
