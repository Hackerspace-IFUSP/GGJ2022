extends Node


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Start2_pressed():
	print(GAME.level_open)
	get_tree().change_scene("res://Levels/Level%d.tscn" % GAME.level_open)
