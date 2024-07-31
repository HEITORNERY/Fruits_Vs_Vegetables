extends Node
class_name Global 
var player : Player = null
var interface : Interface = null
var money: int = 0
var weapons_list : Dictionary = {
	"bow":{
		1:{
			"description": "Desbloqueado arco e flecha, arma de ataque a distância. (Tempo de recarga: 0.3s | 5 de dano)",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 5
			}, 
			"cost": 30,
			"scene_path" : "res://scenes/bow.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 6
			},
			"cost": 40
		},
		3:{
			"description": "Tempo de recarga dimunui 0.1s.",
			"values": {
				"tempo_de_recarga": 0.2, "damage": 6
			},
			"cost": 50
		},
		4:{
			"description": "Tempo de recarga diminui em 0.1s.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 60
		},
		5:{
			"description": "Dano aumentado em 3.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 70
		} 
	},
	"big_sword":{
		1:{
			"description": "Desbloqueado espada pequena, arma de curto alcance e baixo dano. (Tempo de recarga: 0.6s | 3 de dano)",
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
		} 
	},
	"hammer":{
		1:{
			"description": "Desbloqueado Porrete, arma de grande dano. (Tempo de recarga: 0.6s | 9 de dano)",
			"values": {
				"tempo_de_recarga": 0.6, "damage": 9
			},
			"cost": 50,
			"scene_path": "res://scenes/hammer.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.6, "damage": 10
			},
			"cost": 60
		},
		3:{
			"description": "Tempo de recarga dimunui 0.3s.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 10
			},
			"cost": 70
		},
		4:{
			"description": "Tempo de recarga diminui em 0.2s.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 10
			},
			"cost": 80
		},
		5:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 12
			},
			"cost": 90
		} 
	},
	"spear":{
		1:{
			"description": "Desbloqueado lança, arma de dano moderado e recarrega rápido. (Tempo de recarga: 0.1s | 4 de dano)",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 4
			},
			"cost": 20,
			"scene_path": "res://scenes/spear.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 5
			},
			"cost": 30
		},
		3:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 6
			},
			"cost": 40
		},
		4:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 7
			},
			"cost": 50
		},
		5:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 60
		} 
	},
	"long_sword":{
		1:{
			"description": "Desbloqueado espada longa, arma com com alto dano e veloz. (Tempo de recarga: 0.3s | 6 de dano)",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 6
			},
			"cost": 40,
			"scene_path": "res://scenes/long_sword.tscn"
		},
		2:{
			"description": "Dano aumentado em 1.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 7
			},
			"cost": 50
		},
		3:{
			"description": "Dano aumentado em 2.",
			"values": {
				"tempo_de_recarga": 0.3, "damage": 9
			},
			"cost": 60
		},
		4:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.2, "damage": 9
			},
			"cost": 70
		},
		5:{
			"description": "Tempo de recarga reduzido 0.1s",
			"values": {
				"tempo_de_recarga": 0.1, "damage": 9
			},
			"cost": 80
		} 
	},
}
var unlock_weapons = {
	"big_sword": 1,
	"bow": 0,
	"hammer": 0,
	"long_sword": 0,
	"spear": 0
}
func increase_money(value : int) -> void:
	money += value
	interface.update_coins(money)
func decrease_money(value: int):
	money -= value
	interface.update_coins(money)
