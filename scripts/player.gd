extends CharacterBody2D
class_name Player
const SPEED = 350.0
@export_category("Variables")
@export var health = 30
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
			health -= _value
			if health <= 0:
				queue_free()
		"heal":
			health += _value
			if health >= max_health:
				health = max_health
func reset_health() -> void:
	health = max_health
