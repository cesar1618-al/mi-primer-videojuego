extends Node2D

onready var interfaz = $Interfaz
onready var Creador_obstaculos = $CREADOROBSTACULOS
onready var piso = $PISO
onready var layer_menu = $Menu

const SAVE_FILE_PATH = "user://savedata.save"

var puntuar = 0 setget set_score
var mejorpuntaje = 0

func _ready():
	Creador_obstaculos.connect("obstaculo_creado", self, "_on_obstaculo_creado")
#	nuevo_juego()
	load_mejorpuntaje()

func nuevo_juego():
	self.puntuar = 0
	Creador_obstaculos.start()
	
func PLAYER_puntua():
	self.puntaje +=1
	
func set_score(nuevo_puntaje):
	puntuar = nuevo_puntaje
	interfaz.update_score(puntuar)
	
func _on_obstaculo_creado(obs):
	obs.connect("puntuar", self, "Player_puntua")


func _on_zonademuerte_body_entered(body):
	if body is PLAYER:
		if body.has_method("die"):
			body.die()


func _on_PLAYER_died():
	game_over()

func game_over():
	Creador_obstaculos.stop()
	piso.get_node("AnimationPlayer").stop()
	get_tree().call_group("obstaculos", "set_physics_process", false)
	layer_menu.init_game_over_menu(puntuar)

	if puntuar > mejorpuntaje:
		mejorpuntaje = puntuar
		save_mejorpuntaje()
	
	layer_menu.init_game_over_menu(puntuar, mejorpuntaje)

func _on_Menu_inicia_juego():
	nuevo_juego()

func save_mejorpuntaje():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(mejorpuntaje)
	save_data.close()
	
func load_mejorpuntaje():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		mejorpuntaje = save_data.get_var()
		save_data.close()
	
