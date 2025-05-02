class_name SkillCooldownState
extends State

@export var skill_cooldown: float

var cooldown_timer: float

func enter() -> void:
    cooldown_timer = skill_cooldown
    
func exit() -> void:
    pass
    
func update(delta: float) -> void:
    if cooldown_timer > 0:
        cooldown_timer -= delta
    else:
        transitioned.emit(self, "skill_ready")
        return

func physics_update(delta: float) -> void:
    pass
