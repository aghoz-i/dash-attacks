class_name SecondDashReadyState
extends State

@export var anim_player: AnimatedSprite2D
@export var second_dash_window_time: float
@export var dash_anim_state: State

var window_timer: float
var wait_to_scan_input: float

func enter() -> void:
    window_timer = second_dash_window_time
    wait_to_scan_input = dash_anim_state.dash_duration
    
func exit() -> void:
    pass
    
func update(delta: float) -> void:
    if window_timer > 0:
        window_timer -= delta
    else:
        transitioned.emit(self, "dash_ready")
        return
        
    if wait_to_scan_input <= 0:
        if Input.is_action_just_pressed("dash"):
            transitioned.emit(self, "dash_cooldown")
            return
    else:
        wait_to_scan_input -= delta

func physics_update(delta: float) -> void:
    pass
