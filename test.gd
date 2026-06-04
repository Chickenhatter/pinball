extends CharacterBody2D
var cativate = false
var game = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var vim = 1
var direction: Vector2
var speed = 300
func _physics_process(delta: float) -> void:
	if Global.marble_go == true:
		velocity.y -= 232 * delta
		move_and_slide()
