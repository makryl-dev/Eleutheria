extends Area2D
class_name InteractionComponent

@export var action_name: String = "Interact"

var interact: Callable = func():
	pass


func _on_body_entered(body: Node2D) -> void:
	InteractionManager.register_area(self)


func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unregister_area(self)
