extends Area2D

export var blink_x = 0
export var blink_y = 0

func _ready():
	yield(get_tree(),"idle_frame")
	_rotate_arrow()



func _rotate_arrow():
	var blink_to = Vector2(blink_x, blink_y)
	var angle_to_rotate = blink_to.angle_to_point(Vector2(global_position))
	$Arrow.rotation_degrees = rad2deg(angle_to_rotate) + 90

func _on_Blink_body_entered(body):
	if body.name == "Player":
		body.blink(blink_x,blink_y)
