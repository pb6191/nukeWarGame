extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	global.distr = $"../OptionButton".selected
	global.nLines = $"../SpinBox".value
	global.meanUpdt = $"../OptionButton2".selected
	global.offset = $"../SpinBox2".value
	global.duration = $"../SpinBox3".value
	global.visibility = $"../OptionButton3".selected
	global.minStd = $"../SpinBox4".value
	global.maxStd = $"../SpinBox5".value
	global.minShoot = $"../SpinBox6".value
	global.maxShoot = $"../SpinBox7".value
	global.bimoDist = $"../SpinBox8".value
	global.leftProb = $"../SpinBox9".value
	global.target = $"../OptionButton4".selected
	global.status = "Running"
	get_tree().change_scene("res://Node2D.tscn")
