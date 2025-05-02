class_name Hitbox
extends Area2D

signal hit_enemy
@export var attack_damage: float

func _ready() -> void:
    area_entered.connect(on_area_entered)


func on_area_entered(hurtbox: Area2D):
    if hurtbox is Hurtbox:
        var attack := Attack.new()
        
        if attack_damage:
            attack.damage = attack_damage
        
        hurtbox.damage(attack)
        
        hit_enemy.emit()
