extends Area2D

var maps = [
	"res://Levels/Level1.tscn",
	"res://Levels/Level2.tscn",
	"res://Levels/Level3.tscn",
	"res://Levels/Level4.tscn",
	"res://Levels/Level5.tscn",
	"res://Levels/Level6.tscn",
	"res://Levels/Level7.tscn",
	"res://Levels/Level8.tscn",
	"res://Levels/Level9.tscn",
	"res://Levels/Level10.tscn",
	"res://Levels/End_screen.tscn"
]

enum { MAP1 , MAP2 , MAP3 , MAP4 , MAP5 , MAP6 , MAP7 , MAP8 , MAP9 , MAP10 , MAP11 , MAP12 }
export var choose_map = MAP1



func _on_Teleporter_body_entered(body):
	if body.name == "Player":
		$exit.play()
		body.stop()
		yield($exit,"finished")
		get_tree().change_scene(maps[choose_map])
