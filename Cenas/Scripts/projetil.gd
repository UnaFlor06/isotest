extends Area2D

var velocidade = 400
var direcao = Vector2.DOWN

@onready var sprite = $Sprite2D 

var pertence_ao_jogador = false 

func _process(delta):
	position += direcao * velocidade * delta

func rebater():
	var inimigo = get_tree().get_nodes_in_group("inimigo").front()
	if inimigo:
		direcao = (inimigo.global_position - global_position).normalized()
	else:
		direcao *= -1 
	velocidade *= 0.75
	sprite.texture = preload("res://Assets/projetil/BolhaRebatida.png")
