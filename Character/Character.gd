extends KinematicBody2D

"""
##### Código do repositório: OneWayColisionExample #####
## (https://github.com/JoaoNSE/OneWayColisionExample) ##
Criado por João Henrique Nobre em 08/04/2019

Código de comportamento de movimentação do personagem.
"""

var GRAV = Vector2(0, 9)

var velocity = Vector2(0, 0)
var spd = 250
var jump_force = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity += GRAV
	control(delta)
	move_and_slide(velocity)
	
func control(delta):
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
		$Blue_Right1.scale.x = -1 * abs($Blue_Right1.scale.x)
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		$Blue_Right1.scale.x = abs($Blue_Right1.scale.x)
	if Input.is_action_just_pressed("jump") and !Input.is_action_pressed("ui_down"):
		if $RayCast2D.is_colliding():
			velocity.y = -jump_force
		
	velocity.x *= spd

