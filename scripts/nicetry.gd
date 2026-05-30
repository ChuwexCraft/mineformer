extends Sprite2D


func _on_dragon_egg_end_body_entered(body: Node2D) -> void:
    $Timer.start()


func _on_timer_timeout() -> void:
    visible = true
