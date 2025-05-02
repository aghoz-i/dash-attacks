class_name IdleAnimationState
extends State

@export var anim_sprite: AnimatedSprite2D
@export var character_body: Node2D
@export var player: CharacterBody2D
@export var dash_state: DashState
@export var skill_state: SkillState
@export var hurtbox: Hurtbox

func on_hurtbox_damaged(attack):
    transitioned.emit(self, "hurt")
    return

func enter() -> void:
    hurtbox.damaged.connect(on_hurtbox_damaged)
    anim_sprite.play("idle")
    
func exit() -> void:
    hurtbox.damaged.disconnect(on_hurtbox_damaged)
    
func update(delta: float) -> void:
    if Input.is_action_just_pressed("skill") and skill_state.current_state.name != "skill_cooldown":
        transitioned.emit(self, "skill")
        return
    
    if Input.is_action_just_pressed("attack"):
        transitioned.emit(self, "attack")
        return
        
    if Input.is_action_just_pressed("dash") and dash_state.current_state.name != "dash_cooldown":
        transitioned.emit(self, "dash")
        return
        
    if Input.get_axis("move_left", "move_right") or Input.get_axis("move_down", "move_up"):
        transitioned.emit(self, "walk")
        return

func physics_update(delta: float) -> void:
    player.velocity = Vector2.ZERO
