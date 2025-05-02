class_name AttackAnimationState
extends State

@export var anim_sprite: AnimatedSprite2D
@export var player: CharacterBody2D
@export var dash_state: DashState
@export var sword_animation: AnimationPlayer
@export var character_body: Node2D

var attacks: Array[String] = ["attack1", "attack2", "attack3"]

@export var hurtbox: Hurtbox

func on_hurtbox_damaged(attack):
    transitioned.emit(self, "hurt")
    return

func enter() -> void:
    anim_sprite.play("idle")
    var face_direction = get_face_direction()
    if face_direction.x:
        character_body.scale.x = -1
    elif face_direction.y:
        character_body.scale.x = 1
    hurtbox.damaged.connect(on_hurtbox_damaged)
    anim_sprite.animation_finished.connect(on_animation_finished)
    rand_from_seed(get_process_delta_time())
    var attack_number = randi_range(0, 2)
    anim_sprite.play(attacks[attack_number])
    sword_animation.play(attacks[attack_number])
    player.velocity = Vector2.ZERO
    
func exit() -> void:
    hurtbox.damaged.disconnect(on_hurtbox_damaged)
    anim_sprite.animation_finished.disconnect(on_animation_finished)
    
func update(delta: float) -> void:
    if Input.is_action_just_pressed("dash") and dash_state.current_state.name != "dash_cooldown":
        transitioned.emit(self, "dash")
        return

func physics_update(delta: float) -> void:
    pass
    
func get_direction() -> Vector2:
    var horizontal_movement = Input.get_axis("move_left","move_right")
    var vertical_movement = Input.get_axis("move_up","move_down")
    return Vector2(horizontal_movement, vertical_movement)
    
func get_face_direction() -> Vector2:
    var left = Input.is_action_pressed("move_left")
    var right = Input.is_action_pressed("move_right")
    return Vector2(left, right)
    

func on_animation_finished():
    transitioned.emit(self, "idle")
    return
