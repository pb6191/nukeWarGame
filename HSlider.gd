extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".min_value = global.minStd+1
	$".".max_value = global.maxStd+1
	$".".value = int((global.minStd+global.maxStd+2)/2)
	$".".rect_size.x = int((global.maxStd-global.minStd)/2)
	if $".".rect_size.x < 100:
		$".".rect_size.x = 100
	if $".".min_value >= $".".max_value:
		$".".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
