extends Area2D

func _draw() -> void:
	draw_circle(Vector2.ZERO, 6.0, Color.WHITE)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
