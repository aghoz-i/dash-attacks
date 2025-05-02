extends State

@export var anim_sprite: AnimatedSprite2D
@export var character_body: Node2D
@export var player: CharacterBody2D
@export var walk_speed: float
@export var launch_attack_cooldown: float
@export var min_distance: float
@export var hurtbox: Hurtbox

var target: CharacterBody2D
var attack_cooldown: float

func on_hurtbox_damaged(attack):
    transitioned.emit(self, "hurt")
    return

func enter() -> void:
    hurtbox.damaged.connect(on_hurtbox_damaged)
    if attack_cooldown <= 0:
        attack_cooldown = launch_attack_cooldown
    anim_sprite.play("walk")
    target = player.get_parent().get_node_or_null("Player")
    if !target:
        transitioned.emit("idle")
    
func exit() -> void:
    hurtbox.damaged.disconnect(on_hurtbox_damaged)
    target = null
    
func update(delta: float) -> void:
    if attack_cooldown > 0:
        attack_cooldown -= delta
    else:
        transitioned.emit(self, "attack")

func physics_update(delta: float) -> void:
    var distance = get_distance()
    var direction = get_direction()
    if direction.x < 0:
        character_body.scale.x = 1
    if direction.x > 0:
        character_body.scale.x = -1
    if distance < min_distance:
        player.velocity = Vector2.ZERO
    else:
        var normalizer = 1/1.4 if direction.x and direction.y else 1
        player.velocity = direction * walk_speed

func get_direction() -> Vector2:
    var direction = target.global_position - player.global_position
    return direction.normalized()
    
func get_distance() -> float:
    var player_pos = player.global_position
    var target_pos = target.global_position
    var distance = player_pos.distance_to(target_pos)
    return distance
