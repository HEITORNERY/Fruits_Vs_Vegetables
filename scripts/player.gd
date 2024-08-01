extends CharacterBody2D
class_name Player
const SPEED = 350.0
@export_category("Variables")
@export var health = 30
@export var weapon_manager : Node2D
var max_health: int 
func _ready():
	global.player = self
	max_health = health
func move():
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_lado")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_lado")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("walk_frente") 
	elif velocity.y < 0:
		$AnimatedSprite2D.play("walk_costas")
func idle():
	if Input.is_action_just_released("ui_right"):
		$AnimatedSprite2D.play("idle_direita")
	elif Input.is_action_just_released("ui_left"):
		$AnimatedSprite2D.play("idle_direita")
	elif Input.is_action_just_released("ui_up"):
		$AnimatedSprite2D.play("idle_costas")
	elif Input.is_action_just_released("ui_down"):
		$AnimatedSprite2D.play("idle_frente")
func _physics_process(delta):
	move()
	move_and_slide()
	idle()
func update_health(_type: String, _value: int) -> void:
	match _type:
		"damage":
			health -= sign(_value)
			global.damage_suffer += _value
			if health <= 0:
				bgm.spawn_sfx("res://Assets (MUSICAS)/musics/sfx/game_over.ogg")
				get_tree().change_scene_to_file("res://scenes/after_game.tscn")
		"heal":
			health += _value
			if health >= max_health:
				health = max_health
func reset_health() -> void:
	health = max_health
func spawn_weapon(weapon_data: Dictionary):
	for children in weapon_manager.get_children():
		if children.get_child_count() == 1:
			var weapon_scene = load(weapon_data["scene_path"])
			if not weapon_scene:
				print("Erro ao carregar a cena da arma:", weapon_data["scene_path"])
				return

			var weapon = weapon_scene.instantiate()
			children.call_deferred("add_child", weapon)

			if weapon.has_method("update_damage"):
				weapon.update_damage(weapon_data["values"]["damage"])
			else:
				print("A arma não tem o método 'update_damage'")

			if weapon.has_method("update_attack_timer"):
				weapon.update_attack_timer(weapon_data["values"]["tempo_de_recarga"])
			else:
				print("A arma não tem o método 'update_attack_timer'")
			break
