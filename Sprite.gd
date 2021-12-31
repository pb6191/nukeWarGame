extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var myMiss
var myMissiles = []
var characters = 'abcdefghijklmnopqrstuvwxyz'
var missiles = []
var totalDelta = 0
var executed = false
var temp2

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".position.x = int((global.minShoot+global.maxShoot)/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	totalDelta += delta
	if (int(totalDelta)%3==0 and executed == false):
		if global.target == 0:
			spawnMissiles(2)
		executed = true
	if (int(totalDelta)%3!=0):
		executed = false
	if global.target == 1:
		$"../Sprite4".visible = true
		if Input.is_action_pressed("ui_left"):
			$"../Sprite4".position.x -= delta*50
		if Input.is_action_pressed("ui_right"):
			$"../Sprite4".position.x += delta*50
		if Input.is_action_pressed("ui_up"):
			$"../Sprite4".scale.x += delta*50
		if Input.is_action_pressed("ui_down"):
			$"../Sprite4".scale.x -= delta*50


func _input(event):
	if event is InputEventMouseMotion:
		if event.position.x >= global.minShoot and event.position.x <= global.maxShoot:
			$".".position.x = event.position.x
	if event.is_action_pressed("leftClk"):
		myMiss = $"../Sprite2".duplicate()
		myMiss.set_name(generate_word(characters, 10))
		myMiss.visible = true
		myMissiles.append(myMiss)
		var lastLocn = myMissiles.size()
		$"../Missiles".add_child(myMissiles[lastLocn-1])

func spawnMissiles(howMany):
	for i in howMany: 
		if has_node("../temp"):
			temp2 = $"../temp".duplicate()
			temp2.set_name(generate_word(characters, 10))
			temp2.visible = true
			missiles.append(temp2)
			var lastLocn = missiles.size()
			$"../Incoming".add_child(missiles[lastLocn-1])
			
func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word
