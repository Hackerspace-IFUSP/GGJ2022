extends Node

func _ready():
	if GAME.levels[0] == 0:
		$Levels/Level1.disabled = true
	if GAME.levels[1] == 0:
		$Levels/Level2.disabled = true
	if GAME.levels[2] == 0:
		$Levels/Level3.disabled = true
	if GAME.levels[3] == 0:
		$Levels/Level4.disabled = true
	if GAME.levels[4] == 0:
		$Levels/Level5.disabled = true
	if GAME.levels[5] == 0:
		$Levels/Level6.disabled = true
	if GAME.levels[6] == 0:
		$Levels/Level7.disabled = true
	if GAME.levels[7] == 0:
		$Levels/Level8.disabled = true
	if GAME.levels[8] == 0:
		$Levels/Level9.disabled = true
	if GAME.levels[9] == 0:
		$Levels/Level10.disabled = true
