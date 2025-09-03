extends Area2D

func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		if area.has_method("rebater"):
			area.rebater()
