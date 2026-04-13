extends Node2D

var total : float = 0
const SPEED : int = 100 # pixels/segundo

func _ready() -> void:
	update_score(total)
	
func _process(delta: float) -> void:
#	print(delta)
	total += delta
	update_score(total)
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta

func _input(event: InputEvent) -> void:
	#print(event.as_text())
	if event.is_action_pressed("ui_left"):
		print("Left arrow")
#		position.x += SPEED * delta
	
func update_score(current_score: float) -> void:
	$Score.text = "Score: " + str(current_score)	
