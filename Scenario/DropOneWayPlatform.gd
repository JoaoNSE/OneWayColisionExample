extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("jump") and Input.is_action_pressed("ui_down") and player_on:
		
		$CollisionShape2D.call_deferred("set_disabled", true)

func _on_Area2D_body_entered(body):
	
	if body.name == "Character":
		print("entrou")
		player_on = true

func _on_Area2D_body_exited(body):
	
	if body.name == "Character":
		print("saiu")
		player_on = false
		$CollisionShape2D.call_deferred("set_disabled", false)
