extends CharacterBody2D

@export var speed = 800 # pixels/segundo
@export var rotation_speed = 1.5 # radianos/segundo

var rotation_direction : int = 0
var target = position # target = posição inicial do nodo

func _input(event: InputEvent) -> void:
# Use is_action_pressed to only accept single taps as input instead of mouse drags.
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()
		print(target)
		
func get_rotation_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * speed
	print(transform.x)
	
func get_8way_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	print(velocity)
	
func get_mouse_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * speed
	print(transform.x)

func _physics_process(delta):
	# 1. Movimento em 8 direções
	#get_8way_input()
	#move_and_slide()
	#position += velocity * delta	# sem colisão
	
	# 2. Gira e movimenta na direção em que estiver apontado
	#get_rotation_input()
	#rotation_degrees
	#rotation += rotation_direction * rotation_speed * delta
	#move_and_slide()
	
	# 3. Gira acompanhando o mouse e movimenta na direção dele
	#get_mouse_input()
	#move_and_slide()
	
	# 4. Click and move
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
	
	
