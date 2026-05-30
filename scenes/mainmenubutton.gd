extends Button


func _on_button_down() -> void:
    Score.score = 0
    get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
