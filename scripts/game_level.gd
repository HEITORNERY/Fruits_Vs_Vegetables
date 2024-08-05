extends Node2D
func _ready():
	for children in get_tree().root.get_children():
		if children is Area2D:
			children.queue_free()
	global.money = 0
	global.money_gasto = 0
	global.money_spend = 0
	global.time_alive = 0
	global.enemies_killed = 0
	global.damage_maked = 0
	global.damage_suffer = 0
