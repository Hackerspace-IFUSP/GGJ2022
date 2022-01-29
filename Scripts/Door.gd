extends StaticBody2D


func _ready():
	pass


func disable_collision():
	collision_mask = 8
	collision_layer = 8
	#$shape.disabled = true
	
func enable_collision():
	#$shape.disabled = false
	collision_mask = 1
	collision_layer = 1
