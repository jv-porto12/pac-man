extends Ghost

func get_target_direction() -> Vector2:
	if player == null:
		return Vector2.ZERO

	return global_position.direction_to(player.global_position)
