extends HBoxContainer

var diceList
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	diceList = $"../../../Player1/DiceController".diceList
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update():
	for die in diceList:
		var side = die.detector.get_collider().name.to_int()
		get_child(die.name.to_int() - 1).frame = side - 1
		#should i sort?
	pass
