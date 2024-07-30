extends Area2D
class_name Projectile
var direction : Vector2
var move_speed = 512.0
var attack_damage : int
func _physics_process(delta):
	translate(direction*delta*move_speed)
func _ready():
	rotation = direction.angle()
func _on_body_entered(body):
	if body is Enemy:
		body.update_health(attack_damage)
		queue_free()
	if body is TileMap:
		queue_free()
