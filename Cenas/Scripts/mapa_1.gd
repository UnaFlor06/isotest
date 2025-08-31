extends Node2D

@export var minhas_camadas: Array[TileMapLayer] = []


@export var duracao_fade: float = 0.5


func _on_zona_parede_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		for camada in minhas_camadas:
			camada.modulate.a = 0.1

func _on_zona_de_opacidade_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		for camada in minhas_camadas:
			camada.modulate.a = 1.0


func _on_zona_teto_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$teto.modulate.a = 0.1
		$teto2.modulate.a = 0.1

func _on_zona_teto_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$teto.modulate.a = 1
		$teto2.modulate.a = 1
