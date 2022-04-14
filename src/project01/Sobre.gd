extends Control


func _ready():
	pass


func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/MainMenu.tscn")


func _on_Github_pressed():
	OS.shell_open("https://github.com/2022M1T3/Projeto5")
