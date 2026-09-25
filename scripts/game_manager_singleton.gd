extends Node

enum GameState {
	PLAYING,
	WON,
	LOST
}

signal game_state_changed(new_state: GameState)

var current_state: GameState = GameState.PLAYING

func start_game() -> void:
	set_state(GameState.PLAYING)


func set_state(new_state: GameState) -> void:
	current_state = new_state
	game_state_changed.emit(current_state)
	
func win_game() -> void:
	if current_state != GameState.PLAYING:
		return

	set_state(GameState.WON)

func lose_game() -> void:
	if current_state != GameState.PLAYING:
		return

	set_state(GameState.LOST)
