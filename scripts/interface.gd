extends CanvasLayer
class_name Interface
@export_category("Objects")
@export var wave_and_time : Label
func update_wave_and_time(wave: int, time: int) -> void:
	wave_and_time.text = ("Onda " + str(wave) + "\n" + "Tempo Restante - " + time_in_seconds(time))
func time_in_seconds(time : int) -> String:
	var seconds : float = time % 60
	var minutes : float = (time / 60) % 60
	return "%02d:%02d" % [minutes, seconds]
