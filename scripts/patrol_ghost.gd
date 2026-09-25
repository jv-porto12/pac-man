extends Ghost

func get_target_direction() -> Vector2:
	return Vector2.RIGHT

func _draw() -> void:
	draw_circle(Vector2.ZERO, 15.0, Color.PINK)
