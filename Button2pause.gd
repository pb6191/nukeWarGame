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


func _on_Button2_pressed():
	var justClicked = 0
	if $"../Button2".text == "Pause" and justClicked == 0:
		$"../Button2".text = "Resume"
		global.status = "Paused"
		justClicked = 1
	if $"../Button2".text == "Resume" and justClicked == 0:
		$"../Button2".text = "Pause"
		justClicked = 1
		global.status = "Running"
