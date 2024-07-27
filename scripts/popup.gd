extends Label
class_name PopupText
var up_popup : float = 32.0
func _on_animation_player_animation_finished(anim_name):
	queue_free()
func update_text(value : int) -> void:
	text = "-" + str(value)
func _physics_process(delta: float) -> void:
	position.y -= delta * up_popup
