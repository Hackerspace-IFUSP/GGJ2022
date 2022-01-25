#A Code by: KeichiTS - 01.2022

extends KinematicBody2D



var velocity = Vector2.ZERO

export var speed = 50
export var dash_multiplier = 50


func _ready():
	pass

func _physics_process(delta):
	
	move(delta)
	

	

func move(val):

#### Faz o bixo andar

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
	if input_vector != Vector2.ZERO:
		velocity += input_vector
		velocity = velocity * val * speed

	else:
		velocity = Vector2.ZERO  
		
	move_and_collide(velocity)



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



