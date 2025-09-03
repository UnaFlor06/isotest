extends CharacterBody2D

@export var cena_projetil: PackedScene
@onready var anim = $Animacao

var pode_atirar = true

func _process(delta):
	anim.play("default")
	if anim.frame == 6:
		atirar()
		pode_atirar = false

func atirar():
	if not cena_projetil:
		return

	var novo_projetil = cena_projetil.instantiate()
	novo_projetil.position = $PontoDeDisparo.global_position
	get_parent().add_child(novo_projetil)
	remover_projetil(novo_projetil)

func remover_projetil(proj):
	await get_tree().create_timer(1.0).timeout
	if proj and proj.is_inside_tree():
		proj.queue_free()
