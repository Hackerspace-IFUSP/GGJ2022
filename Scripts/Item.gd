extends Area2D

export var energy = 100

func _ready():
	pass


func _on_Item_body_entered(body):
	if body.name == "Player":
		body.get_energy(energy)
		queue_free()
