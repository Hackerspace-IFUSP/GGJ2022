extends Node

func _ready():
	if GAME.levels[0] == 0:
		$Text_and_buttons/Levels/Level1.disabled = true
	if GAME.levels[1] == 0:
		$Text_and_buttons/Levels/Level2.disabled = true
	if GAME.levels[2] == 0:
		$Text_and_buttons/Levels/Level3.disabled = true
	if GAME.levels[3] == 0:
		$Text_and_buttons/Levels/Level4.disabled = true
	if GAME.levels[4] == 0:
		$Text_and_buttons/Levels/Level5.disabled = true
	if GAME.levels[5] == 0:
		$Text_and_buttons/Levels/Level6.disabled = true
	if GAME.levels[6] == 0:
		$Text_and_buttons/Levels/Level7.disabled = true
	if GAME.levels[7] == 0:
		$Text_and_buttons/Levels/Level8.disabled = true
	if GAME.levels[8] == 0:
		$Text_and_buttons/Levels/Level9.disabled = true
	if GAME.levels[9] == 0:
		$Text_and_buttons/Levels/Level10.disabled = true
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
	$Text_and_buttons/Levels/Level1.disabled = true
	$Text_and_buttons/Levels/Level2.disabled = true
	$Text_and_buttons/Levels/Level3.disabled = true
	$Text_and_buttons/Levels/Level4.disabled = true
	$Text_and_buttons/Levels/Level5.disabled = true
	$Text_and_buttons/Levels/Level6.disabled = true
	$Text_and_buttons/Levels/Level7.disabled = true
	$Text_and_buttons/Levels/Level8.disabled = true
	$Text_and_buttons/Levels/Level9.disabled = true
	$Text_and_buttons/Levels/Level10.disabled = true

func play_transition2():
	$Anim.play("Event2")
	yield($Anim,"animation_finished")
