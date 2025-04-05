extends CharacterBody2D
@onready var camera_2d: Camera2D = $Camera2D


const SPEED = 300.0



func _ready() -> void:
	camera_2d.enabled = true


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	velocity.x = x_direction * SPEED
	velocity.y = y_direction * SPEED


	move_and_slide()
