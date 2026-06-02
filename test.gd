extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var vim = 1
var direction: Vector2
var speed = 300

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 200 * delta
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		if (collision.get_collider().name) == "Pusher":
			if Global.currently_up == true:
				vim = 3
		velocity = velocity.bounce(collision.get_normal())
		velocity *= 0.7 * vim
		vim = 1
	if collision:
		print("Collided with: ", collision.get_collider().name)
		if (collision.get_collider().name) == "Pusher":
			set_collision_layer_value(8, false)
			set_collision_mask_value(8, false)
			await get_tree().create_timer(0.2).timeout
			set_collision_layer_value(8, true)
			set_collision_mask_value(8, true)
