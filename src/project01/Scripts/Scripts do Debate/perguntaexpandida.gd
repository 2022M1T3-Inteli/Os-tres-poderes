extends Control

func _ready():
	pass 

func _on_Recusar_pressed():
	get_tree().reload_current_scene()


func _on_Aceitar_pressed():
	DebateGlobal.aceitar = true
