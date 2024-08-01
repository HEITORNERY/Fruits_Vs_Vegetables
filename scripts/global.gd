extends Node
class_name Global 
var player : Player = null
var interface : Interface = null
var money: int = 0
var weapons_list : Dictionary = {
	"bow":{
		1:{
			"description": "Arma de ataque a distância. (5 de dano)",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 5
			}, 
			"cost": 35,
			"scene_path" : "res://scenes/bow.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 6
			},
			"cost": 45
		},
		3:{
			"description": "Tempo de recarga dimunui 0.1s.",
			"values": {
				"tempo_de_recarga": 0.2, "damage": 6
			},
			"cost": 55
		},
		4:{
			"description": "Tempo de recarga diminui em 0.1s.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 65
		},
		5:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 75
		},
		6:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 75
		},
		7:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 75
		},
		8:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 75
		},
		9:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 75
		},
		10:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 75
		} 
	},
	"big_sword":{
		1:{
			"description": "Arma de baixo dano. (3 de dano)",
			"values": {
				"tempo_de_recarga": 0.6, "damage": 3
			},
			"cost": 10,
			"scene_path": "res://scenes/big_sword.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.6, "damage": 4
			},
			"cost": 20
		},
		3:{
			"description": "Tempo de recarga dimunui 0.3s.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 4
			},
			"cost": 30
		},
		4:{
			"description": "Tempo de recarga diminui em 0.2s.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 4
			},
			"cost": 40
		},
		5:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 50
		},
		6:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 50
		},
		7:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 50
		},
		8:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 50
		},
		9:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 50
		},
		10:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 50
		} 
	},
	"hammer":{
		1:{
			"description": "Arma de grande dano. (9 de dano)",
			"values": {
				"tempo_de_recarga": 0.6, "damage": 9
			},
			"cost": 80,
			"scene_path": "res://scenes/hammer.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.6, "damage": 10
			},
			"cost": 90
		},
		3:{
			"description": "Tempo de recarga dimunui 0.3s.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 10
			},
			"cost": 100
		},
		4:{
			"description": "Tempo de recarga diminui em 0.2s.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 10
			},
			"cost": 110
		},
		5:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 120
		},
		6:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 120
		},
		7:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 120
		},
		8:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 120
		},
		9:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 120
		},
		10:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 120
		}
	},
	"spear":{
		1:{
			"description": "Arma de dano moderado (4 de dano)",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 4
			},
			"cost": 25,
			"scene_path": "res://scenes/spear.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 5
			},
			"cost": 28
		},
		3:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 36
		},
		4:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 7
			},
			"cost": 42
		},
		5:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 58
		},
		6:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 58
		},
		7:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 58
		},
		8:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 58
		},
		9:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 58
		},
		10:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 58
		}  
	},
	"long_sword":{
		1:{
			"description": "Arma veloz. (6 de dano)",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 6
			},
			"cost": 43,
			"scene_path": "res://scenes/long_sword.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 7
			},
			"cost": 53
		},
		3:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 63
		},
		4:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.2, "damage": 9
			},
			"cost": 73
		},
		5:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 83
		},
		6:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 83
		},
		7:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 83
		},
		8:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 83
		},
		9:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 83
		},
		10:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 83
		} 
	},
	"ax":{
		1:{
			"description": "Arma forte. (8 de dano)",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 8
			},
			"cost": 41,
			"scene_path": "res://scenes/ax.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 51
		},
		3:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 11
			},
			"cost": 61
		},
		4:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.2, "damage": 11
			},
			"cost": 71
		},
		5:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 11
			},
			"cost": 81
		},
		6:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 11
			},
			"cost": 81
		},
		7:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 11
			},
			"cost": 81
		},
		8:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 11
			},
			"cost": 81
		},
		9:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 11
			},
			"cost": 81
		},
		10:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 11
			},
			"cost": 81
		} 
	}
}
var unlock_weapons = {
	"big_sword": 1,
	"bow": 0,
	"hammer": 0,
	"long_sword": 0,
	"spear": 0,
	"ax":0
}
var player_dir
var spawn_player : Node2D
var money_spend : int = 0
var time_alive : int = 0
var enemies_killed : int = 0
var damage_maked : int = 0
var damage_suffer : int = 0
var money_gasto : int = 0
var sfx_state : bool = true
var volume_state : bool = true
func increase_money(value : int) -> void:
	money += value
	money_spend += value
	interface.update_coins(money)
func decrease_money(value: int):
	money -= value
	money_gasto += value
	interface.update_coins(money)
func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
