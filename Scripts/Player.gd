#A Code by: KeichiTS - 01.2022

extends KinematicBody2D



var velocity = Vector2.ZERO

export var speed = 12000
export var inertia = 100
export var energy = 100

enum{to_be,not_to_be}
var status = to_be 

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
	get_tree().reload_current_scene()

### Faz o bixo ser ou não ser
func to_be():
	if Input.is_action_just_pressed("ui_change"):
		if status == to_be and energy > 0:
			$ColorRect.color.a = .5
			collision_layer = 2
			status = not_to_be
			$energy_timer.start()
			
		else:
			$ColorRect.color.a = 1
			collision_layer = 1
			status = to_be
			$energy_timer.stop()
	

###

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
	elif energy <= 0:
		energy = 0
		status = to_be
		$ColorRect.color.a = 1
		collision_layer = 1
		
	$Energy.text = str(energy)
