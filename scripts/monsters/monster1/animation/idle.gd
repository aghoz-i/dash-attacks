extends State

@export var anim_sprite: AnimatedSprite2D
@export var character_body: Node2D
@export var player: CharacterBody2D
@export var scan_range: float

var target: CharacterBody2D

func enter() -> void:
    anim_sprite.play("idle")
    
func exit() -> void:
    pass
    
func update(delta: float) -> void:
    if scan_for_enemy():
        transitioned.emit(self, "walk")

func physics_update(delta: float) -> void:
    player.velocity = Vector2.ZERO

func scan_for_enemy() -> CharacterBody2D:
    return player.get_parent().get_node_or_null("Player")

func get_direction() -> Vector2:
    print(player.get_parent())
    return Vector2.ZERO
