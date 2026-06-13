extends Timer
var number = 0
var placem = ''
var places = ''
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.add_theme_font_size_override("normal_font_size", 50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if int(number / 60) < 10:
		placem = '0'
	else:
		placem = ''
	if int(fmod(number, 60)) < 10:
		places = '0'
	else:
		places = ''
	$RichTextLabel.text = placem + str(int(number / 60)) + ':' + places + str(int(fmod(number, 60)))


func _on_timeout() -> void:
	number += 1
