extends Control

func _ready():
	pass 

func _input(event):
	if event.is_action_pressed("proximo"): 
		var instruct = true
		if instruct: 
			$Objeto.hide()
			$Prox.hide()
			$Iniciar.show()
			$Instruct.show()


func _on_Iniciar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Minigames/Voto Impresso/Game.tscn")
