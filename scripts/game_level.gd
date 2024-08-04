extends Node2D
func _ready():
	# Obter o nó root (ou a raiz específica da sua cena)
	var children_root = get_tree().root.get_children() # Normalmente, o primeiro filho da root é a cena principal
	for children in children_root:
		# Verificar se o filho é do tipo Area2D
		if children is Area2D:
			# Excluir o nó filho
			children.queue_free()
