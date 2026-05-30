extends Button


func _on_respawn_button_down() -> void:
    Score.score = 0
    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
    get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_button_down() -> void:
    Score.score = 0
    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
    get_tree().change_scene_to_file("res://scenes/level1.tscn")
