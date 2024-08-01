extends Camera2D
class_name PlayerCamera

var strength : float = 0
var duration : float = 0

func terremoto(força_do_terremoto: float, tempo_do_terremoto: float) -> void:
	if duration != 0:
		return
	strength = força_do_terremoto
	duration = tempo_do_terremoto
	while duration > 0:
		offset = Vector2(randf_range(-strength, strength), randf_range(-strength, strength))
		duration -= get_process_delta_time()
		await get_tree().process_frame  # Espera o próximo frame de física
	offset = Vector2.ZERO
	strength = 0
	duration = 0
