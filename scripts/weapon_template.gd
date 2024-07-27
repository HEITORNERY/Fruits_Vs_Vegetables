extends Node2D
class_name WeaponTemplate
@export_category("Variables")
@export var tempo_de_recarga_do_ataque : float
@export var attack_damage : int
@onready var attack_timer = $AttackTimer
var is_attacking : bool = false
func _on_detection_area_body_entered(body):
	if is_attacking:
		return
	if body is Enemy:
		$Detection_Area.set_deferred("monitoring", false)
		$AttackTimer.start(tempo_de_recarga_do_ataque)
		$AnimationPlayer.play("attack")
		is_attacking = true
func _on_attack_timer_timeout():
	is_attacking = false
	$Detection_Area.set_deferred("monitoring", true)
func _on_attack_area_body_entered(body):
	if body is Enemy:
		body.update_health(attack_damage)
