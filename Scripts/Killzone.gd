extends StaticBody2D


func _ready():
	pass


func _on_killzone_body_entered(body):
	if body.name == "Player":
		$anim.play("Event")
		body.reset()
