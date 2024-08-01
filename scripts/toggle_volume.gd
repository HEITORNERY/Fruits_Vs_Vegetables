extends CanvasLayer
class_name ToggleVolume
func _on_sfx_pressed():
	global.sfx_state = not global.sfx_state
	if global.sfx_state:
		$VBoxContainer/Sfx.texture_normal = load("res://icons/audio_on.png")
	if not global.sfx_state:
		$VBoxContainer/Sfx.texture_normal = load("res://icons/audio_off.png")
	bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/button_click.ogg")
func _on_Volume_pressed():
	global.volume_state = not global.volume_state
	if global.volume_state:
		$VBoxContainer/Volume.texture_normal = load("res://icons/som_on.png")
	if not global.volume_state:
		$VBoxContainer/Volume.texture_normal = load("res://icons/som_off.png")
	bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/button_click.ogg")
