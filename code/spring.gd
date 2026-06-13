extends Node2D

var spring_go = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$cork.global_position = $"spring/spring-top".global_position
	if Global.marble_count == true:
		spring_go = true
	if Global.marble_go == true:
		spring_go = true
	if spring_go == true:
		if $spring.scale.y >= 50:
			spring_go = false
		$spring.scale.y += 1.4
	elif $spring.scale.y >= 3:
		$spring.scale.y -= 2.01
		
