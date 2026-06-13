extends Node2D
var rotate = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ui_f'):
		if $Node2D.rotation_degrees < 60:
			rotate = true
	if rotate == true:
		$"../BalllModified".position.y -= 40
		$Node2D.rotation_degrees -= 6
		$Node2D2.rotation_degrees += 6
		if $Node2D.rotation_degrees < -60:
			rotate = false
	if rotate == false:
		if $Node2D.rotation_degrees < 0:
			$Node2D.rotation_degrees += 1
			$Node2D2.rotation_degrees -= 1
