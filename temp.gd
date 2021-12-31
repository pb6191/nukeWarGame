extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$".".position = Vector2(rng.randi_range(100, 900), 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".position.y += delta*10



func _on_Area2D_area_entered(area):
	if (area != null):
		if (area.get_parent() != null and area.get_parent().get_name()!= "Sprite2"):
			area.get_parent().queue_free()
