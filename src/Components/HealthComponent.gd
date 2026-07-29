extends Node
class_name HealthComponent

signal death
signal health_changed(health: int)

@export var max_health: int = 100
@onready var health: int = max_health

func damage(amount: int) -> void:
	if health <= 0:
		return
	health = max(0, health - amount)
	health_changed.emit(health)
	
	if health == 0:
		death.emit()

func heal(amount: int) -> void:
	if health <= 0:
		return
	health = min(max_health, health + amount)
	health_changed.emit(health)
