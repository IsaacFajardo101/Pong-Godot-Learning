extends KinematicBody2D

var speed = 400

var EdgedUp = false
var EdgedDown = false

func _physics_process(_delta):	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up") and not EdgedUp:
		velocity.y -= 1
	if Input.is_action_pressed("ui_down") and not EdgedDown:
		velocity.y += 1
# warning-ignore:return_value_discarded
	move_and_slide(velocity * speed)	

func _on_Upper_body_entered(body: Node) -> void:
	if body.name == "Ball":
		EdgedUp = true

func _on_Upper_body_exited(body: Node) -> void:
	if body.name == "Ball":
		EdgedUp = false


func _on_Lower_body_entered(body: Node) -> void:
	if body.name == "Ball":
		EdgedDown = true

func _on_Lower_body_exited(body: Node) -> void:
	if body.name == "Ball":
		EdgedDown = false
