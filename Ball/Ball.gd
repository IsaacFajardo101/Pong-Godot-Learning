extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

func _physics_process(delta):
	var collider = move_and_collide(velocity * speed * delta)
	if collider:
		velocity = velocity.bounce(collider.normal)
		$BounceSound.play()
		speed += 25
		if collider.collider.name != "Player":
			$"../Player".position.x = 48
		else:
			speed += 50
		if collider.collider.name != "Opponent":
			$"../Opponent".position.x = 976
		else:
			speed += 50

func Reset():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]
	position = Vector2(512, 300)
