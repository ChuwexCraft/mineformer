extends Area2D



func _on_body_entered(body: CharacterBody2D) -> void:
    $Timer.start()
    $AnimationPlayer.play("new_animation")


func _on_timer_timeout() -> void:
    get_tree().change_scene_to_file("res://scenes/level_complete.tscn")
