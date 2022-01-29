extends Area2D


func _ready():
	pass



func _on_Button_body_entered(body):
	$button.play()
	get_parent().disable_collision()
	
	

func _on_Button_body_exited(body):
	get_parent().enable_collision()
