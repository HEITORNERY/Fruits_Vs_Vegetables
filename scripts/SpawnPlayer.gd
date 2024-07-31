extends Node2D
@onready var marker_2d = $Marker2D
var player 
func _ready():
	player = load(global.player_dir).instantiate()
	player.global_position = marker_2d.global_position
	add_child(player)
