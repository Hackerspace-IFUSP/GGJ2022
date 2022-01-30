extends Node


func _ready():
	$transition.play("Event1")
	yield($transition,"animation_finished")


func _on_Button_pressed():
	$transition.play("Event2")
	yield($transition,"animation_finished")
	$Text_and_buttons/Select_level.disabled = true
	$Text_and_buttons/Start.disabled = true
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Start2_pressed():
<<<<<<< HEAD
	$transition.play("Event2")
	yield($transition,"animation_finished")
	$Text_and_buttons/Select_level.disabled = true
	$Text_and_buttons/Start.disabled = true
	get_tree().change_scene("res://Levels/Level_select.tscn")
=======
	print(GAME.level_open)
	get_tree().change_scene("res://Levels/Level%d.tscn" % GAME.level_open)
>>>>>>> 81fba047bf18dbad22d979008aa5c41346a265eb
