extends RigidBody2D
class_name PLAYER

signal died

export var ROBOT_FORCE = -200

onready var animator = $AnimationPlayer

var inicio = false
var vivo = true
const MAX_GRD = -30

func _physics_process(delta):
	if Input.is_action_just_pressed("clic") && vivo:
		if !inicio:
			start()
		clic()
	if rotation_degrees <= MAX_GRD:
		angular_velocity = 0
		rotation_degrees = MAX_GRD
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 3
		else: 
			angular_velocity = 0

func start():
	if inicio: return
	inicio= true
	gravity_scale = 5.0
	animator.play("clic")
	
func clic():
	linear_velocity.y = ROBOT_FORCE
	angular_velocity = -8.0


func die():
	if !vivo: return
	vivo = false
	animator.stop()
	emit_signal("died")
	
	
