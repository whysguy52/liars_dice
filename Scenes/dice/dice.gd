extends RigidBody3D

var rng
var face
var detector

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	detector = $side_detector
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	detect_side()
	pass

func shake():
	var x = rng.randf_range(-1.0,1.0)
	var y = rng.randf_range(0.5,1.0)
	var z = rng.randf_range(-1.0,1.0)
	var force = Vector3(x,y,z).normalized() * 300
	apply_force(force)
	pass

func detect_side():
	$side_detector.global_basis = Basis()
	face = $side_detector.get_collider()
	if face == null:
		return
	#$side_detector.global_transform.basis = $side_detector.global_transform.basis.orthonormalized()
