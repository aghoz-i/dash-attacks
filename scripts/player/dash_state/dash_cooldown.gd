class_name DashCooldownState
extends State

@export var dash_cooldown: float

var cooldown_timer: float

func enter() -> void:
    cooldown_timer = dash_cooldown
    
func exit() -> void:
    pass
    
func update(delta: float) -> void:
    if cooldown_timer > 0:
        cooldown_timer -= delta
    else:
        transitioned.emit(self, "dash_ready")
        return

func physics_update(delta: float) -> void:
    pass
