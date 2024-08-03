extends Control
var player_1 = "res://scenes/player.tscn"
var player_2 = "res://scenes/player_2.tscn"
var player_3 = "res://scenes/player_3.tscn"
func go_to_game_level():
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")
func _on_player_1_pressed():
	global.player_dir = player_1
	go_to_game_level()
func _on_player_2_pressed():
	global.player_dir = player_2
	go_to_game_level()
func _on_player_3_pressed():
	global.player_dir = player_3
	go_to_game_level()
func _ready():
	global.money = 0
	global.money_gasto = 0
	global.money_spend = 0
	global.damage_maked = 0
	global.damage_suffer = 0
	global.enemies_killed = 0
	global.time_alive = 0
