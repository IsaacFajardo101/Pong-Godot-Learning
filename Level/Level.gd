extends Node2D

var PlayerScore = 0
var OpponentScore = 0

func Reset():
	$Ball.Reset()
	$Countdown.start()
	$Ball.speed = 0
	$Opponent.speed = 0
	$ScoreSound.play()

func _on_Left_Bounds_body_entered(body: Node):
	if body.name == $Ball.name:		
		OpponentScore += 1
		$OpponentScore.text = str(OpponentScore)
		Reset()

func _on_Right_Bounds_body_entered(body: Node):
	if body.name == $Ball.name:		
		PlayerScore += 1
		$PlayerScore.text = str(PlayerScore)
		Reset()

func _on_Countdown_timeout():
	$Ball.speed = 600
	$Opponent.speed = 450
