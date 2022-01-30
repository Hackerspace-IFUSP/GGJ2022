extends Node

func _ready():
	for child in $Text_and_buttons/Levels.get_children():
		var level_to_unlock = int(child.name)
		print(level_to_unlock)
		if level_to_unlock <= GAME.level_open:
			child.disabled = false
	
	
	$Anim.play("Event1")



func _on_Return_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Title_screen.tscn")


########

func _on_Level1_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Level2_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level2.tscn")


func _on_Level3_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level3.tscn")


func _on_Level4_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level4.tscn")


func _on_Level5_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level5.tscn")


func _on_Level6_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level6.tscn")


func _on_Level7_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level7.tscn")


func _on_Level8_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level8.tscn")


func _on_Level9_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level9.tscn")


func _on_Level10_pressed():
	disable_all_buttons()
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
	get_tree().change_scene("res://Levels/Level10.tscn")



func disable_all_buttons():
	for child in $Text_and_buttons/Levels.get_children():
		child.disabled = true
	
func play_transition2():
	$Anim.play("Event2")
	yield($Anim,"animation_finished")


func _on_Clear_pressed():
	GAME.level_open = 0
	GAME.save_settings()
	disable_all_buttons()
	_on_Return_pressed()
