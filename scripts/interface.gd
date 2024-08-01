extends CanvasLayer
class_name Interface
@export_category("Objects")
@export var wave_and_time : Label
@export var wave_manager : WaveManager
@export var slots_container : HBoxContainer
var current_weapons = []
var reroll_cost = 5
var heart_index = 0
var max_heart_index = 2
@onready var heart_state = {}
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
	heart_state = {"objects": {
		$HeartContainer/Heart1:3,
		$HeartContainer/Heart2:3,
		$HeartContainer/Heart3:3,
		$HeartContainer/Heart4:3,
		$HeartContainer/Heart5:3
	},
	"textures": {
		3: "res://icons/coração_cheiio.png",
		2: "res://icons/coração_pela_metade.png",
		1: "res://icons/coração_vazio.png"
	}
	}
	global.interface = self
	for button in get_tree().get_nodes_in_group("choose_button"):
		button.pressed.connect(on_button_pressed.bind(button))
		$BetweenWaves/Background/Gerar_De_Novo.text = "Rerrol (" + str(reroll_cost) +")"
func load_between_waves(wave_state: bool, wave_container: bool):
	get_tree().paused = wave_container
	$BetweenWaves.visible = wave_container
	$Wave_And_Time.visible = wave_state
	$HeartContainer.visible = wave_state
	if wave_container:
		load_cards()
func on_button_pressed(button: Button) -> void:
	match button.name:
		"Gerar_De_Novo":
			if global.money >= reroll_cost:
				global.decrease_money(reroll_cost)
				button.text = "Rerrol (" + str(reroll_cost) +")"
				reroll_cost += 5
				load_cards()
		"Pular":
			load_between_waves(true, false)
			wave_manager.start_new_wave()
			reroll_cost = 5
		"Button":
			var slot = button.get_parent().get_parent().get_parent()
			var i = 0
			for children in slots_container.get_children():
				if children == slot:
					current_weapons[i]
					var weapon_data = global.weapons_list[current_weapons[i]]
					var weapon_level = global.unlock_weapons[current_weapons[i]] + 1
					var cost = weapon_data[weapon_level]["cost"]
					if global.money >= cost:
						global.unlock_weapons[current_weapons[i]] += 1
						global.decrease_money(cost)
						slot.hide()
						if weapon_level == 1:
							global.player.spawn_weapon({
								"scene_path": weapon_data[weapon_level]["scene_path"],
								"values": weapon_data[weapon_level]["values"]
							})
							break
						get_tree().call_group(current_weapons[i], "update_damage", weapon_data[weapon_level]["values"]["damage"])
						get_tree().call_group(current_weapons[i], "update_attack_timer", weapon_data[weapon_level]["values"]["tempo_de_recarga"])
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
func update_health():
	var hearts_key = heart_state["objects"].keys()
	if heart_index >= hearts_key.size():
		bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/game_over.ogg")
		get_tree().change_scene_to_file("res://scenes/after_game.tscn")
		return
	heart_state["objects"][hearts_key[heart_index]] -= 1
	var heart_health = heart_state["objects"][hearts_key[heart_index]]
	if heart_health == 0:
		heart_index += 1
		update_health()
		return
	hearts_key[heart_index].texture = load(heart_state["textures"][heart_health])
