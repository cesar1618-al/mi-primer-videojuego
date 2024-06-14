extends CanvasLayer

signal inicia_juego

onready var mensaje_inicio = $MenuInicio/Startmensaje
onready var tween = $Tween
onready var label_puntaje = $MenuGameOver/VBoxContainer/Puntaje
onready var label_puntaje_alto = $MenuGameOver/VBoxContainer/PuntajeAlto
onready var game_over_menu = $MenuGameOver

var juego_iniciado = false

func _input(event):
	if event.is_action_pressed("clic") && ! juego_iniciado:
		emit_signal("inicia_juego")
		tween.interpolate_property(mensaje_inicio, "modulate:a", 1, 0, 0.5)
		tween.start()
		juego_iniciado = true



func init_game_over_menu(puntuar, mejorpuntaje):
	label_puntaje.text = "PUNTAJE: " + str(puntuar)
	label_puntaje_alto.text = "MEJOR PUNTAJE: " + str(mejorpuntaje)
	game_over_menu.visible = true

func _on_BotonReiniciar_pressed():
	get_tree().reload_current_scene()
