extends Area2D

export var blink_x = 0
export var blink_y = 0

func _ready():
	pass


func _on_Blink_body_entered(body):
	if body.name == "Player":
		body.blink(blink_x,blink_y)
