extends Node3D

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("toHome")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_next_btn_pressed():
	counter = counter + 1
	counter = counter % 3

	match counter:
		0:
			$"../../UserControls/VBoxContainer/Dice_Display".update()
			$AnimationPlayer.play("toHome")
		1:
			$"../../UserControls/VBoxContainer/Bottom/NextActionBtn".flat = true
			$"../../UserControls/VBoxContainer/Bottom/NextActionBtn".disabled = true
			$AnimationPlayer.play("toShake")
		2:
			$"../../UserControls/VBoxContainer/Bottom/ShakeBtn".flat = true
			$"../../UserControls/VBoxContainer/Bottom/ShakeBtn".disabled = true
			$AnimationPlayer.play("toCast")
	pass


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"toHome":
			$"../../UserControls/VBoxContainer/Bottom/NextActionBtn".text = "shake"
		"toShake":
			$"../../UserControls/VBoxContainer/Bottom/NextActionBtn".text = "cast"
			$"../../UserControls/VBoxContainer/Bottom/ShakeBtn".flat = false
			$"../../UserControls/VBoxContainer/Bottom/ShakeBtn".disabled = false
		"toCast":
			$"../../UserControls/VBoxContainer/Bottom/NextActionBtn".text = "reveal"
	pass # Replace with function body.
