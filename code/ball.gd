extends CharacterBody2D

var lrramp = false
var lrboost = false
var vima = 1
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
						ballin = 2
						vim = 5
						vima = 5
			elif (abs(velocity.y) + abs(velocity.x)) < 100:
				vim = 2
				vima = 5
			velocity = velocity.bounce(collision.get_normal())
			velocity.x *= 0.5 * vim * 1
			velocity.y *= 1 * vima * 1
			vim = 0.6
			vima = 0.6
		#if Global.currently_up == true:
			#if ballin == 2:
				#print('b')
				#velocity.y += -80
		if lrboost == true:
			velocity *= 1.1
		if lrramp == true:
			await get_tree().create_timer(0.5).timeout
			if lrramp == true:
				print($".".global_position.x)
				if $".".global_position.x < 0:
					velocity.x = 100
				else:
					velocity.x = -100
				velocity.y = -90
		if collision:
			if (collision.get_collider().name) == "Pusher":
				if Global.currently_up == true:
					velocity.y -= 200
				Global.cakeaj = true
				set_collision_layer_value(8, false)
				set_collision_mask_value(8, false)
				await get_tree().create_timer(0.6).timeout
				set_collision_layer_value(8, true)
				set_collision_mask_value(8, true)
			if (collision.get_collider().name) == "bouncer":
				velocity *= 4
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


func _on_game_start_body_entered(body: Node2D) -> void:
	if body.name =="Ballone":
		set_collision_layer_value(9, true)
		set_collision_mask_value(9, true)


func _on_boosterlr_body_entered(body: Node2D) -> void:
	if body.name == "Ballone":
		lrboost = true


func _on_boosterlr_body_exited(body: Node2D) -> void:
	if body.name == "Ballone":
		lrboost = false


func _on_lrramp_body_entered(body: Node2D) -> void:
	if body.name == "Ballone":
		lrramp = true


func _on_lrramp_body_exited(body: Node2D) -> void:
	if body.name == "Ballone":
		lrramp = false
