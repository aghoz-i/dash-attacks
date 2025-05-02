class_name DeathAnimationState
extends State

@export var anim_sprite: AnimatedSprite2D
@export var player: CharacterBody2D
@export var shadow: Sprite2D
@export var hp_bar: Node2D

var dash_timer: float

func enter() -> void:
    anim_sprite.animation_finished.connect(on_animation_finished)
    anim_sprite.play("death")
    player.velocity = Vector2.ZERO
    
func exit() -> void:
    anim_sprite.animation_finished.disconnect(on_animation_finished)
    
func update(delta: float) -> void:
    pass

func physics_update(delta: float) -> void:
    pass
    
func get_direction() -> Vector2:
    var horizontal_movement = Input.get_axis("move_left","move_right")
    var vertical_movement = Input.get_axis("move_up","move_down")
    return Vector2(horizontal_movement, vertical_movement)
    
func on_animation_finished():
    #player.gameover()
    #transitioned.emit(self, "idle")
    shadow.hide()
    hp_bar.hide()
    pass
    
