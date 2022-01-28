extends Area2D

var maps = [
	"res://Levels/Level1.tscn",
	"res://Levels/Level2.tscn",
	"res://Levels/Level3.tscn"
]

enum { MAP1 , MAP2 , MAP3 , MAP4 , MAP5 , MAP6 , MAP7 , MAP8 , MAP9 , MAP10 , MAP11 , MAP12 }
export var choose_map = MAP1



func _on_Teleporter_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(maps[choose_map])
