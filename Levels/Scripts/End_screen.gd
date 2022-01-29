extends Node


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Title_screen.tscn")
