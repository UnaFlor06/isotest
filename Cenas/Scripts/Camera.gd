extends Node2D

@onready var player = $Player
var paused := false
@onready var pause_menu = $PauseMenu
@onready var resume_btn = $PauseMenu/Panel/Resume
@onready var config_btn = $PauseMenu/Panel/Config

var comecou = false
var cameraOn = false
@onready var cam: Camera2D = $Player/Camera2D
	
func _ready():
	
	
	if cameraOn:
		cam.zoom = Vector2(3.5, 3.5)
		player.add_child(cam)
		cam.make_current() 
		await get_tree().create_timer(0.5).timeout
		zoom_out()
	else:
		cam.zoom = Vector2(1.75,1.75)
		player.add_child(cam)
		cam.make_current()
		player.habilitar_controles()
	
func zoom_out():
	var tween = create_tween()
	tween.tween_property(cam, "zoom", Vector2(1.25, 1.25), 1.25)
	await tween.finished
	player.habilitar_controles()
	
