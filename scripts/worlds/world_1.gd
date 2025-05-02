extends Node

@export var player: CharacterBody2D
@export var monster: CharacterBody2D
@export var winscreen: MarginContainer
@export var losescreen: MarginContainer

func _ready() -> void:
    winscreen.hide()
    losescreen.hide()

func _process(delta: float) -> void:
    if player and monster:
        var player_state = player.get_state()
        var monster_state = monster.get_state()
        
        if player_state.name == "death":
            launch_losescreen()
            monster.disable()
            return
        if monster_state.name == "death":
            launch_winscreen()
            player.disable()
            return
    
func launch_winscreen():
    await get_tree().create_timer(1).timeout
    winscreen.show()

func launch_losescreen():
    await get_tree().create_timer(1).timeout
    losescreen.show()
    
