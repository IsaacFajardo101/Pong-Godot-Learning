extends KinematicBody2D

var speed = 400

func _physics_process(_delta):
	position.x = 48
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
# warning-ignore:return_value_discarded
	move_and_slide(velocity * speed)
