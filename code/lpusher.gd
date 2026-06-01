extends CharacterBody2D
var up = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if $".".rotation_degrees == 0:
		if Input.is_action_just_pressed('ui_f'):
			up = true
	if up == true:
		pass
	else:
		pass
	move_and_slide()
