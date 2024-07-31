extends Node2D
class_name Bow
@export_category("Variables")
@export var tempo_de_recarga_do_ataque : float
@export var attack_damage : int
var is_attacking : bool = false
var referencia_ao_inimigo 
const arrow : PackedScene = preload("res://scenes/arrow.tscn")
func _on_detection_area_body_entered(body):
	if is_attacking:
		return
	if body is Enemy:
		$DetectionArea.set_deferred("monitoring", false)
		$AttackTimer.start(tempo_de_recarga_do_ataque)
		$AnimationPlayer.play("attack")
		is_attacking = true
		referencia_ao_inimigo = body
func _on_attack_area_body_entered(body):
	if body is Enemy:
		body.update_health(attack_damage)
func _on_attack_timer_timeout():
	is_attacking = false
	$DetectionArea.set_deferred("monitoring", true)
func spawn_projectile() -> void:
	if is_instance_valid(referencia_ao_inimigo):
		var direction : Vector2 = global_position.direction_to(referencia_ao_inimigo.global_position)
		var projectile : Projectile = arrow.instantiate()
		projectile.global_position = global_position
		projectile.attack_damage = attack_damage
		projectile.direction = direction
		get_tree().root.call_deferred("add_child", projectile)
func _physics_process(delta):
	if is_instance_valid(referencia_ao_inimigo):
		rotation = global_position.direction_to(referencia_ao_inimigo.global_position).angle()
func update_damage(value: int):
	attack_damage = value
func update_attack_timer(value: float):
	tempo_de_recarga_do_ataque = value
