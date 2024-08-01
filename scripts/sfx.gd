extends AudioStreamPlayer
class_name Sfx
func _on_finished():
	queue_free()
