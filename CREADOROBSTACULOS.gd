extends Node2D

signal obstaculo_creado(obs)

onready var temporizador = $Timer

var Obstaculo = preload("res://obstaculos.tscn")

func _ready():
	randomize()
	
func _on_Timer_timeout():
	crear_obstaculo()
	
func crear_obstaculo():
	var obstaculo = Obstaculo.instance()
	add_child(obstaculo)
	obstaculo.position.y = randi()%370 + 180 #(180-550)
	emit_signal("obstaculo_creado", obstaculo)
	

func star():
	temporizador.start()
	
func stop():
	temporizador.stop()
