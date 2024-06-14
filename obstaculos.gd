extends Node2D

signal puntuar

const velocidad = 215

func _physics_process(delta):
	position.x += -velocidad * delta
	if global_position.x <= -200:
		global_position.x = 500


func _on_TUBO_body_entered(body):
	if body is PLAYER:
		print("perdiste")


func _on_zonapuntos_body_exited(body):
	if body is PLAYER:
		print("sumaste un punto")
