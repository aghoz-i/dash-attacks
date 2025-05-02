extends AnimationState

func _process(delta: float) -> void:
    if current_state:
        current_state.update(delta)
    #print(current_state)
