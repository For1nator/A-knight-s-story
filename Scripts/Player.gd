extends KinematicBody2D

var health  = 100


export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.30

export (int) var speed = 900
export (int) var jump_speed = -900
export (int) var gravity = 1700

var velocity = Vector2.ZERO

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		GlobalVars.playerhealth -=10

func get_input():
	var dir = 0
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed