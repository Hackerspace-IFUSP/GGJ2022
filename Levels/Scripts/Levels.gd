extends Node

var phrases = [
	"“  To be, or not to be, that is the question”", #1
	"”  The world is given to me only once, not one existing and one perceived. Subject and object are only one.”", #2
	"“  We shouldn't be looking for heroes, we should be looking for good ideas.”", #3
	"“  To lose confidence in one’s body is to lose confidence in oneself.”", #4
	"“  Nothing in life is to be feared. It is only to be understood.”", #5
	"“  No rational argument will have a rational effect on a man who does not want to adopt a rational attitude.”", #6
	"“  At the end of the day, we can endure much more than we think we can.”", #7
	"“  Anyone who has never made a mistake has never tried anything new.”", #8
	"“  Never should I forget that in the middle of the road \n there was a stone“", #9
	"  I'll be back!" #10
]

var authors = [
	"-William Shakespeare", #1
	"-Erwin Schrödinger", #2
	"-Noam Chomsky", #3
	"-Simone de Beauvoir", #4
	"-Marie Curie", #5
	"-Karl Popper", #6
	"-Frida Kahlo", #7
	"-Albert Einstein", #8
	"-Carlos Drummond de Andrade", #9
	"-Terminator" #10
	
]

export(int) var level = 0

func _ready():
	$Transition/Phrase.text = phrases[level]
	$Transition/Autor.text = authors[level]
	$YSort/Player.stop()
	$Transition/Anim.play("Event1")
	yield($Transition/Anim,"animation_finished")
	$YSort/Player.dont_stop()


func reset_level():
	$Transition/Anim.play("Event2")
	
