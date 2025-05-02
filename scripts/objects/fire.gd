class_name FireBall
extends CharacterBody2D
@export var hitbox : Area2D

@export var speed: int
@export var max_pierce: int 
@export var object_lifetime: float

var current_pierce_count := 0
var lifetime: float


func _ready():
    lifetime = object_lifetime
    if hitbox:
        hitbox.hit_enemy.connect(on_enemy_hit)

func _process(delta: float) -> void:
    if lifetime > 0:
        lifetime -= delta
    else:
        queue_free()

func _physics_process(delta: float) -> void:
    var direction = Vector2.RIGHT.rotated(rotation)
    
    velocity = direction*speed
    
    var collision := move_and_collide(velocity*delta)
    
    if collision:
        queue_free()


func on_enemy_hit():
    current_pierce_count += 1
    
    if current_pierce_count >= max_pierce:
        queue_free()
