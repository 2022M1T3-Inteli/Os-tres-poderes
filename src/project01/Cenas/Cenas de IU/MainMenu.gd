extends Control

func _ready():
	OS.window_fullscreen = true

func _on_Button3_pressed():
	get_tree().quit() #Sai do jogo


func _on_Start_pressed():
	get_tree().change_scene("res://Cenas/Cenas de IU/EscolhaPoder.tscn") #Começa o Jogo

