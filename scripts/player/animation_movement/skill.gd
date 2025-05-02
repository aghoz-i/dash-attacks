class_name SkillAnimationState
extends State

@export var anim_sprite: AnimatedSprite2D
@export var character_body: Node2D
@export var player: CharacterBody2D
@export var skill_state: SkillState
@export var hurtbox: Hurtbox

func on_hurtbox_damaged(attack):
    transitioned.emit(self, "hurt")
    return
    
func enter() -> void:
    hurtbox.damaged.connect(on_hurtbox_damaged)
    anim_sprite.animation_finished.connect(on_animation_finished)
    anim_sprite.play("skill")
    player.velocity = Vector2.ZERO
    
func exit() -> void:
    hurtbox.damaged.disconnect(on_hurtbox_damaged)
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
    transitioned.emit(self, "idle")
