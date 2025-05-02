extends State

@export var projectile_scene: PackedScene
@export var firing_position: Marker2D
@export var character_body: Node2D
@export var anim_sprite: AnimatedSprite2D
@export var player: CharacterBody2D
var target: CharacterBody2D

func enter() -> void:
    anim_sprite.animation_finished.connect(on_animation_finished)
    anim_sprite.play("attack1")
    target = player.get_parent().get_node_or_null("Player")
    if !target:
        transitioned.emit("idle")
    
func exit() -> void:
    anim_sprite.animation_finished.disconnect(on_animation_finished)
    
func update(delta: float) -> void:
    pass

func physics_update(delta: float) -> void:
    pass
    
func on_animation_finished():
    var spawned_projectile := projectile_scene.instantiate()
    
    var face_direction = get_face_direction()
    if face_direction.x < 0:
        character_body.scale.x = -1
    elif face_direction.x > 0:
        character_body.scale.x = 1
    elif face_direction == Vector2.ZERO:
        face_direction = Vector2(-character_body.scale.x, 0)
    
    var shoot_direction = get_direction()
    get_tree().root.add_child(spawned_projectile)
    spawned_projectile.scale *= 3
    spawned_projectile.global_position = firing_position.global_position
    spawned_projectile.rotation = shoot_direction.angle()
    transitioned.emit(self,"walk")
    
func get_direction() -> Vector2:
    var direction = target.global_position - firing_position.global_position
    return direction
    
func get_face_direction() -> Vector2:
    var direction = player.global_position - target.global_position
    return direction.normalized()
