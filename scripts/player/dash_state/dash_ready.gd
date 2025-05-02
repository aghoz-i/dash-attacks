class_name DashReadyState
extends State

func enter() -> void:
    pass
    
func exit() -> void:
    pass
    
func update(delta: float) -> void:
    if Input.is_action_just_pressed("dash"):
        transitioned.emit(self, "second_dash_ready")

func physics_update(delta: float) -> void:
    pass
