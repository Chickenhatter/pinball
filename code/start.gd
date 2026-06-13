extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.add_theme_font_size_override("normal_font_size", 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_f'):
		get_tree().change_scene_to_file("res://scenes/pinball.tscn") 


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/pinball.tscn") 
