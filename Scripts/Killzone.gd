extends StaticBody2D


func _ready():
	pass


func _on_killzone_body_entered(body):
	if body.name == "Player":
		body.timer_status()
		body.reset()
