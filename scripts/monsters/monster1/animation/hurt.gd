extends State

@export var anim_sprite: AnimatedSprite2D
@export var player: CharacterBody2D

func enter() -> void:
    anim_sprite.animation_finished.connect(on_animation_finished)
    anim_sprite.play("hurt")
    player.velocity = Vector2.ZERO
    
func exit() -> void:
    anim_sprite.animation_finished.disconnect(on_animation_finished)
    
func update(delta: float) -> void:
    pass

func physics_update(delta: float) -> void:
    pass
    
func on_animation_finished():
    transitioned.emit(self,"walk")
    
