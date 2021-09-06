extends KinematicBody2D

export(float) var max_speed := 0.0
export(float) var acceleration := 0.0
export(float) var friction := 0.0

var direction := Vector2.ZERO
var velocity := Vector2.ZERO

func _physics_process(delta):
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	if direction.length_squared() > 0:
		direction = direction.normalized()
		velocity = velocity.move_toward(direction * max_speed, acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	move_and_slide(velocity)
