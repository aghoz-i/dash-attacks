class_name Hurtbox
extends Area2D

signal damaged(attack: Attack)

func damage(attack: Attack):
    damaged.emit(attack)
