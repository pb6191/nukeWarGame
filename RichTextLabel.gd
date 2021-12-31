extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".text = "Current Std Dev:\n"+ str(int((global.minStd+global.maxStd+2)/2)-1) +"\n" +"Payoff for hit:\n" + str((int((global.minStd+global.maxStd+2)/2)-1)/100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider_value_changed(value):
	$".".text = "Current Std Dev:\n"+ str(value-1) +"\n" +"Payoff for hit:\n" + str((value-1)/100)
