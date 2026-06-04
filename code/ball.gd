extends CharacterBody2D

var ballin = 0
var game = false
var call = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var vim = 1
var direction: Vector2
var speed = 300
func _physics_process(delta: float) -> void:
	if game == true:
		if not is_on_floor():
			velocity.y += 300 * delta
		var collision: KinematicCollision2D = move_and_collide(velocity * delta)
		if collision:
			if (collision.get_collider().name) == "Pusher":
				if Global.currently_up == true:
					vim = 5
					if (abs(velocity.y) + abs(velocity.x)) < 200:
						print('a')
						vim = 9
			elif (abs(velocity.y) + abs(velocity.x)) < 100:
				vim = 5
			velocity = velocity.bounce(collision.get_normal())
			velocity *= 0.5 * vim * 1
			vim = 0.6
		if Global.currently_up == true:
			if ballin == 2:
				print('b')
				velocity.y += -310
		if collision:
			if (collision.get_collider().name) == "Pusher":
				set_collision_layer_value(8, false)
				set_collision_mask_value(8, false)
				await get_tree().create_timer(0.6).timeout
				set_collision_layer_value(8, true)
				set_collision_mask_value(8, true)
	if Global.marble_go == true:
		velocity.y = -60000 * delta
		move_and_slide()
		var collision: KinematicCollision2D = move_and_collide(velocity * delta)
		if collision:
			Global.marble_go = false
			game = true


func _on_pusharea_body_entered(body: Node2D) -> void:
	if body.name == 'Ballone':
		ballin = 1
		await get_tree().create_timer(0.3).timeout
		if ballin == 1:
			ballin = 2


func _on_pusharea_body_exited(body: Node2D) -> void:
	if body.name == 'Ballone':
		ballin = 0
