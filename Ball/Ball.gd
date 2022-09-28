extends KinematicBody2D

var speed = 600
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
		if collider.collider.name == "Player" or collider.collider.name == "Opponent":
			speed += 75

func Reset():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]
	position = Vector2(512, 300)
