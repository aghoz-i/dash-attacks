class_name Health
extends Node

signal health_changed(health: float)

@export var hurtbox : Hurtbox
@export var animation_player : AnimationPlayer

@export var max_health : float
@onready var health := max_health

@onready var actor = get_owner()


func _ready():
    if hurtbox:
        hurtbox.damaged.connect(on_damaged)


func on_damaged(attack: Attack):
    
    health -= attack.damage
    health_changed.emit(health)
    
    if health <= 0:
        health = 0
        actor.handle_death()

func get_health_percentage():
    return health/max_health
