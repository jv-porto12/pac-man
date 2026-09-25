class_name Ghost
extends CharacterBody2D

@export var speed: float = 80.0

var player: CharacterBody2D

func _ready() -> void:
	add_to_group("ghost")
	player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	
func _physics_process(delta: float) -> void:
	var direction: Vector2 = get_target_direction()
	velocity = direction * speed
	move_and_slide()
	
func _draw() -> void:
	draw_circle(Vector2.ZERO, 15.0, Color.RED)
	
func get_target_direction() -> Vector2:
	return Vector2.ZERO
