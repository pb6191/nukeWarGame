extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".add_item("uniform")
	$".".add_item("normal")
	$".".add_item("uniform bimodal")
	$".".add_item("normal bimodal")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
