#A Code by: KeichiTS - 01.2022

extends KinematicBody2D



var velocity = Vector2.ZERO

export var speed = 12000
export var inertia = 100
export var energy = 0

enum{to_be,not_to_be,transformation}
var status = to_be 

enum{on_timer,out_timer}
var timer_status = out_timer

var audio_player = 0


func _ready():
	pass

func _physics_process(delta):
	move(delta)
	push()
	input_reset()
	to_be()

	
#### Faz o bixo andar
func move(val):

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
	if input_vector != Vector2.ZERO:
		velocity = input_vector
		velocity = velocity * val * speed

	else:
		velocity = Vector2.ZERO  

	if input_vector.y > 0 and input_vector.x == 0:
		if status == to_be: 
			#$Sprite.frame = 0
			$Be_sprites/idle.hide()
			$Be_sprites/front.show()
			$Be_sprites/back.hide()
			$Be_sprites/side.hide()
			
		else:
			$Not_be_sprites/idle.hide()
			$Not_be_sprites/front.show()
			$Not_be_sprites/back.hide()
			$Not_be_sprites/side.hide()
	
	elif input_vector.y < 0 and input_vector.x == 0:
		if status == to_be:
			$Be_sprites/idle.hide()
			$Be_sprites/front.hide()
			$Be_sprites/back.show()
			$Be_sprites/side.hide()
		else:
			$Not_be_sprites/idle.hide()
			$Not_be_sprites/front.hide()
			$Not_be_sprites/back.show()
			$Not_be_sprites/side.hide()
	
	elif input_vector.x > 0:
		#$Sprite.scale.x = -1
		$Be_sprites/side.scale.x = -1
		$Not_be_sprites/side.scale.x = -1
		if status == to_be:
			$Be_sprites/idle.hide()
			$Be_sprites/front.hide()
			$Be_sprites/back.hide()
			$Be_sprites/side.show()
		else:
			$Not_be_sprites/idle.hide()
			$Not_be_sprites/front.hide()
			$Not_be_sprites/back.hide()
			$Not_be_sprites/side.show()
			
	elif input_vector.x < 0:
		#$Sprite.scale.x = 1
		$Be_sprites/side.scale.x = 1
		$Not_be_sprites/side.scale.x = 1
		if status == to_be:
			$Be_sprites/idle.hide()
			$Be_sprites/front.hide()
			$Be_sprites/back.hide()
			$Be_sprites/side.show()
		else:
			$Not_be_sprites/idle.hide()
			$Not_be_sprites/front.hide()
			$Not_be_sprites/back.hide()
			$Not_be_sprites/side.show()
			
	else:
		if status == to_be:
			$Be_sprites/idle.show()
			$Be_sprites/front.hide()
			$Be_sprites/back.hide()
			$Be_sprites/side.hide()
		else:
			$Not_be_sprites/idle.show()
			$Not_be_sprites/front.hide()
			$Not_be_sprites/back.hide()
			$Not_be_sprites/side.hide()
			
	if status != transformation:
		move_and_slide(velocity,Vector2(0,0),false, 4, 0, false)




### Faz o bixo empurrar
func push():
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("box"):
			collision.collider.apply_central_impulse(-collision.normal * inertia)

### Faz o bixo resetar com o hotkey
func input_reset():
	if Input.is_action_just_pressed("ui_reset"):
		reset()


### Faz o bixo resetar conforme um parâmetro
func reset():
	if audio_player == 0:
		$Transitions/dead.play()
		audio_player = 1
	get_parent().get_parent().reset_level()
	status = transformation
	$Be_sprites.hide()
	$Not_be_sprites.hide()
	$Transitions/anim.play("Dead")
	yield($Transitions/anim,"animation_finished")
	get_tree().reload_current_scene()

### Faz o bixo ser ou não ser
func to_be():
	
	if status == to_be and energy > 0:
		$Transitions/transf.play()
		timer_status = on_timer
		collision_layer = 2
		$Be_sprites.hide()
		status = transformation
		$Transitions/anim.play("Transformation")
		yield($Transitions/anim,"animation_finished")
		$Not_be_sprites.show()
		status = not_to_be
		$energy_timer.start()
			


###

func get_energy(val):
	energy = val
	
	
func blink(val1,val2):
	var temp_status = status
	status = transformation
	$blink/blink.play()
	$teleport_anim.play("Event1")
	yield($teleport_anim,"animation_finished")
	global_position.x = val1 
	global_position.y = val2
	$blink/blink.play()
	$teleport_anim.play("Event2")
	yield($teleport_anim,"animation_finished")
	status = temp_status
	
func stop():
	if status == to_be:
		$Be_sprites/idle.show()
		$Be_sprites/front.hide()
		$Be_sprites/back.hide()
		$Be_sprites/side.hide()
	else:
		$Not_be_sprites/idle.show()
		$Not_be_sprites/front.hide()
		$Not_be_sprites/back.hide()
		$Not_be_sprites/side.hide()
	status = transformation
	
func dont_stop():
	status = to_be
	

###################################################
#     ~ It ain't much, but it's honest work ~     #
###################################################
##        #####################################   #
##          #############################         #
####            ######################            #
#####            #####           #                #
#######                                         ###
#########  #                                   ####
###########                              ## #######
#########      ###               ###       ########
#########     # ###             #####       #######
########      #####             ####         ######
########       ##                ##          ######
#######               ##                    #######
#######  ##           ####            ##      #####
####### #####        ########       #######    ####
########               #####                    ###
#########                                       ###
##########                                       ##
#########                                         #
###################################################
#               ~ KeichiTS - 2022 ~               #
###################################################


func _on_energy_timer_timeout():
	if energy > 0:
		energy -= 10
		if energy <= 20:
			$Transitions/time_short.play()
	elif energy <= 0 and timer_status == on_timer:
		$Transitions/transf.play()
		timer_status = out_timer
		energy = 0
		status = transformation
		collision_layer = 1
		$Not_be_sprites.hide()
		$Transitions/anim.play("Detransformation")
		yield($Transitions/anim,"animation_finished")
		status = to_be
		$Be_sprites.show()
		$energy_timer.stop()
		
		
		
	$Energy.text = str(energy)


func _on_Level10_pressed():
	get_parent().get_parent().reset_level()
	$teleport_anim.play("Event3")
	yield($teleport_anim,"animation_finished")
	get_tree().change_scene("res://Levels/Title_screen.tscn")
