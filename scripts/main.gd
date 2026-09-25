extends Node2D


@onready var pellets: Node2D = $Pellets
@onready var player: CharacterBody2D = $Player
@onready var win_label: Label = $WinLabel
@onready var lose_label: Label = $LoseLabel

@onready var ghosts: Node2D = $Ghosts
@onready var chaser_spawn: Marker2D = $GhostSpawnPoints/ChaserSpawn
@onready var patrol_spawn: Marker2D = $GhostSpawnPoints/PatrolSpawn

func _ready() -> void:
	GameManager.game_state_changed.connect(_on_game_state_changed)
	GameManager.start_game()
	spawn_ghosts()

func _process(_delta: float) -> void:
	if GameManager.current_state == GameManager.GameState.PLAYING:
		if pellets.get_child_count() == 0:
			GameManager.win_game()


func _on_player_died() -> void:
	GameManager.lose_game()


func _on_game_state_changed(new_state: GameManager.GameState) -> void:
	if new_state == GameManager.GameState.WON:
		win_label.visible = true
		stop_gameplay()

	elif new_state == GameManager.GameState.LOST:
		lose_label.visible = true
		stop_gameplay()


func stop_gameplay() -> void:
	player.set_physics_process(false)

	for ghost in get_tree().get_nodes_in_group("ghost"):
		ghost.set_physics_process(false)
		
func spawn_ghosts() -> void:
	var chaser: Ghost = GhostFactory.create_ghost(GhostFactory.GhostType.CHASER)
	var patrol: Ghost = GhostFactory.create_ghost(GhostFactory.GhostType.PATROL)

	ghosts.add_child(chaser)
	ghosts.add_child(patrol)

	chaser.global_position = chaser_spawn.global_position
	patrol.global_position = patrol_spawn.global_position
