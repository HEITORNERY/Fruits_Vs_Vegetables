extends Control
func _on_button_pressed():
	bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/button_click.ogg")
	get_tree().change_scene_to_file("res://scenes/select_player.tscn")
func _on_button_2_pressed():
	bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/button_cancel.ogg")
	await get_tree().create_timer(0.2).timeout 
	get_tree().quit()
func _on_button_3_pressed():
	bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/button_click.ogg")
	OS.shell_open("https://heitornery.itch.io/")
func _ready():
	global.money = 0
	global.money_gasto = 0
	global.money_spend = 0
	global.damage_maked = 0
	global.damage_suffer = 0
	global.enemies_killed = 0
	global.time_alive = 0
