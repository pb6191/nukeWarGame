extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var yCounter = 0
var initX
var currEndPt
var stdDev
var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var rng3 = RandomNumberGenerator.new()
var Xcoords = []
var tempXcoords = []
var Ycoords = []
var tempX
var myTrace
var myTraces = []
var traceFolder
var traceFolderName
var characters = 'abcdefghijklmnopqrstuvwxyz'

# Called when the node enters the scene tree for the first time.
func _ready():
	traceFolderName = generate_word(characters, 10)
	if has_node("../../Trace"):
		traceFolder = $"../../Trace".duplicate()
		traceFolder.set_name(traceFolderName)
		$"../../Trace".add_child(traceFolder)
	initX = get_node("/root/Node2D/Sprite").position.x
	currEndPt = initX
	$".".position.x = initX
	tempXcoords.push_back(initX)
	Xcoords.push_back(initX)
	$".".position.y = 500
	Ycoords.push_back(500)
	stdDev = int(get_node("/root/Node2D/HSlider").value)
	for i in global.nLines:
		Ycoords.push_back(int(500*(global.nLines-i-1)/global.nLines))
		if global.distr == 0:
			rng.randomize()
			if global.meanUpdt == 1:
				tempX = initX + int((stdDev-1)/2) - (rng.randi() % stdDev)
			else:
				tempX = tempXcoords.back() + int((stdDev-1)/2) - (rng.randi() % stdDev)
		elif global.distr == 1:
			rng2.randomize()
			if global.meanUpdt == 1:
				tempX = initX + int(rng2.randfn(0.0, (stdDev-1)/6))
			else:
				tempX = tempXcoords.back() + int(rng2.randfn(0.0, (stdDev-1)/6))
		elif global.distr == 2:
			rng.randomize()
			rng3.randomize()
			if global.meanUpdt == 1:
				if rng3.randi_range(1, 100) <= global.leftProb:
					tempX = initX + int((stdDev-1)/2) - (rng.randi() % stdDev) - int(global.bimoDist/2)
				else:
					tempX = initX + int((stdDev-1)/2) - (rng.randi() % stdDev) + int(global.bimoDist/2)
			else:
				if rng3.randi_range(1, 100) <= global.leftProb:
					tempX = tempXcoords.back() + int((stdDev-1)/2) - (rng.randi() % stdDev) - int(global.bimoDist/2)
				else:
					tempX = tempXcoords.back() + int((stdDev-1)/2) - (rng.randi() % stdDev) + int(global.bimoDist/2)
		elif global.distr == 3:
			rng2.randomize()
			rng3.randomize()
			if global.meanUpdt == 1:
				if rng3.randi_range(1, 100) <= global.leftProb:
					tempX = initX + int(rng2.randfn(0.0, (stdDev-1)/6)) - int(global.bimoDist/2)
				else:
					tempX = initX + int(rng2.randfn(0.0, (stdDev-1)/6)) + int(global.bimoDist/2)
			else:
				if rng3.randi_range(1, 100) <= global.leftProb:
					tempX = tempXcoords.back() + int(rng2.randfn(0.0, (stdDev-1)/6)) - int(global.bimoDist/2)
				else:
					tempX = tempXcoords.back() + int(rng2.randfn(0.0, (stdDev-1)/6)) + int(global.bimoDist/2)
		tempXcoords.push_back(tempX)
		Xcoords.push_back(tempX+global.offset)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if global.status == "Running":
		if yCounter < global.nLines:
			if $".".position.y >= Ycoords[yCounter+1]:
				$".".position.y -= delta*500/global.duration
				$".".position.x =  Xcoords[yCounter] + ( ($".".position.y - Ycoords[yCounter]) * (Xcoords[yCounter+1] - Xcoords[yCounter]) / (Ycoords[yCounter+1] - Ycoords[yCounter]) )
				if global.visibility == 1:
					if has_node("../../Sprite3"):
						myTrace = $"../../Sprite3".duplicate()
						myTrace.position.x = $".".position.x
						myTrace.position.y = $".".position.y
						myTrace.set_name(generate_word(characters, 10))
						myTraces.append(myTrace)
						var lastLocn = myTraces.size()
						get_node("../../Trace/"+traceFolderName).add_child(myTraces[lastLocn-1])
			else:
				yCounter += 1
		else:
			if has_node("../../Trace/"+traceFolderName):
				get_node("../../Trace/"+traceFolderName).queue_free()




func _on_Area2D_area_entered(area):
	if (area != null):
		if (area.get_parent() != null and area.get_parent().get_name() != "temp"):
			area.get_parent().queue_free()
			if has_node("../../Trace/"+traceFolderName):
				get_node("../../Trace/"+traceFolderName).queue_free()

func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word


