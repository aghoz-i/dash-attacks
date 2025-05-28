extends Hitbox


func _on_hit_enemy() -> void:
    get_tree().create_timer(1).timeout.connect(on_timer_timeout)
    $CollisionShape2D.disabled = true

func on_timer_timeout():
    $CollisionShape2D.disabled = false
