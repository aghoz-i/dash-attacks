class_name DashAnimationState
extends State

@export var anim_sprite: AnimatedSprite2D
@export var character_body: Node2D
@export var player: CharacterBody2D
@export var hurtbox_collision: CollisionShape2D
@export var dash_speed: int
@export var dash_duration: float

var dash_timer: float

func enter() -> void:
    dash_timer = dash_duration
    anim_sprite.play("dash")
    hurtbox_collision.disabled = true
    var direction = get_direction()
    if direction.x < 0:
        character_body.scale.x = -1
    elif direction.x > 0:
        character_body.scale.x = 1
    elif direction == Vector2.ZERO:
        direction = Vector2(character_body.scale.x, 0)
    var normalizer = 1/1.4 if direction.x and direction.y else 1
    player.velocity = direction * dash_speed * normalizer
    
func exit() -> void:
    hurtbox_collision.disabled = false
    
func update(delta: float) -> void:
    if dash_timer > 0:
        dash_timer -= delta
    else:
        if Input.is_action_just_pressed("attack"):
            transitioned.emit(self, "attack")
            return
        var direction = get_direction()
        if !direction.x and !direction.y:
            transitioned.emit(self, "idle")
            return
        else:
            transitioned.emit(self, "walk")

func physics_update(delta: float) -> void:
    pass
    
func get_direction() -> Vector2:
    var horizontal_movement = Input.get_axis("move_left","move_right")
    var vertical_movement = Input.get_axis("move_up","move_down")
    return Vector2(horizontal_movement, vertical_movement)
