extends Control

onready var intro = $VideoPlayer


func _ready():
	OS.window_fullscreen = false
	OS.window_maximized = false
	OS.window_borderless = false

func _on_Button3_pressed():
	get_tree().quit() #Sai do jogo


func _on_Start_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/SelecionarAvatar.tscn") #Começa o Jogo


func _on_VideoPlayer_finished():
	intro.hide()
#Finaliza e esconde o vídeo de introdução
