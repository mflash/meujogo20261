extends Node2D

@onready var score := 0
@onready var hud := $HUD

func _on_anim_player_jumped() -> void:
	print("Sinal de jump recebido!")
	score += 1	
	hud.setScore(score)	
