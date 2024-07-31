extends CanvasLayer
class_name Interface
@export_category("Objects")
@export var wave_and_time : Label
@export var wave_manager : WaveManager
@export var slots_container : HBoxContainer
var current_weapons = []
func update_wave_and_time(wave: int, time: int) -> void:
	wave_and_time.text = ("Onda " + str(wave) + "\n" + "Tempo Restante - " + time_in_seconds(time))
func time_in_seconds(time : int) -> String:
	var seconds : float = time % 60
	var minutes : float = (time / 60) % 60
	return "%02d:%02d" % [minutes, seconds]
func update_coins(value : int):
	$HBoxContainer/Label.text = str(value)
func _ready():
	load_cards()
	global.interface = self
	for button in get_tree().get_nodes_in_group("choose_button"):
		button.pressed.connect(on_button_pressed.bind(button))
	global.increase_money(100)
func load_between_waves(wave_state: bool, wave_container: bool):
	get_tree().paused = wave_container
	$BetweenWaves.visible = wave_container
	$Wave_And_Time.visible = wave_state
	if wave_container:
		load_cards()
func on_button_pressed(button: Button) -> void:
	match button.name:
		"Gerar_De_Novo":
			pass
		"Pular":
			load_between_waves(true, false)
			wave_manager.start_new_wave()
		"Button":
			var slot = button.get_parent().get_parent().get_parent()
			var i = 0
			for children in slots_container.get_children():
				if children == slot:
					current_weapons[i]
					var weapon_data = global.weapons_list[current_weapons[i]]
					var weapon_level = global.unlock_weapons[current_weapons[i]] + 1
					var cost = int(weapon_data[weapon_level]["cost"])
					if global.money >= cost:
						global.unlock_weapons[current_weapons[i]] += 1
						global.decrease_money(cost)
						slot.hide()
						if weapon_level == 1:
							print("Instanciar arma")
							global.player.spawn_weapon({
								"scene_path": weapon_data[weapon_level]["scene_path"],
								"values": weapon_data[weapon_level]["values"]
							})
							break
						print("Melhorar arma")
					break
				i += 1
						
func load_cards():
	var available_weapons : Array = []
	current_weapons = []
	for weapon in global.unlock_weapons:
		current_weapons.append(weapon)
		if global.unlock_weapons[weapon] == 5:
			continue
		available_weapons.append(weapon)
	available_weapons.shuffle()
	for container in slots_container.get_children():
		container.hide()
	var i = 0
	for weapon in available_weapons:
		if i > slots_container.get_child_count():
			break
		var slot = slots_container.get_child(i)
		var nível_da_arma = global.unlock_weapons[weapon] + 1
		slot.get_node("VBoxContainer/Title").text = weapon + " LVL. " + str(nível_da_arma)
		slot.get_node("VBoxContainer/HBoxContainer/DEscription").text = global.weapons_list[weapon][nível_da_arma]["description"] 
		slot.get_node("VBoxContainer/ButtonContainer/Button").text = str(global.weapons_list[weapon][nível_da_arma]["cost"]) + " moedas"
		slot.show()
		i += 1 
