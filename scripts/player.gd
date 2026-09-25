extends CharacterBody2D
signal died

enum PlayerState {
	ALIVE,
	DEAD
}

var current_state: PlayerState = PlayerState.ALIVE

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up",  "move_down")
	velocity = direction * speed
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider()
		
		if collider is Ghost:
			die()

func _draw() -> void:
	draw_circle(Vector2.ZERO, 15.0, Color.YELLOW)
	
func die() -> void:
	if current_state == PlayerState.DEAD:
		return
	
	current_state = PlayerState.DEAD
	set_physics_process(false)
	died.emit()
	
