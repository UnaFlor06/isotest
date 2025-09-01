extends CanvasLayer

var prox_cena = 0
@onready var Pause_cena = preload("res://Cenas/pause_menu.tscn")
var instancia

func _on_botao_pressed() -> void:
	instancia = Pause_cena.instantiate()
	visible = false
	get_tree().paused = false
