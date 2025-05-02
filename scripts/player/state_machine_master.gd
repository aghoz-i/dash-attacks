class_name PlayerStateMachineMaster
extends Node

@onready var state_machines: Array[StateMachine] = []

func _ready():
    for child in get_children():
        if child is StateMachine:
            state_machines.append(child)
