class_name SkillReadyState
extends State

@export var projectile_scene: PackedScene
@export var firing_position: Marker2D
@export var character_body: Node2D

func enter() -> void:
    pass
    
func exit() -> void:
    var spawned_projectile := projectile_scene.instantiate()
    
    var direction = get_direction()
    if direction.x < 0:
        character_body.scale.x = -1
    elif direction.x > 0:
        character_body.scale.x = 1
    elif direction == Vector2.ZERO:
        direction = Vector2(character_body.scale.x, 0)
    
    get_tree().root.add_child(spawned_projectile)
    spawned_projectile.scale *= 3
    spawned_projectile.global_position = firing_position.global_position
    spawned_projectile.rotation = direction.angle()
    
    
func update(delta: float) -> void:
    if Input.is_action_just_pressed("skill"):
        transitioned.emit(self, "skill_cooldown")

func physics_update(delta: float) -> void:
    pass

func get_direction() -> Vector2:
    var horizontal_movement = Input.get_axis("move_left","move_right")
    var vertical_movement = Input.get_axis("move_up","move_down")
    return Vector2(horizontal_movement, vertical_movement)
