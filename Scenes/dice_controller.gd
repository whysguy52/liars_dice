extends Node3D

var diceList
var rollCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	diceList = get_children()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func roll_children():
	if rollCount == 5:
		$"../UserControls/VBoxContainer/Bottom/NextActionBtn".flat = false
		$"../UserControls/VBoxContainer/Bottom/NextActionBtn".disabled = false
		rollCount = 0
		return
	for i in diceList:
		i.shake()
	rollCount = rollCount + 1
	$"../../UserControls/VBoxContainer/Bottom/Roll_timer".start()
	pass
