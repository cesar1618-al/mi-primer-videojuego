extends CanvasLayer

onready var label_puntaje = $Puntaje

func update_score(nuevo_puntaje):
	label_puntaje.text = str(nuevo_puntaje)
	
	
