extends Area2D

func _ready() -> void:
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	var sprite := $Sprite2D
	tween.tween_property(sprite, "scale", Vector2(1.5, 1.5), 0.2)
	tween.tween_property(sprite, "scale", Vector2(1, 1), 0.2)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Saiu da tela!")
	queue_free()
