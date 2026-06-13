extends Area2D
var pathmove = false
var ballone_with = false
var balltwo_with = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pathmove == true:
		$"../Path2D/PathFollow2D".progress_ratio += 0.004
	if ballone_with == true:
		$"../../Balls/Ballone".global_position = $"../Path2D/PathFollow2D".global_position
		if $"../Path2D/PathFollow2D".progress_ratio > 0.98:
			pathmove = false
			ballone_with = false
			$"../Path2D/PathFollow2D".progress_ratio = 0
	if balltwo_with == true:
		$"../../Balls/Balltwo".global_position = $"../Path2D/PathFollow2D".global_position
		if $"../Path2D/PathFollow2D".progress_ratio > 0.98:
			pathmove = false
			balltwo_with = false
			$"../Path2D/PathFollow2D".progress_ratio = 0
	if ballone_with == true and balltwo_with == true:
		pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ballone":
		pathmove = true
		ballone_with = true
		Global.marble_count = true
	if body.name == "Balltwo":
		pathmove = true
		balltwo_with = true
		Global.marble_go = true
