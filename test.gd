extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction: Vector2
var speed = 300

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 100 * delta
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity *= 0.9
