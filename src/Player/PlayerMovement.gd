class_name PlayerMovement
extends Node2D
@export var speed = 300.0
var parent: CharacterBody2D
var sprite: AnimatedSprite2D

func _ready() -> void:
	parent = get_parent() as CharacterBody2D
	if not parent:
		push_error("Component parent has to be CharacterBody2D")
	sprite = parent.get_node_or_null("Sprite") as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not parent:
		return
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	parent.velocity = direction * speed
	parent.move_and_slide()
	
	if sprite:
		if direction != Vector2.ZERO:
			sprite.play("Walking")
		else:
			sprite.play("Idle")
