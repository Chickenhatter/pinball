extends CharacterBody2D
var up = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if $".".rotation_degrees <= 0:
		if Input.is_action_just_pressed('ui_f'):
			up = true
	if up == true:
		Global.currently_up = true
		if $".".rotation_degrees > 60:
			up = false
		$".".rotation_degrees += 10
	else:
		Global.currently_up = false
		if $".".rotation_degrees > 0:
			$".".rotation_degrees -= 4
	if Global.cakeaj == true:
			up = false
			Global.cakeaj = false
