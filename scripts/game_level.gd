extends Node2D
func _ready():
<<<<<<< HEAD
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
=======
	# Obter o nó root (ou a raiz específica da sua cena)
	var children_root = get_tree().root.get_children() # Normalmente, o primeiro filho da root é a cena principal
	for children in children_root:
		# Verificar se o filho é do tipo Area2D
		if children is Area2D:
			# Excluir o nó filho
			children.queue_free()
>>>>>>> 4d219837a32a46ede92435089fb0782aee9b82d7
