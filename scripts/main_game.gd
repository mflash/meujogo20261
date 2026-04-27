extends Node2D

@onready var score := 0
@onready var hud := $HUD

var scene_limit: Marker2D
var player: CharacterBody2D

var current_scene = null

func  _ready() -> void:
	var qtd_filhos = get_child_count()
	# Assumindo que o level é SEMPRE o último
	# nodo da cena!
	var level = get_child(qtd_filhos-1)
	player = level.get_node("AnimPlayer")
	scene_limit = level.get_node("SceneLimit")
	print(player)
	print(scene_limit)
	
func _on_anim_player_jumped() -> void:
	print("Sinal de jump recebido!")
	score += 1	
	hud.setScore(score)	

func _physics_process(delta: float) -> void:		
		
	if scene_limit == null:
		scene_limit = current_scene.get_node("SceneLimit")
		player = current_scene.get_node("AnimPlayer")
		
		#print(player.position.y, " ", scene_limit.position.y)
	
	if scene_limit != null:
		if player.position.y > scene_limit.position.y:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
			
		if Input.is_action_just_pressed("next_level"):
			call_deferred("goto_scene", "res://scenes/level2.tscn")
		
func goto_scene(path: String):
	var qtd_filhos = get_child_count()
	print("Total children: "+str(qtd_filhos))
	
	var level := get_child(qtd_filhos-1)
	level.free()
	var new_scene : PackedScene = ResourceLoader.load(path)
	current_scene = new_scene.instantiate()
	scene_limit = null # indica a troca de cena
	get_tree().get_root().get_child(0).add_child(current_scene)
