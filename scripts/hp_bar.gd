extends Node2D

@export var player: CharacterBody2D
@export var health: Node

func _physics_process(delta: float) -> void:
    var current_health_percentage = health.get_health_percentage()
    if current_health_percentage <= 0:
        $left.scale.x = 0
    else:
        $left.scale.x = current_health_percentage
