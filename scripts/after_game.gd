extends Control
class_name AfterGame
func _ready():
	$GridContainer/InimigosDerrotados.text = "Inimigos Derrotados: " + str(global.enemies_killed)
	$GridContainer/DanoCausado.text = "Dano Causado: " + str(global.damage_maked)
	$GridContainer/DanoSofrido.text = "Dano Sofrido: " + str(global.damage_suffer)
	$GridContainer/TempoVivo.text = "Tempo Vivo: " + str(global.time_alive)
	$GridContainer/DinheiroGanho.text = "Dinheiro Ganho: " + str(global.money_spend)
	$GridContainer/DinheiroGasto.text = "Dinheiro Gasto: " + str(global.money_gasto)
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
func _on_quit_pressed():
	get_tree().quit()
