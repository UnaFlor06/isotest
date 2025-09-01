extends TextureRect


func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/cena_principal.tscn")

func _on_opcao_pressed() -> void:
	pass

func _on_sair_pressed() -> void:
	get_tree().quit()
