extends CharacterBody2D

const SPEED = 250.0
@onready var anim = $Animacao

var bussola= Vector2(0,1)
var z := 0

var Dash_speed = 600
var dashing = false
var dash_time = 0.3

var atq = false
var attack_time = 0.4

var pode_mover = false

func habilitar_controles():
	pode_mover = true

func _physics_process(delta: float) -> void:
	
	if not pode_mover:
		return
	if atq:
		return
	
	var horizontal := Input.get_axis("mover_left", "mover_right")
	var vertical := Input.get_axis("mover_up","mover_down")
	var direction = Vector2(horizontal, vertical)
	
	var mouse_pos = get_global_mouse_position()
	var mouse_click = Input.is_action_just_pressed("mouse_click_left")
	var to_mouse = (mouse_pos - global_position).normalized()
	
	if not atq and mouse_click:
		atq = true
		
		if abs(to_mouse.x) > abs(to_mouse.y):
			if to_mouse.x > 0:
				anim.play("Attack_right")
			else:
				anim.play("Attack_left")
		else:
			if to_mouse.y > 0:
				anim.play("Attack_down")
			else:
				anim.play("Attack_up")
		velocity = Vector2.ZERO
		move_and_slide()
		
		await get_tree().create_timer(attack_time).timeout
		atq = false
		return
		
	if Input.is_action_just_pressed("dash") and not dashing:
		dashing = true
		
		if direction == Vector2.ZERO:#quando nao estiver nenhuma tecla sendo pressionada
			
			if abs(to_mouse.x) > abs(to_mouse.y):
				if to_mouse.x > 0:
					anim.play("Dash_right")
				else:
					anim.play("Dash_left")
			else:
				if to_mouse.y > 0:
					anim.play("Dash_down")
				else:
					anim.play("Dash_up")
		else:
			
			if bussola.x > 0:
				anim.play("Dash_right")
			elif bussola.x < 0:
				anim.play("Dash_left")
			elif bussola.y < 0:
				anim.play("Dash_up")
			elif bussola.y > 0:
				anim.play("Dash_down")
			
		
		if direction != Vector2.ZERO:
			bussola = direction.normalized()
		else:
			bussola = to_mouse
			
		await get_tree().create_timer(dash_time).timeout
		dashing = false
		return
		
	if dashing:
		velocity = bussola * 600
		move_and_slide()
		return
	
	if direction.length() > 0:
		direction = direction.normalized()
		bussola = direction

	var vel_x = direction.x * SPEED
	var vel_y = direction.y * SPEED
	if direction.y < 0:
		vel_y *= 0.75
	velocity = Vector2 (vel_x,vel_y)
		
	
	
	
	if direction == Vector2.ZERO:
		
		if abs(to_mouse.x) > abs(to_mouse.y):
			if to_mouse.x > 0:
				anim.play("idle_right")
			else:
				anim.play("idle_left")
		else:
			if to_mouse.y > 0:
					anim.play("idle_down")
			else:
				anim.play("idle_up")
	else:
		if horizontal != 0 :
			
			if horizontal < 0:
				anim.play("walk_left")
			else:
				anim.play("walk_right")
			
		elif vertical != 0:
			
			if vertical < 0:
				anim.play("walk_up")
			else:
				anim.play("walk_down")
				
	
	move_and_slide()

	
