class_name PlayerMovement
extends Node2D

@export var speed = 150.0
@export var sprint_multiplier = 1.75

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
	
	var is_sprinting = Input.is_action_pressed("sprint")
	var is_rotating = Input.is_action_pressed("secondary_action")
	var current_speed = speed * (sprint_multiplier if is_sprinting else 1.0) * (0.5 if is_rotating else 1.0)
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	parent.velocity = direction * current_speed
	parent.move_and_slide()
	
	if direction != Vector2.ZERO:
		parent.rotation = direction.angle()
		if sprite:
			sprite.speed_scale = (sprint_multiplier if is_sprinting else 1.0)
			if is_rotating:
				sprite.play("Rotating")
			else:
				sprite.play("Walking")
	else:
		if sprite:
			sprite.speed_scale = 1.0
			sprite.play("Idle")
