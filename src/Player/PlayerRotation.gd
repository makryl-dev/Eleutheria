class_name PlayerRotation
extends Node2D
var parent: CharacterBody2D

func _ready() -> void:
	parent = get_parent() as CharacterBody2D
	if not parent:
		push_error("Component parent has to be CharacterBody2D")

func _physics_process(delta: float) -> void:
	if not parent:
		return
	
	if Input.is_action_pressed("secondary_action"):
		parent.look_at(get_global_mouse_position())
