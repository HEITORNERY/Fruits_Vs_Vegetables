extends Node2D
func _ready():
	for children in get_tree().root.get_children():
<<<<<<< HEAD
		if children is ItensDropados:
=======
		if children is Area2D:
>>>>>>> a4b859ff882126635df3c9e91f3319d20924b721
			children.queue_free()
	global.money = 0
	global.money_gasto = 0
	global.money_spend = 0
	global.time_alive = 0
	global.enemies_killed = 0
	global.damage_maked = 0
	global.damage_suffer = 0
<<<<<<< HEAD
	global.unlock_weapons = {
	"big_sword": 1,
	"bow": 0,
	"hammer": 0,
	"long_sword": 0,
	"spear": 0,
	"ax":0
}
=======
>>>>>>> a4b859ff882126635df3c9e91f3319d20924b721
