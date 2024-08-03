extends Node2D
@onready var marker_2d = $Marker2D
var player 
func _ready():
	player = load(global.player_dir).instantiate()
	player.global_position = marker_2d.global_position
	add_child(player)
	global.money = 0
	global.money_gasto = 0
	global.money_spend = 0
	global.damage_maked = 0
	global.damage_suffer = 0
	global.enemies_killed = 0
	global.time_alive = 0
