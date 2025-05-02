extends State

@export var anim_sprite: AnimatedSprite2D
@export var player: CharacterBody2D

var last_animation
func enter():
    anim_sprite.play("hurt")
    anim_sprite.animation_finished.connect(on_animation_finished)

func exit():
    anim_sprite.animation_finished.disconnect(on_animation_finished)

func physics_update(delta):
    player.velocity = Vector2.ZERO
    
func on_animation_finished():
    transitioned.emit(self, "idle")
    return
    
