extends Node


func _ready():
	$Anim.play("Event1")


func _on_Button_pressed():
	$Button.disabled = true
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Title_screen.tscn")
