extends CharacterBody2D
class_name Enemy
@export_category("variables")
@export var _enemy_type : String = "perseguidor"
@export var speed : float = 150.0
@export var dash_speed : float = 150.0 * 4
@export var _damage : int 
@export var health : int
var loading_dash : bool = false
var is_dashing : bool = false
var previous_player_position :Vector2
const popup_scene : PackedScene = preload("res://scenes/popup.tscn")
func _physics_process(_delta):
	if loading_dash:
		return
	if global.player == null:
		return
	var _direction: Vector2 = global_position.direction_to(global.player.global_position)
	var _distance_pro_player : float = global_position.distance_to(global.player.global_position)
	if _distance_pro_player <= 16.0:
		# aplicar a lógica de ataque
		return
	match _enemy_type:
		"perseguidor":
			perseguir(_direction)
		"persegue_e_dash":
			persegue_and_dash(_direction)
		"persegue_mais_rapido":
			persegue_mais_rapidamente(_direction)
	move_and_slide()
func perseguir(_direction : Vector2) -> void:
	velocity = _direction * speed
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_lado")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_lado")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("walk_frente") 
	elif velocity.y < 0:
		$AnimatedSprite2D.play("walk_costas")
func persegue_and_dash(_direction : Vector2) -> void:
	if not is_dashing:
		velocity = _direction * speed
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("walk_lado")
		elif velocity.x < 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("walk_lado")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("walk_frente") 
		elif velocity.y < 0:
			$AnimatedSprite2D.play("walk_costas")
	if is_dashing:
		_direction = previous_player_position
		velocity = _direction * dash_speed
func persegue_mais_rapidamente(_direction: Vector2) -> void:
	velocity = _direction * speed
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
func _on_range_area_body_entered(_body) -> void:
	if _enemy_type != "persegue_e_dash":
		return
	if is_dashing:
		return
	if _body is Player:
		previous_player_position = global_position.direction_to(global.player.global_position)
		$Timer.start()
		loading_dash = true
func _on_timer_timeout():
	loading_dash = false
	is_dashing = true
	$Dash_Timer.start()
	$AnimatedSprite2D.play("dash")
func _on_dash_timer_timeout():
	is_dashing = false
func _on_hit_box_area_body_entered(body):
	if body is Player:
		body.update_health("damage", _damage)
		$HitBoxArea/Invincibility_Timer.start()
		$HitBoxArea.set_deferred("monitoring", false)
func _on_invincibility_timer_timeout():
	$HitBoxArea.set_deferred("monitoring", true)
func update_health(_value : int) -> void:
	health -= _value
	$AnimatedSprite2D/AnimationPlayer.play("hit")
	spawn_text_popup(_value)
	get_tree().call_group("player_camera", "terremoto", 2.0, 0.25)
	if health <= 0:
		get_tree().call_group("player_camera", "terremoto", 5.0, 0.35)
		queue_free()
func spawn_text_popup(value: int) -> void:
	var popup_damage : PopupText = popup_scene.instantiate()
	popup_damage.update_text(value)
	popup_damage.global_position = global_position
	get_tree().root.call_deferred("add_child", popup_damage)
