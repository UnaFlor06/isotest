extends CharacterBody2D

@export var cena_projetil: PackedScene
@onready var anim = $Animacao

var pode_atirar = true

func _process(delta):
	pode_atirar = true
	anim.play("default")
	if anim.frame == 6 and pode_atirar:
		atirar()
		
	pode_atirar = false
	

func atirar():
	if not cena_projetil:
		return

	var projetil = cena_projetil.instantiate()
	projetil.position = $PontoDeDisparo.global_position
	get_parent().add_child(projetil)
