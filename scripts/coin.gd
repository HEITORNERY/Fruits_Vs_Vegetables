extends Area2D
class_name ItensDropados
@export var valor_do_item : Array[int]
func _on_body_entered(body):
	if body is Player:
		var value = randi_range(valor_do_item[0], valor_do_item[1])
		global.increase_money(value)
		queue_free()
