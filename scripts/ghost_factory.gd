class_name GhostFactory
extends RefCounted

enum GhostType {
	CHASER,
	PATROL
}

const CHASER_GHOST_SCENE: PackedScene = preload("res://scenes/chaser_ghost.tscn")
const PATROL_GHOST_SCENE: PackedScene = preload("res://scenes/patrol_ghost.tscn")

static func create_ghost(type: GhostType) -> Ghost:
	var ghost: Ghost

	match type:
		GhostType.CHASER:
			ghost = CHASER_GHOST_SCENE.instantiate() as Ghost

		GhostType.PATROL:
			ghost = PATROL_GHOST_SCENE.instantiate() as Ghost

		_:
			return null

	return ghost
