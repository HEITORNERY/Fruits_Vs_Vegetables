extends Node2D
class_name WaveManager
@onready var time_to_spawn_enemy = $Time_To_Spawn_Enemy
@onready var wave_duration = $WaveDuration
const abobora : PackedScene = preload("res://scenes/abobora.tscn")
const pepino : PackedScene = preload("res://scenes/enemy_pepino.tscn")
const pimentao : PackedScene = preload("res://scenes/pimentao.tscn")
@onready var interface = $"../Interface"
@export_category("Variables")
@export var initial_position_player : Vector2 = Vector2(317, 179)
@export var player : Player = null
var wave_dict : Dictionary = {
	1: {
		"wave_duration": 20,
		"wave_dificuldade": "easy",
		"wave_enemies": [1, 3],
		"time_to_spawn_enemies": 4,
		"wave_spots_utilizados": 1
	},
	2: {
		"wave_duration": 25,
		"wave_dificuldade": "easy",
		"wave_enemies": [2, 4],
		"time_to_spawn_enemies": 4,
		"wave_spots_utilizados": 2
	},
	3: {
		"wave_duration": 30,
		"wave_dificuldade": "easy",
		"wave_enemies": [3, 5],
		"time_to_spawn_enemies": 3,
		"wave_spots_utilizados": 2
	},
	4: {
		"wave_duration": 35,
		"wave_dificuldade": "easy_to_medium",
		"wave_enemies": [3, 6],
		"time_to_spawn_enemies": 3,
		"wave_spots_utilizados": 3
	},
	5: {
		"wave_duration": 40,
		"wave_dificuldade": "easy_to_medium",
		"wave_enemies": [4, 6],
		"time_to_spawn_enemies": 4,
		"wave_spots_utilizados": 2
	},
	6: {
		"wave_duration": 45,
		"wave_dificuldade": "easy_to_medium",
		"wave_enemies": [5, 7],
		"time_to_spawn_enemies": 3,
		"wave_spots_utilizados": 3
	},
	7: {
		"wave_duration": 50,
		"wave_dificuldade": "medium",
		"wave_enemies": [4, 7],
		"time_to_spawn_enemies": 4,
		"wave_spots_utilizados": 2
	},
	8: {
		"wave_duration": 55,
		"wave_dificuldade": "medium",
		"wave_enemies": [5, 8],
		"time_to_spawn_enemies": 3,
		"wave_spots_utilizados": 3
	},
	9: {
		"wave_duration": 60,
		"wave_dificuldade": "medium_to_hard",
		"wave_enemies": [6, 9],
		"time_to_spawn_enemies": 3,
		"wave_spots_utilizados": 3
	},
	10: {
		"wave_duration": 65,
		"wave_dificuldade": "hard",
		"wave_enemies": [7, 10],
		"time_to_spawn_enemies": 2,
		"wave_spots_utilizados": 3
	}
}
var current_wave = 1
func _ready():
	time_to_spawn_enemy.start(wave_dict[current_wave]["time_to_spawn_enemies"])
	wave_duration.start(wave_dict[current_wave]["wave_duration"])
	interface.update_wave_and_time(current_wave, wave_duration.time_left - 1)
	spawn_enemies()
func _on_wave_duration_timeout():
	current_wave += 1
	if current_wave >= 10:
		print("Você Venceu!")
		return
	#get_tree().paused = true
	clear_map()
func _on_time_to_spawn_enemy_timeout():
	spawn_enemies()
	time_to_spawn_enemy.start(wave_dict[current_wave]["time_to_spawn_enemies"])
func spawn_enemies() -> void:
	var quantidade_de_spots_usados_na_wave : int = wave_dict[current_wave]["wave_spots_utilizados"]
	var spots : Array = []
	for children in get_children():
		if not children is Timer:
			spots.append(children)
	var spawn_spot : Array = []
	for i in quantidade_de_spots_usados_na_wave:
		var index : int = randi() % spots.size()
		var spot_selected : Node2D = spots[index]
		spawn_spot.append(spot_selected)
		spots.remove_at(index)
	var childrens : Array = []
	for spot in spawn_spot:
		for children in spot.get_children():
			childrens.append(children)
		var marker_selected : Array = []
		var inimigos_pra_spawnar : Array = wave_dict[current_wave]["wave_enemies"]
		var quantidade_de_inimigos_selecionados = randi_range(inimigos_pra_spawnar[0], inimigos_pra_spawnar[1])
		for i in quantidade_de_inimigos_selecionados:
			var index : int = randi() % childrens.size()
			var marker_aleatorio : Node2D = childrens[index]
			marker_selected.append(marker_aleatorio)
			childrens.remove_at(index)
		for marker in marker_selected:
			_spawn_enemies(marker)
func _spawn_enemies(marker : Node2D) -> void:
	var enemy : Enemy = null
	var porcentagem_de_spawn_do_inimigo : float = randf()
	var dificuldade : String = wave_dict[current_wave]["wave_dificuldade"]
	match dificuldade:
		"easy":
			enemy = pepino.instantiate()
		"easy_to_medium":
			if porcentagem_de_spawn_do_inimigo <= 0.7:
				enemy = pepino.instantiate()
			else:
				enemy = pimentao.instantiate()
		"medium":
			if porcentagem_de_spawn_do_inimigo <= 0.5:
				enemy = pepino.instantiate()
			else:
				enemy = pimentao.instantiate()
		"medium_to_hard":
			if porcentagem_de_spawn_do_inimigo <= 0.4:
				enemy = pepino.instantiate()
			elif porcentagem_de_spawn_do_inimigo > 0.4 and porcentagem_de_spawn_do_inimigo <= 0.9:
				enemy = pimentao.instantiate() 
			else:
				enemy = abobora.instantiate()
		"hard":
			if porcentagem_de_spawn_do_inimigo <= 0.2:
				enemy = pepino.instantiate()
			elif porcentagem_de_spawn_do_inimigo > 0.2 and porcentagem_de_spawn_do_inimigo <= 0.8:
				enemy = pimentao.instantiate() 
			else:
				enemy = abobora.instantiate()
	enemy.global_position = marker.global_position
	get_parent().call_deferred("add_child", enemy)
func _on_current_time_wave_timeout():
	interface.update_wave_and_time(current_wave, wave_duration.time_left)
func clear_map() -> void:
	for children in get_parent().get_children():
		if children is Enemy:
			children.queue_free()
	interface.load_between_waves(false, true)
	start_new_wave()
func start_new_wave() -> void:
	wave_duration.start(wave_dict[current_wave]["wave_duration"])
	player.global_position = initial_position_player
	player.reset_health()
