extends Area2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
var collected : bool = false

func _on_body_entered(body: CharacterBody2D) -> void :
    if !collected:
        Score.score += 1
        audio_stream_player.play()
        collected = true
        visible = false 
    
    


func _on_audio_stream_player_finished() -> void:
    queue_free()
