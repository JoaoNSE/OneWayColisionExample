extends StaticBody2D

"""
##### Código do repositório: OneWayColisionExample #####
## (https://github.com/JoaoNSE/OneWayColisionExample) ##
Criado por João Henrique Nobre em 08/04/2019

Código que faz com que o jogador possa descer da plataforma pressionando
baixo + pulo.
"""

#Variável que indica se o jogador esta sobre a plataforma
var player_on = false

func _ready():
	set_process(true)

func _process(delta):
	#Quando o usuário está pressionando o botão de pulo e o botão para baixo
	#ao mesmo tempo e o jogador está sobre a plataforma
	if Input.is_action_pressed("jump") and Input.is_action_pressed("ui_down") and player_on:
		#desabilita a colisão da plataforma.
		#Deve ser chamada com call_deferred.
		$CollisionShape2D.call_deferred("set_disabled", true)

#Chamada quando um corpo entra na area da plataforma
#Sinal disparado por $Area2D
func _on_Area2D_body_entered(body):
	#Se o corpo físico for o jogador
	if body.name == "Character":
		player_on = true

#Chamada quando um corpo saia area da plataforma
#Sinal disparado por $Area2D
func _on_Area2D_body_exited(body):
	#Se o corpo físico for o jogador
	if body.name == "Character":
		player_on = false
		#habilita a colisão da plataforma.
		#Deve ser chamada com call_deferred.
		$CollisionShape2D.call_deferred("set_disabled", false)
