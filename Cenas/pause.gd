extends CanvasLayer

@onready var Config_cena = preload("res://Cenas/Menu/Config.tscn")
var instancia

func _ready() -> void:
	visible = false
	instancia = Config_cena.instantiate()
	call_deferred("_adicionar_config")

func _adicionar_config():
	var cena_principal = get_tree().current_scene
	cena_principal.add_child(instancia)
	instancia.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			visible = true
		else:
			get_tree().paused = false
			visible = false


func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_configuração_pressed() -> void:
	instancia.visible = true
	visible = false

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Cenas/Menu/MenuPrincipal.tscn")
