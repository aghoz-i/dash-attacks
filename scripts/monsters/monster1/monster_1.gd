extends CharacterBody2D

@onready var animation_state_machine: StateMachine = $StateMachine/AnimationState

func _physics_process(delta: float) -> void:
    move_and_slide()

func handle_death():
    var current_state = animation_state_machine.current_state
    animation_state_machine.on_child_transition(current_state,"death")

func get_state() -> State:
    return animation_state_machine.current_state
    
func disable():
    var current_state = animation_state_machine.current_state
    animation_state_machine.on_child_transition(current_state,"disabled")
    
