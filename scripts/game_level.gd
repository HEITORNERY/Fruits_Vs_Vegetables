extends Node2D
func _ready():
	for children in get_tree().root.get_children():
		if children is ItensDropados:
			children.queue_free()
	global.money = 0
	global.money_gasto = 0
	global.money_spend = 0
	global.time_alive = 0
	global.enemies_killed = 0
	global.damage_maked = 0
	global.damage_suffer = 0
	global.unlock_weapons = {
	"big_sword": 1,
	"bow": 0,
	"hammer": 0,
	"long_sword": 0,
	"spear": 0,
	"ax":0
}
