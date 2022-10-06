extends KinematicBody2D

var speed = 50

var EdgedUp = false
var EdgedDown = false

var drag = false
var original = Vector2.ZERO
var new = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			drag = true
			original = new
		else:
			drag = false
			original = Vector2.ZERO
	new = event.position

func _physics_process(_delta):	
	var velocity = Vector2.ZERO
	if drag:
		if new.y < original.y and not EdgedUp:
			velocity.y += (new.y - original.y)
		if new.y > original.y and not EdgedDown:
			velocity.y += (new.y - original.y)
		original = new
	
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
