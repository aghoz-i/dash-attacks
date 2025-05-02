class_name WalkAnimationState
extends State

@export var anim_sprite: AnimatedSprite2D
@export var character_body: Node2D
@export var player: CharacterBody2D
@export var walk_speed: int
@export var dash_state: DashState
@export var skill_state: SkillState
@export var hurtbox: Hurtbox

func on_hurtbox_damaged(attack):
    transitioned.emit(self, "hurt")
    return

func enter() -> void:
    hurtbox.damaged.connect(on_hurtbox_damaged)
    anim_sprite.play("walk")
    
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
    var direction = get_direction()
    if !direction.x and !direction.y:
        transitioned.emit(self, "idle")
        return
    
    if direction.x < 0:
        character_body.scale.x = -1
    elif direction.x > 0:
        character_body.scale.x = 1

func physics_update(delta: float) -> void:
    var direction = get_direction()
    var normalizer = 1/1.4 if direction.x and direction.y else 1
    player.velocity = direction * walk_speed * normalizer
    
func get_direction() -> Vector2:
    var horizontal_movement = Input.get_axis("move_left","move_right")
    var vertical_movement = Input.get_axis("move_up","move_down")
    return Vector2(horizontal_movement, vertical_movement)
