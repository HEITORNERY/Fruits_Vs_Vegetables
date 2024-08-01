extends AudioStreamPlayer
class_name Bgm
const Scene_Sfx : PackedScene = preload("res://scenes/sfx.tscn")
func spawn_sfx(path: String, volume_db: float = 0.0):
	if global.sfx_state == false:
		return
	var sfx : Sfx = Scene_Sfx.instantiate()
	call_deferred("add_child", sfx)
	sfx.stream = load(path)
	sfx.volume_db = volume_db
	sfx.play()
func _process(delta):
	if global.volume_state:
		volume_db = -15
	if global.volume_state == false:
		volume_db = -80
