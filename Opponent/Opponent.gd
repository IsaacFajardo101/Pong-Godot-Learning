extends KinematicBody2D

var speed = 300
var ball

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(_delta):
	position.x = 976
	var velocity = Vector2.ZERO
	if ball.position.y < position.y:
		velocity.y -= 1
	if ball.position.y > position.y :
		velocity.y += 1
# warning-ignore:return_value_discarded
	move_and_slide(velocity * speed)
